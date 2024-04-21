import psycopg2
import psycopg2.extras

# information 
database="postgres"
user='postgres'
pwd='*********'
host='127.0.0.1'
port= '5432'
conn = None

try:
   with psycopg2.connect(
      database=database,
      user=user,
      password=pwd,
      host=host,
      port=port) as conn:
   
      with conn.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
   
         cur.execute("DROP TABLE IF EXISTS employee")      
         create_script = """ CREATE TABLE employee (
                              id INT PRIMARY KEY,
                              name VARCHAR(40) NOT NULL,
                              salary INT,
                              depth_id VARCHAR(30))"""
         
         cur.execute(create_script)
         insert_script = 'INSERT INTO employee (id, name, salary, depth_id) VALUES (%s, %s, %s, %s)'
         insert_value = [(1, "OMID", 1200, "D1"), (2, "AMIR", 1600, "D1"), (3, "ALI", 18500, "D1")]
         for record in insert_value:
            cur.execute(insert_script, record)
         
         # update
         update_scripts = "UPDATE employee SET salary = (salary * 0.5)"
         cur.execute(update_scripts)
         
         #delete
         delete_script = "DELETE FROM employee WHERE name = %s"
         delete_record = ("OMID",)
         cur.execute(delete_script, delete_record)
         
         #SHOW   
         cur.execute("SELECT * FROM employee")
         for record in cur.fetchall():
            print(record["salary"], record["depth_id"], record["name"])

except Exception as error:
   print(error)
finally:
   if cur is not None:
      conn.close()

   