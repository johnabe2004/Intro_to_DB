import mysql.connector
from mysql.connector import errorcode

# Configuration for connecting to the MySQL server
# NOTE: Replace 'your_username', 'your_password', and 'your_host' with your actual MySQL credentials.
config = {
    'user': 'root',   # e.g., 'root'
    'password': 'your_password', # Your MySQL password
    'host': 'localhost',     # e.g., 'localhost' or '127.0.0.1'
    'raise_on_warnings': True
}

DATABASE_NAME = "alx_book_store"

def create_database():
    """
    Connects to the MySQL server and creates the specified database if it does not exist.
    """
    db_connection = None
    try:
        # 1. Connect to the MySQL server (without specifying a database initially)
        db_connection = mysql.connector.connect(**config)
        cursor = db_connection.cursor()
        
        print(f"Successfully connected to the MySQL server.")

        create_db_query = f"CREATE DATABASE IF NOT EXISTS {DATABASE_NAME}"
        
        cursor.execute(create_db_query)
        
    
        print(f"Database '{DATABASE_NAME}' created successfully!")


    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Failed to connect to DB - Invalid username or password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            # This shouldn't happen when connecting without a specified DB, but good to handle.
            print(f"Error: Failed to connect to DB - Database does not exist.")
        else:
            print(f"Error: Failed to connect to DB - {err}")
    
    finally:
        # 4. Handle open and close of the DB connection
        if db_connection and db_connection.is_connected():
            cursor.close()
            db_connection.close()
            print("MySQL connection closed.")

if __name__ == "__main__":
    create_database()
