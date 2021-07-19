import sys
import mysql.connector
import threading
from _thread import *

def exe(sql):
    mydb = mysql.connector.connect(
      host="localhost",
      user="DNS",
      password="password",
      database="dns"
    )
    mycursor = mydb.cursor()
    mycursor.execute(sql)
    mydb.commit()

file = open("blocklist.list", "r")
data = file.read()
data = data.split("\n")
file.close()
i = 0
tam = len(data)

while i < tam:
    sql = "INSERT INTO urls VALUES "
    subtam = i + 100000
    while i < subtam and i < tam:
        if data[i] != '':
            sql += "('"+data[i]+"'),"
        i += 1
    exe(sql[0:len(sql) - 1] + ';')
    percent = (i * 100) / tam
    format_per = "{:.2f}".format(percent)
    print(str(format_per) + "% done...", end="\r")

file = open("blocklist.list", "w")
file.write('')
file.close()

sys.stdout.write("\033[K")
print("Finished")
