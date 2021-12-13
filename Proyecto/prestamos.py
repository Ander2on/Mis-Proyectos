import conection

conn = conection.Connection()
class crud_SolicitudPrestamo:
    def consulta_prestamo(self):
        sql = "SELECT * FROM prestamos"
        return conn.consultar(sql, None)

    def admin_prestamo(self, prestamo):
        if prestamo["accion"] == "nuevo":
            print("Nuevo prestamo")
            print(prestamo)

            sql = "INSERT INTO prestamos(DUI, Cantidad, Interes, Cuotas_Cant, Cuotas_Meses, Fecha, Sueldo, Estado) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
            valor = (prestamo["DUI"], prestamo["Cantidad"], prestamo["Interes"], prestamo["Cuotas_Cant"], prestamo["Cuotas_Meses"], prestamo["Fecha"], prestamo["Sueldo"], prestamo["Estado"])
        elif prestamo["accion"] == "modificar":
            print("Modificar prestamo")

            sql = "UPDATE prestamos SET DUI = %s, Cantidad = %s, Interes = %s, Cuotas_Cant = %s, Cuotas_Meses = %s, Fecha = %s, Sueldo = %s, Estado = %s WHERE id_Prestamo = %s"
            valor = (prestamo["DUI"], prestamo["Cantidad"], prestamo["Interes"], prestamo["Cuotas_Cant"], prestamo["Cuotas_Meses"], prestamo["Fecha"], prestamo["Sueldo"], prestamo["Estado"], prestamo["id_Prestamo"])
        elif prestamo["accion"] == "eliminar":
            print("Eliminar prestamo")

            sql = "DELETE FROM `prestamos` WHERE `prestamos`.`id_Prestamo` = %s"
            valor = (prestamo["id_Prestamo"])
        return conn.ejecutar_consultas(sql, valor)
prueba = crud_SolicitudPrestamo()
print(prueba)