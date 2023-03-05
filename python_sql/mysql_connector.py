# pip install mysql-connector-python
import mysql.connector
import pandas as pd
from sqlalchemy import create_engine

# Set the connection properties
host = 'localhost'
user = 'root'
password = 'ArSql#2022'
database = 'sqlshackmergedemo'

# Connect to the database
cnxn = mysql.connector.connect(host=host, user=user, password=password, database=database)
# create an engine object using your database connection string
# engine = create_engine('mysql+mysqlconnector://user:password@host/database')
engine = create_engine(f'mysql+mysqlconnector://{user}:{password}@{host}/{database}')

# Create a cursor object to execute SQL statements
cursor = cnxn.cursor()

# Execute a sample query
query = """
select m.* , c.* 
from joins_db.members as m
left join
joins_db.committees as c
using(name);
"""
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
# use pandas with sqlalchemy engine
df = pd.read_sql_query(query, engine)
print("\n using pandas:")
print(df)
"""
 using pandas:
   member_id    name  committee_id    name
0          1    John           1.0    John
1          2    Jane           NaN    None
2          3    Mary           2.0    Mary
3          4   David           NaN    None
4          5  Amelia           3.0  Amelia
"""
print("\n",df.info()) # committee_id is int but converted to float as it has NULL in db i.e. NaN in pd.
# Close the connection
cnxn.close()
