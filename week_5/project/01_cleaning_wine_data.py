# Importing necessary tools for data scrapping and cleaning.
import requests
import pandas as pd
from sqlalchemy import create_engine

url = "https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv"
response = requests.get(url)
open('winequality-red.csv', 'wb').write(response.content)

df = pd.read_csv('winequality-red.csv', sep=';')  # adjust the separator as needed

# Uploading database using sqlalchemy
engine = create_engine('sqlite:///wine_quality.db')
df.to_sql('wine_quality', engine, if_exists='replace')
