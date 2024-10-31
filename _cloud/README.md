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

   3.2. [Processo de Criação da Máquina Virtual](#processo-de-criação-da-máquina-virtual)

   3.3. [Processo de Criação do Banco de Dados](#processo-de-criação-do-banco-de-dados)

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

- Assinatura Azure

- Créditos para manter o servidor ativo

<br/>

### Processo de Criação da Máquina Virtual

1. Acessamos a plataforma e, na opção **Grupos de Recursos**, selecionamos **Criar** com os seguintes dados:

   - Grupo de recursos: maquinas-virtuais

   - Região: (US) East US 2

3. Coltamos à página inicial e selecionamos **Criar um Recurso**:

   - Buscamos pela VM **Ubuntu Server 22.04 LTS** e selecionamos a opção criar
     
   - No campo Grupo de recursos, selecionamos o grupo que haviamos criado anteriormente

   - Nome da máquina virtual: projeto-integrador

   - A região é a mesma do grupo criado anteriormente

   - Opções de disponibilidade: Zona de disponibilidade

   - Opções de zona: Zona selecionada pelo Azure (versão prévia)

   - Tipo de segurança: Padrão

   - Imagem: Ubuntu Server 22.04 LTS - x64 GenZ

   - Arquitetura da VM: x64

   - Tamanho: Standard_B1s - 1 vcpu, 1 GiB memória (US$ 7,59/mês) (serviços gratuitos qualificados)

   - Tipo de autenticação: Senha

   - Definimos um nome de usuário, uma senha e confirmamos a senha

   - Nas Regras de porta de entrada, selecionamos todas as opões: HTTP(80), HTTPS(443) e SSH(22)

5. Selecionamos Avançar: Discos e não alteramos nada.

6. Selecionamos Avançar: Redes:

   - Em Rede virtual selecionamos a disponível: projeto-integrador-vnet

   - Sub-Red: Default

   - Ip público, selecionamos criar um novo: projeto-integrador-ip

   - Grupo de segurança de rede do adaptador de rede: Básico

   - Selecione as portas de entrada, selecionamos todas as opões: HTTP(80), HTTPS(443) e SSH(22)

   - Marcamos a opção Excluir a NIC quando a VM for excluída

   - Opções de balanceamento de carga: Nenhum
  
8. Selecionamos a opção Revisar + criar.

9. E selecionamos Criar.

> [!Note]
> Caso apareça algum problema na revisão relacionado à Guia Básico. Volte nesta guia e clique novamente em Reviar + criar.

Isso finaliza a criação da máquina remota, mas ainda é necessário acessá-la para efetuar algumas configurações de sistema e para isso será necessária o ip público da máquina. A própria plataforma já o exibe quando acessamos a máquina virtual.

1. Abrimos o Prompt de Comando no Windows e digitamos o comando para acessar a máquina remotamente:

```ps1
ssh nomeusuario@ip_publico
```

Onde o **nomeusuario** é o nome de usuário que criamos no processo e o **ip_publico** é o Ip Público da máquina que acabamos de copiar.

- Damos enter.

- Digitamos yes para a pergunta subsequente e novamente precionamos enter para confirmar a opção.

- Digitamos a senha para acessarmos com o usuário da máquina e novamente enter para confirmar.

Deverá aparecer algo como:

```ps1
nomeusuario: ~$
```

Isso quer dezer que conseguimos acessar a maquina com sucesso. O próximo passo é atualizar o Ubuntu:

```bash
$ sudo apt update
```
- (enter)
```bash
$ sudo apt upgrade
```
- (enter)

Agora, atualizar o fuso horário:

> [!NOTE]
> ```bash
> $ sudo timedatectl set-timezone America/Sao_Paulo
> ```
>
> Mostrar a data e hora do sistema.

```bash
$ date
```
- (enter)

Vamos alterar a data e hora do nosso servidor no formato mm/dd/yyyy. No caso:

```bash
$ sudo date -s 10/05/2024
```
- (enter)

```bash
$ date -s 11:33:34
```
- (enter)

Reiniciamos o nosso servidor:

```bash
$ sudo reboot now
```
- (enter)

E nos conectamos novamente.

> [!NOTE]
> Por medidas de segurança, pode ser mais interessante criarmos um novo usuário, adicioná-lo ao grupo SUDO de nosso sitema e seguir os próximos passo com ele. Porém, com o objetivo de manter a compreensão clara, continuaremos com o mesmo usuário desde o ínicio. 

Aqui já deve ter dado para entender que trabalhar com o servidor será como trabalhar com um computador normal. Isso quer dizer que o mesmo processo para criar aplicações, iniciar portas de servidor e chamar funções será exatamente igual no que já foi documentado nos demais diretórios deste projeto e em especial, desta pasta. A diferença é que o servidor se manterá ligado e portanto os serviços se manterão disponíveis.

Mas a seguir, daremos o exemplo de como seria criar um Banco de dados e como configurariamos as variáveis necessárias para acessá-lo remotamente e consumí-lo.

> [!WARNING]
> Lembre-se, essas informações são sigilosas e devem ser passadas no arquivo **.env** na raiz do projeto que foi préviamente registrado no arquivo **.gitignore**. As informações que serão exibidas a seguir não foram realmente utilizadas neste projeto, elas apenas possuem propósitos ilustrativos.

### Processo de Criação do Banco de Dados

Antes de tudo, iremos baixar três pacotes importantes:

```bash
$ sudo apt update
```

```bash
$ sudo apt install gnupg2 wget nano
```

> [!NOTE]
> gnupg2: É uma implementação do GNU Privacy Guard, usada para criptografar e assinar dados e comunicações, oferecendo segurança para suas informações.
>
> wget: É uma ferramenta de linha de comando utilizada para baixar arquivos da web. É bastante útil para fazer downloads de arquivos de maneira automatizada.
>
> nano: É um editor de texto simples e fácil de usar, que funciona no terminal. É útil para editar arquivos de texto rapidamente.

Agora adicionaremos o PostgreSQL 16 no Repositório do Ubuntu:

```bash
$ sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt (lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
```

Importaremos o repositório com chave assinada:

```bash
$ curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg
```

Atualizaremos novamente o Ubuntu

```bash
$ sudo apt update
```

E agora podemos iniciar de fato a instalação do banco:

```bash
$ sudo apt install postgresql-16 postgresql-contrib-16
```
- Responderemos Y (de yes) para a pergunta subsequente e precionaremos enter.

Agora inicializaremos e habilitaremos o serviço do PostgreSQL:

```bash
$ sudo systemctl start postgresql
```

```bash
$ sudo systemctl enable PostgreSQL
```

Para verificar se foi instalado a versão 16 corretamente:

```bash
$ psql --version
```
- A versão e o nome do programa deverão aparecer

Agora vamos liberar as conexões remotas:

```bash
$ sudo nano /etc/postgresql/16/main/postgresql.conf
```

O nano abrirá o documento de configurações do PostegrSQL e nele devemos encontre a linha **#listen_addresses = 'localhost' # what IP address(es) to listen on;** e reescrevê-la da seguinte maneira:

```nano
listen_addresses = '*'
```

Vamos agora configurar o PostgreSQL para autenticação MD5:

```bash
$ sudo sed -i '/^host/s/ident/md5/' /etc/postgresql/16/main/pg_hba.conf
```

```bash
$ sudo sed -i '/^local/s/peer/trust/' /etc/postgresql/16/main/pg_hba.conf
```

```bash
$ echo "host all all 0.0.0.0/0 md5" | sudo tee -a /etc/postgresql/16/main/pg_hba.conf
```

Reiniciamos o serviço:

```bash
$ sudo systemctl restart PostgreSQL
```

Liberamos a porta 5432 no firewall:

```bash
$ sudo ufw allow 5432/tcp
```

E vamos conectar o Postegres:

```bash
$ sudo -u postgres psql
```

> [!NOTE]
> Se você quiser alterar a senha do usuário padrão do postgres, utilize o seguinte comando:
>
> ```bash
> $ ALTER USER postgres PASSWORD 'VeryStronGPassWord@1137';
> ```

Você já pode efetuar comando SQL dentro do banco e interagir com ele normalmente.

> [!WARNING]
> É importante deixar claro que para interagir de forma segura com o banco de dados e com o algoritmo, é necessário criar variáveis de ambiente e não compartilhar publicamente suas informações.
>
> Exemplo:
> ```env
> # URL para interagir com o algoritmo
> ALGORITHM_URL=http://seu-servidor-na-nuvem:5000/predict
> 
> # URL para interagir com o banco de dados PostgreSQL na nuvem
> DATABASE_URL=postgres://usuario:senha@host:port/nome_do_banco
> ```
>
> E através do pacote dotenv chamar essas variáveis no código:
> ```dart
> import 'package:dotenv/dotenv.dart' as dotenv;
>
> void main() async {
>   // Carrega as variáveis do arquivo .env
>   dotenv.load();
>
>   // Acesse as variáveis de ambiente
>   final algorithmUrl = dotenv.env['ALGORITHM_URL'];
>   final databaseUrl = dotenv.env['DATABASE_URL'];
>
>   print('Algorithm URL: $algorithmUrl');
>   print('Database URL: $databaseUrl');
> 
>   // Resto do código...
> }
> ```
>
> Verifique se o arquivo .env está inserido no arquivo .gitignore para ser ignorado pelo GitHub.
