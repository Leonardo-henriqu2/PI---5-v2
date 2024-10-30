> [!WARNING]
> Projeto em desenvlvimento
>
> README em andamento
>
> Armazenaremos neste diretório o banco de dados local SQLite e seus controladores.

## Exemplos das tabelas do banco:

- **users**

| id (int auto-increment) | username (char(65)) | hashes (char(65)) |
|-------------------------|---------------------|-------------------|
|          00001          |      brunoMC3       |   3b1c3c5e7b1a8   |
|          00002          |     Luiz Felipe     |   c4b8f58292e47   |

- **cars**

| id (int auto-increment) | fk user_id (int) |          model (char(65))         | buying (char (20)) | maint (char (20)) | doors (char (10)) | persons (char (10)) | lug_boot ((char (20)) | safety (char (20)) |    class    |
|-------------------------|------------------|-----------------------------------|--------------------|-------------------|-------------------|---------------------|-----------------------|--------------------|-------------|
|          00001          |       00001      | Gwm Haval H6 Gt Suv Cup Esportivo |     Muito alto     |     Muito alto    |          2        |          2          |        Pequeno        |       Baixo        | Inaceitável |
