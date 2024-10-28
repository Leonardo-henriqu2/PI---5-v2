import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.neural_network import MLPClassifier
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay, accuracy_score, classification_report
import matplotlib.pyplot as plt
import joblib

# Função para carregar e pré-processar os dados
from data_preprocessing import load_and_preprocess_data

def main():
    # Carregando e limpando os dados
    cleaned_data = load_and_preprocess_data('../data/car.arff')
    
    # Separando características e classes
    X = cleaned_data.drop('class', axis=1)
    y = cleaned_data['class'].astype(str)

    # Dividindo os dados em conjunto de treino e teste
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # Inicializando o modelo MLP
    model = MLPClassifier(hidden_layer_sizes=(13, 9), learning_rate_init=0.09, max_iter=500, random_state=42)

    # Treinando o modelo
    print('Training the model...\n')
    model.fit(X_train, y_train)

    # Fazendo previsões
    print('Making predictions...\n')
    y_pred = model.predict(X_test)
    
    # Avaliando o modelo
    print('Evaluating the model...\n')
    print('Accuracy:', accuracy_score(y_test, y_pred))
    # print(classification_report(y_test, y_pred))

    # Calculando e exibindo a matriz de confusão
    # cm = confusion_matrix(y_test, y_pred, labels=model.classes_)
    # disp = ConfusionMatrixDisplay(confusion_matrix=cm, display_labels=model.classes_)
    # disp.plot(cmap=plt.cm.Blues)
    # plt.title('Matriz de Confusão')
    # plt.show()

    # Salvando o modelo para uso futuro
    print('Saving the model...\n')
    joblib.dump(model, 'mlp_model.pkl')
    print('Model saved as mlp_model.pkl')

if __name__ == "__main__":
    main()