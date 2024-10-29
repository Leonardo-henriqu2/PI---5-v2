> [!WARNING]
> O diretórrio _cloud representa o conteúdo disposto em nuvem para a aplicação de forma local, por motivos didáticos e como uma forma alternativa de executar o projeto.
>
> É importante deixar claro que seu conteúdo possui apenas propósitos de desenvolvimento e não deve ser utilizado em um ambiente de produção.

# Desenvolvimento do Back-End

> [!NOTE]
> O precesso descrito neste documento representa a sprint 1 do desenvolvimento do projeto, composto por:
> - Configuração do Ambiente: Onde descrevemos a preparação do ambiente de desenvolvimento para o back-end **hospedado em nuvem** pública;
> - Desenvolvimento de API RESTful: Onde descrevemos a criação das rotas e funcionalidades da(s) API(s), garantindo que o back-end funcione como um classificador ou clusterizador, preditando uma conclusão através de um algoritmo de aprendizagem de máquina e armazenando dados necessários em um banco de dados.

<br/>

## Sumário

1. [Introdução](#introdução)

   1.1 [Estrutura do Diretório](#estrutura-do-diretório)

3. [Linguagens de Programação Utilizadas](#linguagens-de-programação-utilizadas)

4. [Configurações da Nuvem](#configurações-da-nuvem)

   3.1. [Requisitos](#requisitos)

   3.2. [Processo de Criação](#processo-de-criação)

<br/>

## Introdução

Utilizar uma nuvem pública para prover o back-end de nossa aplicação é o requisito principal da matéria-chave de todo o projeto integrador do quinto semestre. Portanto, todo o seu processo de criação e configuração foi baseado no que, nós alunos, aprendemos em sala de aula.

Utilizaremos a plataforma de computação em nuvem executada pela Microsoft, **[Microsoft Azure](https://azure.microsoft.com/pt-br/free/search/?ef_id=_k_Cj0KCQjwj4K5BhDYARIsAD1Ly2qNAvAqMQun11hqhgSNtXCGlfExc5r22z3mAFcbeNHCgxIS_qFHUUIaAocMEALw_wcB_k_&OCID=AIDcmmzmnb0182_SEM__k_Cj0KCQjwj4K5BhDYARIsAD1Ly2qNAvAqMQun11hqhgSNtXCGlfExc5r22z3mAFcbeNHCgxIS_qFHUUIaAocMEALw_wcB_k_&gad_source=1&gclid=Cj0KCQjwj4K5BhDYARIsAD1Ly2qNAvAqMQun11hqhgSNtXCGlfExc5r22z3mAFcbeNHCgxIS_qFHUUIaAocMEALw_wcB)**.

Para saber mais:

- [Azure Documentation](https://learn.microsoft.com/en-us/azure/?product=popular)
- [Introdução ao Azure Quickstart Center](https://learn.microsoft.com/pt-br/azure/azure-portal/azure-portal-quickstart-center)
- [Azure Serverless Computing Cookbook, Third Edition](https://info.microsoft.com/rs/157-GQE-382/images/Azure%20Serverless%20Computing%20Cookbook.1.pdf)

<br/>

### Estrutura do Diretório

```
PI--5-V2/
├── _cloud/
│   ├── database/                           # Armazena um banco de dados local
│   ├── machine-learning/                   # Armazena o servidor do algorimto de AM
│   └── README.md                           # Documentação do projeto
```

database e machine-learning represento algo parecico com pacotes que estariam dispostos na nuvem, mas neste caso localmente. Ambos os diretórios possuem documentações detalhadas sobre o seu propósito, o processo para serem configurados e um relatório de desenvolvimento para estudo e análise.

<br/>

## Linguagens de Programação Utilizadas

No que diz respeito ao **Azure**, utilizaremos as opções fornecidas pela própria [plataforma](https://portal.azure.com/#home) para configurá-lo. O processo será descrito nas sessões seguintes.

No desenvolvimento do Algoritmo de Aprendizagem de Máquina, utilizamos [Python](https://www.python.org/).

O processo de desenvolvimento está descrito no [README.md](https://github.com/Leonardo-henriqu2/PI---5-v2/blob/main/_cloud/machine-learning/README.md) do diretório machine-learning e você pode encontrar mais sobre essa linguagem nas páginas oficiais:

- [Documentação](https://www.python.org/doc/)
- [Guia do Desenvolvedor](https://devguide.python.org/)
- [Guia para Iniciantes](https://wiki.python.org/moin/BeginnersGuide)

Sobre o banco de dados você notará uma diferença do que foi configurado na nuvem com o que foi construido localmente no diretório database.

Na nuvem, o banco de dados utilizado foi o [PostgreSQL](https://www.postgresql.org/) e seu processo de configuração será descrito juntamente com as configurações da nuvem nas sessões seguintes.

Para mais,

- [PostgrSQL Documentation Chapter 1. Getting Started](https://www.postgresql.org/docs/current/tutorial-start.html)

Porém o banco de dados local é o [SQLite](https://www.sqlite.org/). Ele é uma alternativa mais simples de um banco de dados e foi adicionado apenas com o intuido didático e para testes de desenvolvimento.

Para mais,

- [SQLite Documentation](https://www.sqlite.org/docs.html)
- [SQLite Quick Start](https://www.sqlite.org/quickstart.html)

> [!NOTE]
> Apesar de utilizarmos dois tipos de bancos de dados, ambos utilizam em essencia a linguagem SQL, portanto as diferenças seram bem mínimas e mais focadas nas configurações de ambiente de ambos, mas não na execução de scripts e no consumo de seus recursos.
>
> Pra saber mais sobre a sintaxe do SQL, você pode acessar o livro [SQL Cookbook](https://downloads.yugabyte.com/marketing-assets/O-Reilly-SQL-Cookbook-2nd-Edition-Final.pdf) de Anthony Molinaro e Robert de Graaf.

<br/>

## Configurações da Nuvem

### Requisitos



<br/>

### Processo de Criação

