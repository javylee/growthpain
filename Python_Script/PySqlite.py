# __*__ coding:utf-8 __*__
# File: PySqlite.py
#

import sqlite3

con = sqlite3.connect('pythondb')
cur = con.cursor()


sqlstr = 'select * from people'
cur.execute(sqlstr)
s = cur.fetchall()
print s
sqlstr = 'insert into people(name, age, sex) values (\'jim\', 22, \'M\')'
cur.execute(sqlstr)
con.commit()
sqlstr = 'select * from people'
cur.execute(sqlstr)
s = cur.fetchall()
print s
sqlstr = 'delete from people where age=24'
r = cur.execute(sqlstr)

con.commit()
sqlstr = 'select * from people'
cur.execute(sqlstr)
s = cur.fetchall()
print s

cur.close()
con.close()

