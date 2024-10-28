import pandas as pd
import numpy as np
from scipy.io import arff
from imblearn.over_sampling import SMOTE
from imblearn.under_sampling import RandomUnderSampler

def load_and_preprocess_data(filepath):
    # Imprime mensagem de inicialização de pré-processamento
    print('Starting data preprocessing...\n')

    # Carregando o dataset .arff
    print('Loading data from:', filepath)
    data = arff.loadarff(filepath)

    # Convertendo para DataFrame
    print('Converting data to DataFrame...\n')
    df = pd.DataFrame(data[0])

    # Aplicando one-hot encoding para normalizar os dados
    print('Normalizing data...\n')
    df_encoded = pd.get_dummies(df, columns=['buying', 'maint', 'doors', 'persons', 'lug_boot', 'safety'], drop_first=False)

    # Convertendo valores booleanos para inteiros
    numeric_columns = df_encoded.select_dtypes(include=[bool]).columns
    df_encoded[numeric_columns] = df_encoded[numeric_columns].astype(int)

    # Separando características e classes
    X = df_encoded.drop('class', axis=1)

    # Convertendo rótulos de classe para string
    y = df_encoded['class'].astype(str)

    # Oversampling utilizando SMOTE
    print('Applying balance for classes...\n')
    smote = SMOTE(random_state=42)
    X_resampled, y_resampled = smote.fit_resample(X, y)

    # Undersampling utilizando RandomUnderSampler
    print('Applying reducement for the majority class...\n')
    undersample = RandomUnderSampler(random_state=42)
    X_under, y_under = undersample.fit_resample(X, y)

    # Remoção de Outliers após oversampling e undersampling
    print('Removing outliers...\n')
    threshold_resampled = 0.8 * len(X_resampled)
    threshold_under = 0.8 * len(X_under)

    numeric_columns_resampled = X_resampled.select_dtypes(include=[np.number]).columns.tolist()
    numeric_columns_under = X_under.select_dtypes(include=[np.number]).columns.tolist()

    valid_columns_resampled = (X_resampled[numeric_columns_resampled].sum() <= threshold_resampled)
    valid_columns_under = (X_under[numeric_columns_under].sum() <= threshold_under)

    # Filtra DataFrame pára manter apenas colunas válidas
    df_cleaned_resampled = pd.DataFrame(X_resampled.loc[:, valid_columns_resampled[valid_columns_resampled].index])
    df_cleaned_resampled['class'] = y_resampled

    df_cleaned_under = pd.DataFrame(X_under.loc[:, valid_columns_under[valid_columns_under].index])
    df_cleaned_under['class'] = y_under

    # Combina os dois datasets limpos em um único DataFrame
    df_cleaned = pd.concat([df_cleaned_resampled, df_cleaned_under], ignore_index=True)

    # Mensagem de finalização de pré-processamento
    print('Preprocessing finished.\n')
    print('Data visualization after preprocessing:\n', df_cleaned.head())

    return df_cleaned

if __name__ == "__main__":
    cleaned_data = load_and_preprocess_data('../data/car.arff')