> [!WARNING]
> Armazenaremos neste diretório o banco de dados local SQLite, seus controladores e o inicializador do seu servidor com suas devidas rotas.
>
> Este projeto é apenas um exemplo didático e uma alternativa local para se utilizar a aplicação e não deve ser integrado no ambiente de produção.

## Estrutura do Diretório

```
PI--5-V2/
├── _cloud/
│   └── database/                           
│       ├── database-server/                    # Armazena o servidor do banco de dados
|       │   ├── lib/                            # Armazena os códigos do servidor
│       │   │   ├── controllers/                # Armazenas funções de manipulação do banco
│       │   │   │   ├── car_controller.dart     # Funções de manipulação da tabela cars
│       │   │   │   └── user_controller.dart    # Funções de manipulação da tabela users
|       |   │   ├── db.dart                     # Criador do banco de dados
|       |   │   └── server.dart                 # Inicializador do servidor do banco de dados
|       │   ├── pubspec.lock                    # Arquivo de registro de dependências instaladas
|       │   ├── pubspec.yaml                    # Arquivo de gereniamento de dependências
|       │   └── sqlite3.dill                    # Código da biblioteca dinâmica do SQLite
│       ├── database.db                         # Banco de dados
│       └── README.md                           # Documentação do projeto
```

<br/>

## Estrutura do Banco de Dados

### Tabela: **users**

| Coluna   | Tipo               | Restrições                     |
|----------|--------------------|--------------------------------|
| id       | INTEGER            | PRIMARY KEY, AUTOINCREMENT     |
| username | CHAR(65)           | NOT NULL                       |
| hashe    | CHAR(65)           | NOT NULL                       |

#### Exemplo de Dados

| id    | username    | hashe          |
|-------|-------------|----------------|
| 00001 | brunoMC3    | 3b1c3c5e7b1a8  |
| 00002 | Luiz Felipe | c4b8f58292e47  |

<br/>

### Tabela: **cars**

| Coluna     | Tipo               | Restrições                       |
|------------|--------------------|----------------------------------|
| id         | INTEGER            | PRIMARY KEY, AUTOINCREMENT       |
| user_id    | INTEGER            | NOT NULL, FOREIGN KEY (users.id) |
| model      | CHAR(65)           | NOT NULL                         |
| buying     | CHAR(20)           | NOT NULL                         |
| maint      | CHAR(20)           | NOT NULL                         |
| doors      | CHAR(10)           | NOT NULL                         |
| persons    | CHAR(10)           | NOT NULL                         |
| lug_boot   | CHAR(20)           | NOT NULL                         |
| safety     | CHAR(20)           | NOT NULL                         |
| class      | CHAR(20)           | NOT NULL                         |

#### Exemplo de Dados

| id    | user_id | model                                   | buying      | maint       | doors | persons | lug_boot | safety | class       |
|-------|---------|-----------------------------------------|-------------|-------------|-------|---------|----------|--------|-------------|
| 1     | 1       | Gwm Haval H6 Gt Suv Cup Esportivo       | Muito alto  | Muito alto  | 2     | Várias  | Pequeno  | Baixo  | Inaceitável |

<br/>

## Executando o Servidor do Banco

Antes de tudo, instale as dependências necessárias. Navegue pelo terminal até o diretório ``database-server`` e execute o seguinte comando:

```bash
dart pub get
```

Após isso você poderá executar o servidor através do comando:

```bash
dart run lib/server.dart
```

O servidor irá conferir a presença do banco de dados e em seguida ficar disponível em http://localhost:3000

### Considerações Importântes

Pode ocorrer de vve encontrar o erro `Failed to load dynamic library 'sqlite3.dll': error code 126`.

```ps1
Unhandled exception:
Invalid argument(s): Failed to load dynamic library 'sqlite3.dll': error code 126
#0      _open (dart:ffi-patch/ffi_dynamic_library_patch.dart:11:43)
#1      new DynamicLibrary.open (dart:ffi-patch/ffi_dynamic_library_patch.dart:22:12)
#2      _defaultOpen (package:sqlite3/src/ffi/load_library.dart:81:27)
#3      OpenDynamicLibrary.openSqlite (package:sqlite3/src/ffi/load_library.dart:127:12)
#4      sqlite3 (package:sqlite3/src/ffi/api.dart:13:39)
#6      main (package:database_server/server.dart:7:19)
#7      _delayEntrypointInvocation.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:297:19)
#8      _RawReceivePort._handleMessage (dart:isolate-patch/isolate_patch.dart:184:12)
```

Este erro ocorre porque o sistema operacional/projeto não está sendo capaz de encontrar as bibliotecas dinâmicas (DLL - Dynamic Link Library) que contém o código da biblioteca SQLite.

O arquivo ``sqlite3.dll`` é essa biblioteca. E ele inclui todas as funções e recursos necessários para interagir com um banco de dados SQLite, como criação, leitura, atualização e exclusão de dados.

Poranto, caso você se depare com esse erro, leia atentamente o tipo de erro que é exibido e tente solucioná-lo dentro deste contexto.

O arquivo ``sqlite3.dll`` no diretório data-server, é específico para sistemas operacionais Windows 64bits na versão `3.47.0`. Você pode buscar por outros DLLs no [site oficial do SQLite](https://www.sqlite.org/download.html) e encontrar o necessário para o seu sistema operacional.
