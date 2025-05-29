import os
import shutil
import sqlite3
import xml.etree.ElementTree as ET
from datetime import datetime

# Configurações
paths = [
    ("api/results", "API"),
    ("web/results", "WEB")
]
banco_dados = "execucoes_teste.db"
pasta_destino = "logs_salvos"

# Criação do banco e tabela
conn = sqlite3.connect(banco_dados)
cursor = conn.cursor()
cursor.execute("""
CREATE TABLE IF NOT EXISTS execucoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    origem TEXT,
    nome_teste TEXT,
    status TEXT,
    data_execucao TEXT,
    caminho_log TEXT,
    caminho_report TEXT
)
""")

# Função para processar resultados
def processar_resultado(pasta, origem):
    output_xml = os.path.join(pasta, "output.xml")
    log_html = os.path.join(pasta, "log.html")
    report_html = os.path.join(pasta, "report.html")

    if not os.path.exists(output_xml):
        print(f"[!] Arquivo não encontrado: {output_xml}")
        return

    tree = ET.parse(output_xml)
    root = tree.getroot()

    # Nome e data da suite
    suites = root.findall(".//suite")
    data_execucao = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    for suite in suites:
        suite_name = suite.attrib.get("name")
        tests = suite.findall(".//test")
        for test in tests:
            test_name = test.attrib.get("name")
            status = test.find("status").attrib.get("status")

            # Copiar log/report com nome único
            destino_log = f"{pasta_destino}/{origem}_{test_name}_log.html"
            destino_report = f"{pasta_destino}/{origem}_{test_name}_report.html"
            shutil.copy(log_html, destino_log)
            shutil.copy(report_html, destino_report)

            # Inserir no banco
            cursor.execute("""
                INSERT INTO execucoes (origem, nome_teste, status, data_execucao, caminho_log, caminho_report)
                VALUES (?, ?, ?, ?, ?, ?)
            """, (origem, test_name, status, data_execucao, destino_log, destino_report))
            print(f"[✓] Teste '{test_name}' ({origem}) salvo no banco.")

# Cria pasta de logs se não existir
os.makedirs(pasta_destino, exist_ok=True)

# Processa todas as pastas configuradas
for path, origem in paths:
    processar_resultado(path, origem)

conn.commit()
conn.close()
print("\n[✓] Todos os resultados foram salvos no banco.")