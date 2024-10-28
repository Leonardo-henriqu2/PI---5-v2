import pandas as pd
import numpy as np
from scipy.io import arff
from imblearn.over_sampling import SMOTE
from imblearn.under_sampling import RandomUnderSampler

"""
   Função auxiliar para normalizar dados e 
   aplicar one-hot encoding.
"""
def common_preprocessing(df):
    print('Normalizing data...\n')

    # Remover o prefixo b' das strings
    df = df.map(lambda x: x.decode('utf-8') if isinstance(x, bytes) else x)

    df_encoded = pd.get_dummies(df, columns=['buying', 'maint', 'doors', 'persons', 'lug_boot', 'safety'], drop_first=False)

    # Convertendo valores booleanos para inteiros
    numeric_columns = df_encoded.select_dtypes(include=[bool]).columns
    df_encoded[numeric_columns] = df_encoded[numeric_columns].astype(int)

    return df_encoded

"""
   Carrega e processa dados de um arquivo 
   .arff para treinamento.
"""
def load_and_preprocess_data(filepath):
    print('Starting data preprocessing from .arff file...\n')

    # Carregando o dataset .arff
    print('Loading data from:', filepath)
    data = arff.loadarff(filepath)

    # Convertendo para DataFrame
    print('Converting data to DataFrame...\n')
    df = pd.DataFrame(data[0])

    # Aplicando o pré-processamento comum
    df_encoded = common_preprocessing(df)

    # Separando características e classes
    X = df_encoded.drop('class', axis=1)
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

    # Filtra DataFrame para manter apenas colunas válidas
    df_cleaned_resampled = pd.DataFrame(X_resampled.loc[:, valid_columns_resampled[valid_columns_resampled].index])
    df_cleaned_resampled['class'] = y_resampled

    df_cleaned_under = pd.DataFrame(X_under.loc[:, valid_columns_under[valid_columns_under].index])
    df_cleaned_under['class'] = y_under

    # Combina os dois datasets limpos em um único DataFrame
    df_cleaned = pd.concat([df_cleaned_resampled, df_cleaned_under], ignore_index=True)

    print('Preprocessing from .arff file finished.\n')
    return df_cleaned

"""
   Processa dados recebidos em 
   formato JSON.
"""
def process_json(data):
    print('Starting data preprocessing from JSON...\n')

    # Lista de colunas esperadas
    EXPECTED_COLUMNS = [
        'buying_high', 'buying_low', 'buying_med', 'buying_vhigh',
        'maint_high', 'maint_low', 'maint_med', 'maint_vhigh',
        'doors_2', 'doors_3', 'doors_4', 'doors_5more',
        'persons_2', 'persons_4', 'persons_more',
        'lug_boot_big', 'lug_boot_med', 'lug_boot_small',
        'safety_high', 'safety_low', 'safety_med'
    ]

    # Convertendo o JSON para DataFrame
    df = pd.DataFrame([data])

    # Aplicando o pré-processamento comum
    df_encoded = common_preprocessing(df)

    # Garantindo que apenas as colunas esperadas sejam retornadas
    df_encoded = df_encoded.reindex(columns=EXPECTED_COLUMNS, fill_value=0)

    # Por simplicidade, retornamos o DataFrame codificado
    print('Preprocessing from JSON finished.\n')
    return df_encoded

if __name__ == "__main__":
    cleaned_data = load_and_preprocess_data('../data/car.arff')