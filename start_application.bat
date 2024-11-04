@echo off
title Inicializador da Aplicacao CarAvalia

@REM Inicia um prompt em outro diretório para o servidor do banco de dados
start cmd /k "title Servidor do Banco de Dados & cd _cloud\database\database-server || (echo ^| & echo [ERRO^!] nao foi possivel acessar o diretorio database-server & echo ^| & echo ^| & echo ^| & echo [ Pressione qualquer tecla para fechar a janela... & pause >nul & exit) & echo Instalando dependencias do servidor do banco de dados... & echo ^| & call dart pub get || (echo ^| & echo [ERRO^!] nao foi possivel instalar as dependencias do servidor & echo ^| & echo ^| & echo ^| & echo [ Pressione qualquer tecla para fechar a janela... & pause >nul & exit) & echo ^| & echo [ Iniciando o servidor do banco de dados... & echo ^| & dart run lib\server.dart || (echo ^| & echo [ERRO^!] nao foi possivel executar server.dart & echo ^| & echo ^| & echo ^| & echo [ Pressione qualquer tecla para fechar a janela... & pause >nul & exit)"
echo ^|
echo ^[ Aguarde a janela do servidor iniciar e exibir o host em que ele esta sendo executado.
echo ^|
echo ^[ Pressione qualquer tecla para continuar. . .
pause >nul
echo ^|
echo ^|

@REM Inicia um prompt em outro diretório para o servidor do algoritmo de aprendizagem
echo ^[AVISO^!^] O arquivo venv\Scripts\Activate.ps1 e publicado por Python Software Foundation. Beaverton, Oregon, US
echo ^[AVISO^!^] Execute apenas scripts de fornecedores confiaveis
echo ^[AVISO^!^] Desativando temporariamente as politicas de seguranca do sistema...
echo ^|
call powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass' -Verb RunAs" || (echo ^| & echo ^[ERRO^!] nao foi possivel desativar temporariamente as politicas de seguranca do sistema & echo ^| & echo ^| & echo ^| & echo ^[ Pressione qualquer tecla para fechar a janela... & pause >nul & exit)
echo ^|
echo ^[ Aguarde a janela do PowerShell iniciar e exibir as novas deficoes de politicas de seguranca.
echo ^|
echo ^[ Pressione qualquer tecla para continuar. . .
pause >nul
echo ^|
start cmd /k "title Servidor do Algoritmo de Aprendizagem & cd _cloud\machine-learning || (echo ^| & echo [ERRO^!] nao foi possivel acessar o diretorio machine-learning & echo ^| & echo ^| & echo ^| & echo [ Pressione qualquer tecla para fechar a janela... & pause >nul & exit) & if not exist venv (echo Criando ambiente virtual... & echo ^| & call python -m venv venv) else (echo Ativando o ambiente virtual... & call venv\Scripts\activate & echo ^| & echo [ Instalando dependencias... & echo ^| & call pip install -r requirements.txt || (echo ^| & echo [ERRO^!] nao foi possivel instalar as dependencias do servidor & echo ^| & echo ^| & echo ^| & echo [ Pressione qualquer tecla para fechar a janela... & pause >nul & exit) & echo ^| & echo [ Iniciando o servidor do algoritmo... & echo ^| & python app.py || (echo ^| & echo [ERRO^!] nao foi possivel executar app.py & echo ^| & echo ^| & echo ^| & echo [ Pressione qualquer tecla para fechar a janela... & pause >nul & exit))"
echo ^|
echo ^[ Aguarde a janela do servidor iniciar e exibir o host em que ele esta sendo executado.
echo ^|
echo ^[ Pressione qualquer tecla para continuar. . .
pause >nul
echo ^|

@REM Inicia a aplicação Flutter
echo ^|
echo ^[ Instalando dependencias da aplicacao Flutter...
echo ^|
call flutter pub get || (echo ^| & echo ^[ERRO^!^] nao foi possivel instalar as dependencias do servidor & echo ^| & echo ^| & echo ^| & echo ^[ Pressione qualquer tecla para fechar a janela... & pause >nul & exit)
echo ^|
echo ^[ Iniciando a aplicacao Flutter...
echo ^|
call flutter run || (echo ^| & echo ^[ERRO^!^] nao foi possivel executar a aplicacao & echo ^| & echo ^| & echo ^| & echo [ Pressione qualquer tecla para fechar a janela... & pause >nul & exit)
