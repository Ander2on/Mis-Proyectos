import conection

conn = conection.Connection()
class crud_clientes:
    def consulta_cliente(self):
        sql = "SELECT * FROM clientes"
        return conn.consultar(sql, None)
    
    def admin_clientes(self, cliente):
        if cliente["accion"] == "nuevo":
            print("Nuevo cliente")
                
            sql = "INSERT INTO clientes(DUI, Nombres, Apellidos, Sexo, Telefono, Departamento, Ciudad, Direccion, Edad, Sueldo, Retraso, Trabajo) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            valor = (cliente["DUI"], cliente["Nombres"], cliente["Apellidos"], cliente["Sexo"], cliente["Telefono"], cliente["Departamento"], cliente["Ciudad"], cliente["Direccion"], cliente["Edad"], cliente["Sueldo"], cliente["Retraso"], cliente["Trabajo"])
        elif cliente["accion"] == "modificar":
            print("Modificar cliente")

            sql = "UPDATE clientes SET DUI = %s, Nombres = %s, Apellidos = %s, Sexo = %s, Telefono = %s, Departamento = %s, Ciudad = %s, Direccion = %s, Edad = %s, Sueldo = %s, Retraso = %s, Trabajo = %s WHERE id_clientes = %s"
            valor = (cliente["DUI"], cliente["Nombres"], cliente["Apellidos"], cliente["Sexo"], cliente["Telefono"], cliente["Departamento"], cliente["Ciudad"], cliente["Direccion"], cliente["Edad"], cliente["Sueldo"], cliente["Retraso"], cliente["Trabajo"], cliente["id_clientes"])
        elif cliente["accion"] == "eliminar":
            print("Eliminar cliente")
 
            sql = "DELETE FROM 'clientes' WHERE 'clientes' = %s"
            valor = (cliente["id_clientes"])
        return conn.ejecutar_consultas(sql, valor)

prueba = crud_clientes().consulta_cliente()
print(prueba)