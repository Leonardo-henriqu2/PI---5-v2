import pandas as pd
from scipy.io import arff

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

    print('Preprocessing from .arff file finished.\n')
    return df_encoded

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