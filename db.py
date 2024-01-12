import psycopg2
from psycopg2 import sql

DB_HOST = ""
DB_PORT = "5432"
DB_NAME = "postgres"
DB_USER = "tfadmin"
DB_PASSWORD = "password"

try:
    connection = psycopg2.connect(
        host=DB_HOST,
        port=DB_PORT,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )

    print("Connect to database successfully")

except psycopg2.Error as e:
    print("Error: Unable to connect to the database.")
    print(e)
