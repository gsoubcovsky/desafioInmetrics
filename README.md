# 🧪 Robot Framework Automation Suite

Este repositório contém uma suíte de testes automatizados construída em **BDD (Behavior Driven Development)** utilizando a **sintaxe Gherkin** e o **Robot Framework** como base de automação. Os testes estão organizados em dois módulos: **API** e **Web**, com foco no site e nas APIs do *Advantage Online Shopping*.

---

## 🌐 Ambiente de Testes

Todo o projeto foi desenvolvido sobre:

- 🌍 Website: [https://advantageonlineshopping.com/#/](https://advantageonlineshopping.com/#/)
- 📘 API Docs: [https://www.advantageonlineshopping.com/api/docs/](https://www.advantageonlineshopping.com/api/docs/)

---

## 🧰 Funcionalidades

- 🔐 Criação e exclusão de contas (via API)
- 📡 Geração de token de autenticação (via API)
- 🛒 Busca e adição de produtos ao carrinho (via Web/Selenium)
- 💳 Checkout com SafePay e MasterCredit
- ✅ Verificações visuais e textuais da interface
- 📦 Armazenamento de logs e relatórios no banco SQLite
- 📄 Evidências automáticas: `log.html`, `report.html`, `output.xml`

---

## ⚙️ Tecnologias Utilizadas

- **Robot Framework** (principal linguagem de automação)
- **Gherkin** para escrita de testes no estilo BDD
- **Python** para scripts auxiliares (ex: salvamento no banco)
- **SeleniumLibrary** para testes Web
- **RequestsLibrary** para testes de API
- **SQLite3** para persistência dos resultados

---

## 📦 Requisitos

- Python 3.10+
- Google Chrome
- Chrome WebDriver compatível

---

## 📥 Instalação

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/nome-do-repo.git
cd nome-do-repo
```

2. Crie um ambiente virtual (opcional):

```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows
```

3. Instale as dependências:

```bash
pip install -r requirements.txt
```

---

## 🚀 Execução dos Testes

### 🔹 Testes API

```bash
cd api
robot -d results tests/
```

### 🔹 Testes Web

```bash
cd web
robot -d results tests/
```

Os arquivos de evidência serão gerados automaticamente em `api/results` e `web/results`:
- `log.html`
- `report.html`
- `output.xml`

---

## 💾 Banco de Dados

Após a execução, os resultados são gravados automaticamente em um banco de dados SQLite.

- 📂 Script responsável: `utils/salvar_resultados.py`
- 📘 Banco gerado: `execution_results.db`
- 🔁 Integração automática via `Suite Teardown`

A base armazena:
- Caminhos dos relatórios
- Status da execução
- Data e hora
- Módulo executado (API ou Web)

---

## ⚠️ Observações

- O site de testes pode bloquear o IP após várias execuções. Utilize VPN, proxies ou rede móvel (4G) para evitar limitações.
- O tempo de execução pode variar conforme a rede e o ambiente local.
- As evidências são salvas automaticamente para auditoria e rastreabilidade.

---

## 📞 Suporte

Para dúvidas ou sugestões, abra uma *issue* ou entre em contato via [gsoub.lima@gmail.com].

---