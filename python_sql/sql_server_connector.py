# pip install pyodbc

import pyodbc
import pandas as pd
import sqlalchemy as db

# Set the connection properties
server = 'DESKTOP-BUAR5NH'
database = 'testmergedb'
username = 'akshayguru'
password = 'test1234'
driver = '{ODBC Driver 18 for SQL Server}' 
# The driver version may vary depending on your installation

# Connect to the database
conn_str = f"DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password};TrustServerCertificate=yes"
cnxn = pyodbc.connect(conn_str)
# Create the pyodbc engine with sqlalchemy
engine = db.create_engine(f"mssql+pyodbc:///?odbc_connect={conn_str}")


# Create a cursor object to execute SQL statements
cursor = cnxn.cursor()

# Execute a sample query
query = "SELECT * FROM SourceProducts"
cursor.execute(query)

# Fetch the results and print them
for row in cursor:
    print(row)
"""
(1, 'Table', Decimal('100.00'))
(2, 'Chair', Decimal('80.00'))  
(5, 'laptop', Decimal('880.00'))
(6, 'charger', Decimal('10.00'))
"""
# use pandas with sqlalchemy
df = pd.read_sql_query(query, engine)
print("\n using pandas:")
print(df)
"""
 using pandas:
   productid productname  price
0          1       Table  100.0
1          2       Chair   80.0
2          5      laptop  880.0
3          6     charger   10.0
"""
# Close the connection
cnxn.close()