# CarAvalia

> [!WARNING]
> Projeto em andamento
>
> Você pode acompanhar o processo de desenvolvimento bem como os motivos de cada implementação na pasta [_MENAGEMENT](./_MENAGEMENT).

**CarAvalia** é um aplicativo inteligente que ajuda os usuários a decidir se vale a pena comprar um determinado veículo. Com base nas informações fornecidas pelo usuário que indentificam o véiculo, o CarAvalia analisa uma variedade de fatores, como preço, custos de manutenção, quantidade de portas, tamanho de porta-malas e espaço para passageiros. O aplicativo gera uma avaliação personalizada, auxiliando o usuário a fazer uma escolha informada e segura na hora de adquirir seu veículo.

<br/>

## Sumário

1. [Introdução](#introdução)

2. [Instalação da Aplicação](#instalação-da-aplicação)

<br/>

## Introdução

Este é um projeto interdisciplinar criado com propositos avaliativos de conclusão do quinto semestre do curso superior de Desenvolvimento de Software Multiplataforma oferecido pela Fatec Franca Dr. Thomaz Novelino do Centro Paula Souza (CPS).

Para  o  ensino  e  avaliação  de  competências  em  EPT  de  Nível  Superior, o projeto pedagógico do curso enfatiza que:
> "[\...] a interdisciplinaridade   pode   ser   considerada   uma   concepção   e   metodologia   de cognição, ensino e aprendizagem que prevê a interação colaborativa de duas ou mais disciplinas  para  a  solução  e  proposição  de  questões  e  projetos  relacionados  a  um tema [\...]" visando uma "[\...] prospecção  para  novas abordagens  e,  com  elas,  um  projeto  lato  sensu  de  pesquisa  contínua,  produção  e propagação do conhecimento."

Para mais informações:

- [Página oficial Fatec Franca Dr. Thomaz Novelino](https://site.fatecfranca.edu.br/)
- [Projeto pedagógico do curso Desenvolvimento de Software Multiplataforma](https://site.fatecfranca.edu.br/cursos/dsm/projeto-pedagogico)

Este projeto é baseado quase que inteiramente em **[Flutter](https://flutter.dev/)**, um framework desenvolvido pelo Google que utiliza a linguagem de programação Dart.

Para mais informações sobre o Flutter, acesse as páginas oficiais:

- [documentação online](https://docs.flutter.dev/);
- [Receitas: Exemplos úteis de Flutter](https://docs.flutter.dev/cookbook);
- [Laboratório: Escreva seu primeiro aplicativo Flutter](https://docs.flutter.dev/get-started/codelab).

A linguagem de progamação utilizada para desenvolver os algoritmos de aprendizagem de máquina é **[Python](https://www.python.org/)**. Uma linguagem de programação de alto nível.

Caso interessado, você pode encontrar mais sobre essa linguagem nas páginas oficiais:

- [Documentação online](https://www.python.org/doc/);
- [Guia do Desenvolvedor](https://devguide.python.org/);
- [Guia para Iniciantes](https://wiki.python.org/moin/BeginnersGuide).

Para mais informações sobre o desenvolvimento do algoritmo, acesse [_cloud/machine-learning/README.md](https://github.com/Leonardo-henriqu2/PI---5-v2/blob/main/_cloud/machine-learning/README.md).

Utilizamos dois tipos de bancos de dados, [SQLite](https://www.sqlite.org/) como local, sendo uma alternativa mais simples para excutar a aplicação em um ambiente de desenvolvimento, e o [PostgreSQL](https://www.postgresql.org/) na nuvem conforme pedido no manual de desenvolvimento do Projeto Integrador. Apesar dessa característica no projeto, ambos os bancos trabalham com a linguagem SQL, portanto o consumo e a manipulação de ambos não será tão diferente.

Para mais,

- [PostgrSQL Documentation Chapter 1. Getting Started](https://www.postgresql.org/docs/current/tutorial-start.html)
- [SQLite Documentation](https://www.sqlite.org/docs.html)
- [SQLite Quick Start](https://www.sqlite.org/quickstart.html)
- Sobre a sintaxe do SQL, você pode acessar o livro [SQL Cookbook](https://downloads.yugabyte.com/marketing-assets/O-Reilly-SQL-Cookbook-2nd-Edition-Final.pdf) de Anthony Molinaro e Robert de Graaf.

Para mais informações sobre o desenvolvimento dos bancos acesse [_cloud/database/README.md]()

Para a nuvem pública, utilizaremos a plataforma **[Microsoft Azure](https://azure.microsoft.com/pt-br/free/search/?ef_id=_k_Cj0KCQjwj4K5BhDYARIsAD1Ly2qNAvAqMQun11hqhgSNtXCGlfExc5r22z3mAFcbeNHCgxIS_qFHUUIaAocMEALw_wcB_k_&OCID=AIDcmmzmnb0182_SEM__k_Cj0KCQjwj4K5BhDYARIsAD1Ly2qNAvAqMQun11hqhgSNtXCGlfExc5r22z3mAFcbeNHCgxIS_qFHUUIaAocMEALw_wcB_k_&gad_source=1&gclid=Cj0KCQjwj4K5BhDYARIsAD1Ly2qNAvAqMQun11hqhgSNtXCGlfExc5r22z3mAFcbeNHCgxIS_qFHUUIaAocMEALw_wcB)**.

Para saber mais:

- [Azure Documentation](https://learn.microsoft.com/en-us/azure/?product=popular)
- [Introdução ao Azure Quickstart Center](https://learn.microsoft.com/pt-br/azure/azure-portal/azure-portal-quickstart-center)
- [Azure Serverless Computing Cookbook, Third Edition](https://info.microsoft.com/rs/157-GQE-382/images/Azure%20Serverless%20Computing%20Cookbook.1.pdf)

O processo de configuração da nuvem está documentado em [_cloud/README.md](https://github.com/Leonardo-henriqu2/PI---5-v2/blob/main/_cloud/README.md)

<br/>

## Instalação da Aplicação

Para baixar as dependências da aplicação, use o comando:

```bash
flutter pub get
```

Para executar a aplicação em um emulador, use o comando:

```
flutter run
```

Para a inicialização do servidor local de Python e utilização do algoritmo de predição, siga as instruções de [_cloud/machine-learning/README.md](https://github.com/Leonardo-henriqu2/PI---5-v2/blob/main/_cloud/machine-learning/README.md).
