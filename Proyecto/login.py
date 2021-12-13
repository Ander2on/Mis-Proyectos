import conection

conn = conection.Connection()

class Login:
    def verificar_login(self, User):
        if User["accion"] == "admin":

            print("Verificando login...")
            sql = "SELECT * FROM admin WHERE Usuario = %s AND Password = %s LIMIT 1"
            valor = (User["Usuario"], User["Password"])

            return conn.ejecutar_consultas(sql, valor)
        else:
            return print("Usuario no encontrado")
prueba = Login()
print(prueba)
