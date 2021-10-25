#Importar las librerias necesarias 
from urllib import parse 
from http.server import HTTPServer, BaseHTTPRequestHandler 
 
#importando las librerias 
import tensorflow as tf 
import pandas as pd 
import matplotlib.pyplot as plt 
import seaborn as sns 
 
#obteniendo datos de entrenamiento 
temperaturas = pd.read_csv("datos.csv", sep=";") 
 
#datos de entrenamientos 
celsius = temperaturas["celsius"] 
fahrenheit = temperaturas["fahrenheit"] 
 
#modelo de entrenamiento 
modelo = tf.keras.Sequential() 
modelo.add(tf.keras.layers.Dense(units=1, input_shape=[1])) 
 
#compilar el modelo 
modelo.compile(optimizer=tf.keras.optimizers.Adam(1), loss='mean_squared_error') 
 
#entrenamiento de nuestro modelo de Aprendizaje 
historial = modelo.fit(celsius, fahrenheit, epochs=300, verbose=0) 
 
#evaluando el modelo como aprende 
plt.plot(historial.history["loss"]) 
plt.title("Progreso del aprendizaje") 
plt.xlabel("vuelta") 
plt.ylabel("Error de aprendizaje") 
plt.legend("Aprendizaje Automatico") 
plt.show() 
 
f = modelo.predict([100]) 
print(f) 
 
 
#Clase para definir el servidor http. Solo recibe solicitudes POST. 
class servidorGrupo6(BaseHTTPRequestHandler): 
    def do_GET(self): 
        print("GET") 
        self.send_response(200) 
        self.send_header('Content-type', 'text/html') 
        self.end_headers() 
        self.wfile.write('Servidor iniciado en el puerto 3006'.encode()) 
 
    def do_POST(self): 
        print('Peticion POST Recibida') 
        content_length = int(self.headers['Content-Length']) 
        data = self.rfile.read(content_length) 
        data = data.decode() 
        data = parse.unquote(data) 
        data = float(data) 
 
        predict = modelo.predict([data]) 
        print('La predicción fue:', predict) 
        predict = str(predict[0][0]) 
 
        message = str(data) + ' C° son ' + predict + ' F°.' 
         
        self.send_response(200) 
        self.send_header('Access-Control-Allow-Origin', '*') 
        self.end_headers() 
        self.wfile.write(message.encode()) 
 
 
#Iniciar el servidor en el puerto 3006 y escuchar por siempre 
print("Iniciando el servidor... en el puerto 3006") 
server = HTTPServer(('localhost', 3006), servidorGrupo6) 
server.serve_forever()