from http import server
from http.server import BaseHTTPRequestHandler, HTTPServer, SimpleHTTPRequestHandler
from urllib import parse
import json
import mysql.connector
from mysql.connector import Error

import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split

#Lee el csv
datos = pd.read_csv("DATOS2.csv", sep=";", encoding="latin-1")
datosframe = pd.DataFrame(datos)
print(datos)
X = (datosframe[["abierta","moroso","trabajo","sueldo","cuota"]])
y = (datosframe[["resultado"]])
#Entrenamiento 

X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=0.25,random_state=0)
model = LogisticRegression()
model.fit(X_train,y_train)

#Pidiendo los datos
print("")
numAbierta = input("Tiene una cuenta abierta?: ")
numMoroso = input("Es Moroso?: ")
numTrabajo = input("Tiene trabajo?: ")
numSueldo = input("Cual es su sueldo?: ")
numCuota = input("Cuota a pagar?: ")
print("")

#Validando la entrada de letras
if numAbierta == "SI" or numAbierta == "si":
    numAbierta = 1
elif numAbierta == "NO" or numAbierta =="no":
    numAbierta = 0

if numMoroso == "SI" or numMoroso =="si":
    numMoroso = 1
elif numMoroso == "NO" or numMoroso =="no":
    numMoroso = 0

if numTrabajo == "SI" or numTrabajo =="si":
    numTrabajo = 1
elif numTrabajo == "NO" or numTrabajo =="no":
    numTrabajo = 0

#Tomando los nuevos datos del cliente
datanew = {'abierta': [numAbierta],
                    'moroso': [numMoroso],
                    'trabajo': [numTrabajo],
                    'sueldo': [numSueldo],
                    'cuota': [numCuota]
                    }

#Dando una estructura visual y hacemos la prediccion
clientesNu = pd.DataFrame(datanew,columns= ['abierta','moroso','trabajo','sueldo','cuota'])
predicion = model.predict(clientesNu)
print(clientesNu)

#Evalua la prediccion obtenida y nos dice si es aprobada o n0o
if predicion ==1:
    print("Su prestamo a sido aprobado")
elif predicion ==0:
    print("Su prestamo ha sido rechazado")

print(predicion)

