> [!WARNING]
> Este projeto visa representar, para fins didáticos e avaliativos, a API em Python do algoritmo de aprendizagem de máquina que será consumida pelo projeto Flutter **CarAvalia**.
>
> Ele também tem como intuito servir como uma alternativa local para a execusão desta funcionalidade.

# Requisitos

- Python 3.11.3

- `pip` deve estar disponível.

<br/>

# Instruções

- Pelo terminal, navegue até o diretório **_cloud/machine-learning**.

- Será necessário criar um ambiente virtual para trabalhar com o projeto Python segundo os requisitos e dependencias encontrados no arquivo [requirements.txt](./requirements.txt). Então prossiga com os seguintes comandos:

Criando o ambiente virtual

```bash
python -m venv venv
```

Ativando o ambiente virtual em dispositivo Windows

```ps1
venv\Scripts\activate
```

Ativando o ambiente virtual em dispositivo Linux

```bash
source venv/bin/activate
```

> [!NOTE]
> É possivel que você encontre algum problema ao ativar o ambiente devido a alguma configuração de segurança de seu sistema operacional. Leia atentamente as instruções que serão exibidas no terminal e em último caso, considere desativar temporariamente as políticas de segurança de execução de scripts para poder executar o comando.

- Instale as dependencias através do arquivo [requirements.txt](./requirements.txt)

```bash
pip install -r requirements.txt
```

> [!NOTE]
> Sempre confira se o arquivo requirements.txt está presente. Para atualizar novas dependências, utilize o comando:
>
> ```bash
> pip freeze > requirements.txt
> ```

- Para desativar o ambiente virtual, utilize o comando:

```bash
deactivate
```

- Para executar o servidor Python:

```bash
python app.py
```

- Ele estará rodando em http://127.0.0.1:5000

> [!NOTE]
> É possível qua a aplicação não reconheça os imports do código devido a configurações do interpretador Python do VS Code.
>
> - Para solucionar esse problema, acesse as configurações do VS Code (Settings) e as abra em formato JSON (Open Settings (JSON))
>
> - Adicione o seguinte script baseado no caminho para o seu ambiente virtual:
>
> ```json
> {
>     // Outras configurações...
>    
>     // Para Windows
>     "python.pythonPath": "caminho/para/seu/venv/Scripts/python.exe",
>
>     // Para Linux
>     // "python.pythonPath": "caminho/para/seu/venv/bin/python",
>
>     // Caminho para o diretório pai do seu ambiente virtual. No caso "machine-learning"
>     "python.venvPath": "caminho/para/seu/venv"
> }
> ```
>
> - Salve as alterações e reinicie o VS Code
>
> - Com o atalho `Ctrl` + `Shift` + `p`, altere o interpretador Python para o seu ambiente virtual.

> [!WARNING]
> Esse é um servidor de desenvolvimento, não o utilize em um ambiente de produção.

<br/>

# Estrutura

```
PI--5-V2/
├── _cloud/
│   └── machine-learning/
│       ├── static/                         # Diretório para armazenar arquivos estáticos
│       |   └── styles.css                  # Arquivo de estilo
│       ├── templates/                      # Diretório para armazenar arquivos HTML
│       |   └── home.html                   # Página inicial do servidor
│       ├── venv/                           # Ambiente virtual
│       ├── app.py                          # Inicializador do servidor Python
│       ├── requirements.txt                # Dependências do projeto
│       ├── README.md                       # Documentação do projeto
│       ├── data/                           # Diretório para armazenar os dados
│       │   └── dataset.arff                # Arquivo de dados de treinamento
│       ├── notebooks/                      # Diretório para armazenar análises
│       │   └── data_exploration.ipynb      # Exemplo de jupyter notebook
│       ├── src/                            # Diretório para armazenar o código fonte
│       │   ├── __init__.py                 # Define o diretório src como um pacote
│       │   ├── data_preprocessing.py       # Código para pré-processamento dos dados
│       │   ├── model.py                    # Código para definir e treinar o modelo
│       │   └── main.py                     # Ponto de entrada para o aplicativo
│       └── reports/                        # Diretório para armazenar relatórios
│           └── report.txt                  # Relatório de resultados
```