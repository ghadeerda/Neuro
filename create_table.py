import psycopg2

#Establishing the connection
conn = psycopg2.connect(
   database="slowplanet", user='root', password='root', host='db', port= '5432'
)
#Creating a cursor object using the cursor() method
cursor = conn.cursor()

#Dpoing milk table if already exists.
cursor.execute("DROP TABLE IF EXISTS EMPLOYEE")

#Creating table as per requirement
sql ='''CREATE TABLE EMPLOYEE(
   FIRST_NAME CHAR(20) NOT NULL,
   LAST_NAME CHAR(20),
   AGE INT,
   SEX CHAR(1),
   INCOME FLOAT
)'''

cursor.execute(sql)
print("Table created successfully........")
conn.commit()

#Closing the connection
conn.close()
