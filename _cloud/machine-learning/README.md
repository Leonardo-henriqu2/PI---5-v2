> [!WARNING]
> Este projeto visa representar, para fins didáticos e avaliativos, a API em Python do algoritmo de aprendizagem de máquina que será consumida pelo projeto Flutter **CarAvalia**.
>
> Ele também tem como intuito servir como uma alternativa local para a execusão desta funcionalidade. Mas é importante deixar claro que este é um servidor de desenvolvimento e não deve ser utilizado em um ambiente de produção.

# Desenvolvimento da Aprendizagem de Máquina
> [!NOTE]
> O precesso descrito neste documento representa a sprint 2 do desenvolvimento do projeto, composto por:
> - Definição de Algoritmos: Onde há a escolha do algoritmo de aprendizagem de máquina que será utilizado (classificação ou clusterização);
> - Treinamento de Modelos: Onde fazemos a implementação e o treinamento dos modelos utilizando os dados disponíveis;
> - Integração com o Back-End: Onde garantimos que os modelos de machine learning se integrem corretamente com a API RESTful, fornecendo respostas em formato JSON.

<br/>

## Sumário

1. [Introdução](#introdução)

2. [Linguagem de Programação Utilizada](#linguagem-de-programação-utilizada)

3. [Configurações Necessárias](#configurações-necessárias)

   3.1. [Requisitos](#requisitos)

   3.2. [Instruções](#instruções)

4. [Características do Conjunto de Dados](#características-do-conjunto-de-dados)

   4.1. [Analise do Dataset](#analise-do-dataset) 

5. [Estrutura do Projeto](#estrutura-do-projeto)

   5.1 [Pré-processamento dos Dados](#pré-processamento-dos-dados)

   5.2. [Modelo de Aprendizagem](#modelo-de-aprendizagem)

   5.3. [Inicializador da Aplicação](#inicializador-da-aplicação)

<br/>

## Introdução

Muito das escolhas do consceito do projeto, o dataset para a aprendizagem de máquina e os algoritmos para efetuar o seu treinamento, provem do estudo didático do repositório [dataset_exploration](https://github.com/AelMartins/dataset_exploration) que utiliza o dataset [Car Evaluation](https://archive.ics.uci.edu/dataset/19/car+evaluation) disponibilizado pela página [UC Irvine Machine Learning Repository](http://archive.ics.uci.edu/) que se encontra no diretório /data com o nome [car.arff](./data/car.arff).

<br/>

## Linguagem de Programação Utilizada
A linguagem de programação que será utilizada é [Python](https://www.python.org/). Muito utilizada em aprendizado de máquina e conceitos de IA no geral.

Caso interessado, você pode encontrar mais sobre essa linguagem nas páginas oficiais:

- [Documentação](https://www.python.org/doc/)
- [Guia do Desenvolvedor](https://devguide.python.org/)
- [Guia para Iniciantes](https://wiki.python.org/moin/BeginnersGuide)

<br/>

## Configurações Necessárias

### Requisitos

- Python 3.11.3
- `pip` deve estar disponível.

<br/>

### Instruções

- Pelo terminal, navegue até o diretório **_cloud/machine-learning**.

- Será necessário criar um ambiente virtual para trabalhar com o projeto Python segundo os requisitos e dependencias encontrados no arquivo [requirements.txt](./requirements.txt). Então prossiga com os seguintes comandos:

- Criando o ambiente virtual

```bash
python -m venv venv
```

- Ativando o ambiente virtual em dispositivo Windows

```ps1
venv\Scripts\activate
```

- Ativando o ambiente virtual em dispositivo Linux

```bash
source venv/bin/activate
```

> [!NOTE]
> É possivel que você encontre algum problema ao ativar o ambiente devido a alguma configuração de segurança de seu sistema operacional. Leia atentamente as instruções que serão exibidas no terminal e **em último caso**, considere desativar temporariamente as políticas de segurança de execução de scripts para poder executar o comando.

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

- Ele estará rodando em **http://localhost:5000**

> [!NOTE]
> É possível qua a aplicação não reconheça os imports do código devido a configurações do interpretador Python do VS Code.
>
> - Para solucionar esse problema, acesse as configurações do VS Code (Settings) e as abra em formato JSON (Open Settings (JSON))
>
> - Adicione o seguinte script ajustando o caminho para o seu ambiente virtual:
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
> ! Lembre-se de remover os comentários antes de salvar as alterações.
>
> - Salve as alterações e reinicie o VS Code
>
> - Com o atalho `Ctrl` + `Shift` + `p`, altere o interpretador Python para o seu ambiente virtual.

<br/>

## Características do Conjunto de Dados

Nome: Car Evaluation Database

Descrição: Derivado de um modelo hierárquico simples de decisão, este banco de dados pode ser útil para testar métodos de indução construtiva e descoberta de estrutura.

Tipo: Multivariado

Tarefas Associadas: Classificação

Tipo de Atributo: Categórico

Número de Instâncias: 1728

Número de Atributos: 6

> [!NOTE]
> O dataset não possui dados faltantes.
<br/>

O Car Evaluation Database foi derivado de um modelo hierárquico simples de decisão desenvolvido originalmente para a demonstração do DEX, conforme descrito no trabalho de M. Bohanec e V. Rajkovic: "Expert system for decision making," publicado na Sistemica 1(1), pp. 145-157, 1990. Omodelo avalia carros de acordo com a seguinte estrutura de conceitos:

- CAR:Aceitabilidade do carro
  -  PRICE: Preço geral
    - buying: Preço de compra. Categorizado como:
      - vhigh (muito alto);
      - high(alto);
      - med(médio);
      - low(baixo).
    - maint: Custo de manutenção. Categorizado como:
      - vhigh (muito alto);
      - high(alto);
      - med(médio);
      - low(baixo).
  - TECH:Características técnicas
    - COMFORT:Conforto
      - doors: Número de portas. Categorizado como:
        - 2;
        - 3;
        - 4;
        - 5more(5oumais).
      - persons: Capacidade de pessoas. Categorizado como:
        - 2;
        - 4;
        - more(mais).
      - lug_boot: Tamanho do porta-malas. Categorizado como:
        - small (pequeno);
        - med(médio);
        - big(grande).
    - safety: Segurança estimada do carro. Categorizado como:
        - low;
        - med;
        - high.
  
Os Rótulos de Classe são escritos da seguinte maneira:

- unacc: Inaceitável
- acc: Aceitável
- good:Bom
- vgood: Muito bom

Os atributos de entrada estão escritos em minúsculas. Além do conceito alvo (CAR), o modelo inclui três conceitos intermediários: PRICE, TECH, e COMFORT. Cada conceito no modelo original está relacionado aos seus descendentes de nível inferior por um conjunto de exemplos. O Car Evaluation Database contém exemplos com a informação estrutural removida, ou seja, relaciona diretamente CAR aos seis atributos de entrada: buying, maint, doors, persons, lug_boot, safety.

Para uma visualização mais clara da estrura dos dados, imagine a seguinte tabela:

|     | buying | maint | doors | persons | lug_boot | safety | class | 
|-----|--------|-------|-------|---------|----------|--------|-------|
| Car | vhigh  | vhigh |   2   |    2    |  small   |   low  | unacc |

> [!NOTE]
> Baseado no arquivo [car.arff](./data/car.arff)
> ```
> @relation car
>
> @attribute buying {vhigh,high,med,low}
> @attribute maint {vhigh,high,med,low}
> @attribute doors {2,3,4,5more}
> @attribute persons {2,4,more}
> @attribute lug_boot {small,med,big}
> @attribute safety {low,med,high}
> @attribute class {unacc,acc,good,vgood}
> 
> @data
> vhigh,vhigh,2,2,small,low,unacc
> ```

<br/>

### Analise do Dataset

O conjunto de dados foi minunciosamente analisado e tratado para ser utilizado no treinamento do algoritmo de aprendizagem. O relatório deste processo está registrado no Jupyter Notebook **[data_exploration.ipynb](./notebooks/data_exploration.ipynb)**.

Um Jupyter Notebook ajuda a entender melhor os dados e preparar um caminho mais sólido para o desenvolvimento do modelo de aprendizado de máquina. Nele encontramos:

- **Análise Visual**: Com gráficos e visualizações dos dados, o que ajuda a entender padrões, tendências e anomalias.

- **Pré-processamento de Dados**: Experimentamos diferentes técnicas de limpeza, transformação e preparação dos dados, como tratamento de valores ausentes e normalização.

- **Estatísticas Descritivas**: Obtemos estatísticas básicas (como média, mediana, desvio padrão, etc.), que foram úteis para entender a distribuição dos dados.

- **Seleção de Recursos**: Indentificamos quais atributos (features) são mais relevantes o modelo, potencialmente melhorando a performance do algoritmo.

- **Documentação**: Documentamos o processo de exploração, mantendo notas e explicações junto com o código e as visualizações, sendo útil para revisões e compartilhamento.

- **Interatividade**: Jupyter Notebooks permitem executar células de código de forma interativa, facilitando experimentações rápidas.

> [!NOTE]
> Todas as dependencias necessárias para carregar o Jupyter Notebook já estão registradas no **requirements.txt** do ambiente virtual do Python.

<br/>

## Estrutura do Projeto

```
PI--5-V2/
├── _cloud/
│   └── machine-learning/
│       ├── data/                           # Diretório para armazenar os dados
│       │   └── car.arff                    # Dataset de treinamento
│       ├── notebooks/                      # Diretório para armazenar análises
│       │   └── data_exploration.ipynb      # Jupyter notebook
│       ├── src/                            # Diretório para armazenar o código fonte
│       │   ├── __init__.py                 # Define o diretório src como um pacote
│       │   ├── data_preprocessing.py       # Código para pré-processamento dos dados
│       │   ├── mlp_model.pkl               # Parâmetros do modelo treinado em model.py
│       │   └── model.py                    # Código para definir e treinar o modelo
│       ├── static/                         # Diretório para armazenar arquivos estáticos
│       |   └── styles.css                  # Arquivo de estilo
│       ├── templates/                      # Diretório para armazenar arquivos HTML
│       |   └── home.html                   # Página inicial do servidor
│       ├── venv/                           # Ambiente virtual
│       ├── app.py                          # Inicia o servidor Python e define as portas
│       ├── README.md                       # Documentação do projeto
│       └── requirements.txt                # Dependências do projeto
```

<br/>

### Pré-processamento dos Dados

O arquivo **[data_preprocessing.py](./src/data_preprocessing.py)** efetua o pré-processamento que foi analizado em data_exploration.ipynb para normalizar os dados e corrigir discrepâncias.

Nele há duas funções. Uma que importa o dataset e efetua um tratamento global para ser utilizado no treinamento do algoritmo e gerar um modelo ([mlp_model.pkl](./src/mlp_model.pkl)) para ser importado independentemente. E outra para tratar as requisições feita no servidor utilizado o modelo gerado anteriormente como base.

<br/>

### Modelo de Aprendizagem

Foi escolhido o algoritmo **Algoritmo Multilayer Perceptron (MLP)** como meio de aprendizagem de máquina.

O arquivo **[model.py](./src/model.py)** é responsável pelo treinamento com os dados obtidos no data_preprocessing.py e foi definido com as seguintes configurações de aprendizagem (**MLPClassifier**):

- Camadas ocultas               = (13, 9)
- Learning Rate                 = 0.09
- Training Time                 = 500
- e valor de aleatoridade fixo  = 42

Estas configurações atingiram uma acurácia de 98.03% dos dados totais e 100% de acertos para a classe acc (Aceitável), como é possivel observar na tabela a seguir:

**Matriz de Confusão**

acc | good | unacc | vgood |              |
----|------|-------|-------|--------------|
237 |  0   |   0   |   0   | **\| acc**   |
 5  | 230  |   0   |   0   | **\| good**  |
 2  |  0   |  269  |   0   | **\| unacc** |
 5  |  8   |   0   |  264  | **\| vgood** |

> [!NOTE]
> Os parâmetros que foram definidos no treinamento do modelo são armazenados no mlp_model.pkl

<br/>

## Inicializador da Aplicação

O arquivo **[app.py](./src/app.py)** inicia o servidor Python e abre as portas para interagir com o algoritmo.

Para obter uma predição do algoritmo, basta enviar para o link http://localhost:5000/predict um JSON como:

```json
{
    "buying": "vhigh",
    "maint": "low",
    "doors": "4",
    "persons": "more",
    "lug_boot": "big",
    "safety": "high"
}
```

E a resposta será:

```json
{
  "prediction": [
    "acc"
  ]
}
```
