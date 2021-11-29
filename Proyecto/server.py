from http.server import HTTPServer, SimpleHTTPRequestHandler
from urllib import parse
import clientes
import prestamos
import json

clientes = clientes.crud_clientes()
prestamos = prestamos.crud_SolicitudPrestamo()
class servidor(SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.path = '/index.html'
            return SimpleHTTPRequestHandler.do_GET(self)
        elif self.path == '/clientes.html':
            self.path = '/clientes.html'
            return SimpleHTTPRequestHandler.do_GET(self)
        elif self.path == '/prestamos.html':
            self.path = '/prestamos.html'
            return SimpleHTTPRequestHandler.do_GET(self)
        elif self.path == '/consultar_clientes':
            print('Consultando clientes ')
            resultado = clientes.consulta_cliente()
            print('Resultado:',resultado)
            self.send_response(200)
            self.end_headers()
            self.wfile.write(json.dumps(dict(resultado=resultado)).encode())
        elif self.path == '/consultar_prestamos':
            print('Consultando prestamos ')
            resultado = prestamos.consulta_prestamo()
            print('Resultado:',resultado)
            self.send_response(200)
            self.end_headers()
            self.wfile.write(json.dumps(dict(resultado=resultado)).encode())

    def do_POST(self): 
        content_length = int(self.headers['Content-Length'])
        data = self.rfile.read(content_length)
        data = data.decode('utf-8')
        data = parse.unquote(data)
        data = json.loads(data)
        print('se recivio  la data:',data)
        if self.path == '/administrar_clientes':
            print('Administrando clientes')
            resultado = clientes.admin_clientes(data)
        elif self.path == '/administrar_prestamos':
            print('Administrando prestamos')
            resultado = prestamos.admin_prestamo(data)
        print('Resultado:',resultado)
        resp = json.dumps(dict(resultado=resultado))
        self.send_response(200)
        self.end_headers()
        self.wfile.write(json.dumps(dict(resultado=resultado)).encode())

print('Servidor iniciado...')
httpd = HTTPServer(('localhost', 3000), servidor)
httpd.serve_forever()