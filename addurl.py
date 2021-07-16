import mysql.connector

mydb = mysql.connector.connect(
  host="",
  user="",
  password="",
  database=""
)

while 1:
	try:
		newLine = input()
	except EOFError:
		break
	mycursor = mydb.cursor()
	val = newLine.rstrip()
	sql = "INSERT INTO <insira o nome da sua tabela aqui> (<insira o campo de url aqui>) VALUES (\""
	sql += val+"\")"
	mycursor.execute(sql)
	mydb.commit()
