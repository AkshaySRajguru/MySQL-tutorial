# pip install mysql-connector-python
import mysql.connector
import pandas as pd

# Set the connection properties
host = 'localhost'
user = 'root'
password = 'ArSql#2022'
database = 'sqlshackmergedemo'

# Connect to the database
cnxn = mysql.connector.connect(host=host, user=user, password=password, database=database)

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
(2, 'Desk', Decimal('80.00'))
(3, 'Chair', Decimal('50.00'))
(4, 'Computer', Decimal('300.00'))
"""
# use pandas
df = pd.read_sql_query(query, cnxn)
print("\n using pandas:")
print(df)
"""
 using pandas:
   ProductID ProductName  Price
0          1       Table  100.0
1          2        Desk   80.0
2          3       Chair   50.0
3          4    Computer  300.0
"""

# Close the connection
cnxn.close()
