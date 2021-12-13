import mysql.connector

class Connection:
    def __init__(self):
        print("iniciando servidor...")
        self.db = mysql.connector.connect(
            host="localhost",
            port=3307,
            user="root",
            password="",
            database="sistema_prestamosabmj")
        if self.db.is_connected():
            print("conexion exitosa")
        else:
            print("error en la conexion")

    def ejecutar_consultas(self, sql, val):
        try:
            cursor = self.db.cursor()
            cursor.execute(sql, val)
            self.db.commit()
            print("ejecutado")
            return "Registro Guardado"
        except Exception as e:
            print(e)
            return "Error al guardar " + str(e)

    def consultar(self, sql, val):
        try:
            cursor = self.db.cursor(dictionary=True)
            cursor.execute(sql, val)
            return cursor.fetchall()
        except Exception as e:
            print(e)
            return "Error al consultar " + str(e)

    