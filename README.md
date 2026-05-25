Instalación y ejecución
Clonar o descargar el repositorio en formato .zip.
Abrir el proyecto en Visual Studio Code o cualquier editor compatible con Python.
Instalar las dependencias necesarias ejecutando en terminal:
pip install flask pymysql
Importar la base de datos MySQL mediante phpMyAdmin.
Verificar la conexión de la base de datos dentro del archivo main.py.
Renombrar base de datos.
Ejemplo:

conexion = pymysql.connect(
    host="localhost",
    user="root",
    password="",
    database="proyectos"
)
Ejecutar el proyecto desde terminal:
python main.py
Abrir el navegador en:
http://127.0.0.1:5000


Actualmente el sistema se encuentra enfocado principalmente en el flujo público de reservas mediante links personalizados para cada negocio.

