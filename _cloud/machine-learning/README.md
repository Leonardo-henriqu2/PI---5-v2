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