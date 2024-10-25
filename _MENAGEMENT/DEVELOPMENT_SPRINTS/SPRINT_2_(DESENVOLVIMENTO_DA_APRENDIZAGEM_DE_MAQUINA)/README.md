# Sprint 2: Desenvolvimento da Aprendizagem de Máquina

> [!NOTE]
> - Definição de Algoritmos: Escolha dos algoritmos de aprendizagem de máquina a serem utilizados (classificação ou clusterização).
> - Treinamento de Modelos: Implementação e treinamento dos modelos utilizando os dados disponíveis.
> - Integração com o Back-End: Garantir que os modelos de machine learning se integrem corretamente com a API RESTful, fornecendo respostas em formato JSON.

***
<br/>

## Sumário

1. [Introdução](#introdução)

2. [Características do Conjunto de Dados](#características-do-conjunto-de-dados)

3. [Sobre os Algoritmos](#sobre-os-algoritmos)

4. [Código de Desenvolvimnto](#código-de-desenvolvimnto)

<br/>

## Introdução

Muito das escolhas do consceito do projeto, o dataset para a aprendizagem de máquina e os algoritmos para efetuar o seu treinamento, provem do estudo didático do repositório [dataset_exploration](https://github.com/AelMartins/dataset_exploration) que utiliza o dataset [Car Evaluation](https://archive.ics.uci.edu/dataset/19/car+evaluation) disponibilizado pela página [UC Irvine Machine Learning Repository](http://archive.ics.uci.edu/) que se encontra na raiz desta pasta com o nome [car.arff](./car.arff).

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

<br/>

## Sobre os Algoritmos

Ainda se baseando nas pesquisas do repositório, aqueles que obtiveram o melhor desempenho foram, em ordem decrescente:

1. **Algoritmo Multilayer Perceptron (MLP)**. Com uma porcentagem de acerto equivalente a 99.99%, mas que se manteve constante e infelizmente levantou a hipótese do algoritmo ter decorado as respostas.

2. **LMT**. Com 98.78% de acertos.

3. **PART**. Com 95.77% de acertos.

Os três são bem diferentes e serão considerados como possíveis candidatos para serem o algoritmo de nossa inteligência, dependendo da complexidade.

<br/>

## Código de Desenvolvimnto

A linguagem de progamação que será utilizada é [Python](https://www.python.org/).

Caso interessado, você pode encontrar mais sobe essa linguagem nas páginas oficiais:

- [Documentação](https://www.python.org/doc/)
- [Guia do Desenvolvedor](https://devguide.python.org/)
- [Guia para Iniciantes](https://wiki.python.org/moin/BeginnersGuide)

Os tópicos e exemplos de código que devemos aplicar em  nossa aplicação se encontram no aquivo: [pre_processamento.ipynb](./pre_processamento.ipynb) 