#!/bin/bash

echo "Inicializador da Aplicacao CarAvalia"

# Inicia um terminal para o servidor do banco de dados
gnome-terminal --title="Servidor do Banco de Dados" -- bash -c "
cd _cloud/database/database-server || { echo '[ERRO!] nao foi possivel acessar o diretório database-server'; echo '[ Pressione qualquer tecla para fechar a janela...'; read -n 1; exit; }
echo 'Instalando dependências do servidor do banco de dados...'
dart pub get || { echo '[ERRO!] nao foi possivel instalar as dependências do servidor'; echo '[ Pressione qualquer tecla para fechar a janela...'; read -n 1; exit; }
echo 'Iniciando o servidor do banco de dados...'
dart run lib/server.dart || { echo '[ERRO!] nao foi possivel executar server.dart'; echo '[ Pressione qualquer tecla para fechar a janela...'; read -n 1; exit; }
"

echo "Aguarde a janela do servidor iniciar e exibir o host em que ele está sendo executado."
echo "Pressione qualquer tecla para continuar."
read -n 1

# Inicia um terminal para o servidor do algoritmo de aprendizagem
echo "[AVISO!] O arquivo venv/Scripts/Activate.ps1 é publicado por Python Software Foundation. Beaverton, Oregon, US"
echo "[AVISO!] Execute apenas scripts de fornecedores confiáveis"

gnome-terminal --title="Servidor do Algoritmo de Aprendizagem" -- bash -c "
cd _cloud/machine-learning || { echo '[ERRO!] nao foi possivel acessar o diretório machine-learning'; echo '[ Pressione qualquer tecla para fechar a janela...'; read -n 1; exit; }
if [ ! -d venv ]; then
    echo 'Criando ambiente virtual...'
    python -m venv venv
else
    echo 'Ativando o ambiente virtual...'
    source venv/bin/activate
fi

echo 'Instalando dependências...'
pip install -r requirements.txt || { echo '[ERRO!] nao foi possivel instalar as dependências do servidor'; echo '[ Pressione qualquer tecla para fechar a janela...'; read -n 1; exit; }
echo 'Iniciando o servidor do algoritmo...'
python app.py || { echo '[ERRO!] nao foi possivel executar app.py'; echo '[ Pressione qualquer tecla para fechar a janela...'; read -n 1; exit; }
"

echo "Aguarde a janela do servidor iniciar e exibir o host em que ele está sendo executado."
echo "Pressione qualquer tecla para continuar."
read -n 1

# Inicia a aplicação Flutter
echo "Instalando dependências da aplicação Flutter..."
flutter pub get || { echo '[ERRO!] nao foi possivel instalar as dependências da aplicação'; echo '[ Pressione qualquer tecla para fechar a janela...'; read -n 1; exit; }
echo "Iniciando a aplicação Flutter..."
flutter run || { echo '[ERRO!] nao foi possivel executar a aplicação'; echo '[ Pressione qualquer tecla para fechar a janela...'; read -n 1; exit; }
