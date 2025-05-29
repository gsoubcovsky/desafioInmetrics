import xml.etree.ElementTree as ET
import os
import sqlite3

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Caminhos para os arquivos de resultado
CAMINHOS = {
    "WEB": os.path.join(BASE_DIR, "../web/results/output.xml"),
    "API": os.path.join(BASE_DIR, "../api/results/output.xml")
}

# Caminho para o banco
CAMINHO_DB = os.path.join(BASE_DIR, "resultados_execucao.db")

# Conexão com o banco
conn = sqlite3.connect(CAMINHO_DB)
cursor = conn.cursor()

# Criação das duas tabelas
cursor.execute('''
    CREATE TABLE IF NOT EXISTS execucoes_web (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        suite TEXT,
        total_testes INTEGER,
        testes_passaram INTEGER,
        testes_falharam INTEGER,
        inicio TEXT,
        fim TEXT,
        caminho_arquivo TEXT
    )
''')

cursor.execute('''
    CREATE TABLE IF NOT EXISTS execucoes_api (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        suite TEXT,
        total_testes INTEGER,
        testes_passaram INTEGER,
        testes_falharam INTEGER,
        inicio TEXT,
        fim TEXT,
        caminho_arquivo TEXT
    )
''')

def processar_resultado(projeto, caminho):
    if not os.path.exists(caminho):
        print(f"[!] Arquivo não encontrado: {caminho}")
        return []

    tree = ET.parse(caminho)
    root = tree.getroot()

    resultados = []

    # Itera apenas pelas suítes que têm ao menos um <test>
    for suite in root.iter('suite'):
        if suite.find('test') is None:
            continue

        suite_name = suite.attrib.get('name', 'Desconhecida')
        tests = suite.findall('test')
        total = len(tests)
        passed = failed = 0

        # Conta status individuais de cada <test>
        for test in tests:
            status_elem = test.find('status')
            status = (status_elem.attrib.get('status','').upper() 
                      if status_elem is not None else '')
            if status == "PASS":
                passed += 1
            elif status == "FAIL":
                failed += 1

        # Pega o status final da suíte (direct child <status>)
        suite_status_elem = suite.find('status')
        suite_status = (suite_status_elem.attrib.get('status','').upper() 
                        if suite_status_elem is not None else '')

        # Se a suíte como um todo falhou, contamos todos os testes como falhados
        if suite_status == "FAIL":
            passed = 0
            failed = total

        # Extrai timestamps de início/fim da suíte
        if suite_status_elem is not None:
            inicio = suite_status_elem.attrib.get('starttime',
                       suite_status_elem.attrib.get('start',''))
            fim    = suite_status_elem.attrib.get('endtime',
                       suite_status_elem.attrib.get('end',
                         suite_status_elem.attrib.get('elapsed','')))
        else:
            inicio = fim = ''

        # Insere no banco
        cursor.execute(f'''
            INSERT INTO execucoes_{projeto.lower()} (
                suite, total_testes, testes_passaram, testes_falharam,
                inicio, fim, caminho_arquivo
            ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', (
            suite_name,
            total,
            passed,
            failed,
            inicio,
            fim,
            caminho
        ))

        resultados.append({
            "projeto": projeto,
            "suite": suite_name,
            "total": total,
            "passed": passed,
            "failed": failed,
            "inicio": inicio,
            "fim": fim
        })

    return resultados

# Processa WEB e API
resumos = []
for projeto, caminho in CAMINHOS.items():
    resumos.extend(processar_resultado(projeto, caminho))

conn.commit()
conn.close()

# Exibe resumo no terminal
print("\n✅ Resumo das execuções registradas:\n")
for r in resumos:
    print(f"Projeto: {r['projeto']}")
    print(f"Suite: {r['suite']}")
    print(f"Total de Testes: {r['total']}")
    print(f"Passaram: {r['passed']} | Falharam: {r['failed']}")
    print(f"Início: {r['inicio']} | Fim: {r['fim']}")
    print("-" * 50)