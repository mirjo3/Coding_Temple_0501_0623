import psycopg2
import pandas as pd
from sqlalchemy import create_engine

# Connect to the PostgreSQL database
conn = psycopg2.connect(
    database="titanic_data",
    user="postgres",
    password="miranda217",
    host="localhost",
    port="5432"
)

# Read the CSV file into a DataFrame
df = pd.read_csv(r"C:\Users\jmira\OneDrive\Coding Temple Cohort 0501 0623\week_5\0530\titanic.csv")

# Create a cursor object to execute SQL queries
cur = conn.cursor()

# Create the table in the database
cur.execute("""
    CREATE TABLE titanic (
    Survived int,
    Pclass int,
    Name text,
    Sex text,
    Age float,
    SiblingsSpousesAboard int,
    ParentsChildrenAboard int,
    Fare float
)
""")

# Create the SQLAlchemy engine
engine = create_engine('postgresql+psycopg2://postgres:miranda217@localhost:5432/titanic_data')

# Insert the data from the DataFrame into the "titanica" table
df.to_sql('titanic', conn=engine)

# Commit the changes to the database
conn.commit()

# Close the cursor and the database connection
cur.close()
conn.close()