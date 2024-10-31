:: Clique duas vezes para executar esse arquivo ou o execute pelo terminal

@echo off
setlocal

:: Navega até o diretório do servidor do banco de dados
cd _cloud\database\database-server

:: Inicia o servidor do banco de dados
echo Instalando dependências do servidor do banco de dados...
dart pub get
echo Iniciando o servidor do banco de dados...
start dart run lib\server.dart

:: Navega até o diretório do algoritmo
cd ..\..\machine-learning

:: Cria o ambiente virtual se não existir
if not exist venv (
    echo Criando ambiente virtual...
    python -m venv venv
)

:: Ativa o ambiente virtual
echo Ativando o ambiente virtual...
call venv\Scripts\activate

:: Pergunta ao usuário se deseja continuar. Se isso não funcionar, posso usar um autohotkey .ahk
set /p confirm="Deseja continuar? (R para confirmar, qualquer outra tecla para sair): "
if /i "%confirm%" neq "R" (
    echo Operação cancelada.
    exit /b
)

:: Instala as dependências
echo Instalando dependências...
pip install -r requirements.txt

:: Inicia o servidor do algoritmo
echo Iniciando o servidor do algoritmo...
start python app.py

:: Navega de volta para o diretório do Flutter
cd ..\..\

:: Inicia a aplicação Flutter
echo Instalando dependências da aplicação Flutter...
flutter pub get
echo Iniciando a aplicação Flutter...
start flutter run

echo Todos os servidores foram iniciados.
endlocal