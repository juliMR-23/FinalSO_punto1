markdown_content = """# Examen Práctico de Sistemas Operativos - Punto 1
## Despliegue de FastAPI en AWS Lambda usando Docker

Este repositorio contiene la solución al Punto 1 del examen práctico, donde se empaqueta una aplicación de FastAPI (`lambda_final`) utilizando Docker y se despliega en AWS Lambda a través de AWS ECR, exponiendo el servicio públicamente mediante una Lambda Function URL.

---

### a. Archivo Dockerfile
Se creó un archivo `Dockerfile` optimizado para AWS Lambda que utiliza la arquitectura de destino `linux/amd64` e instala las dependencias necesarias.
### b. Script en Bash (deploy.sh)
Se implementó un script de automatización para autenticar Docker, compilar la imagen de forma nativa para linux/amd64 (evitando errores de formato Index Multi-arquitectura), asignarle la etiqueta latest y subirla a AWS ECR.

### c. Evidencias de Ejecución y Publicación en el Registry
 - Ejecución del script en la Terminal
A continuación se adjunta la captura de pantalla de la terminal local donde se evidencia la ejecución exitosa del script ./deploy.sh y la subida de todas las capas del contenedor.
<img width="1919" height="1076" alt="Captura de pantalla 2026-05-26 072706" src="https://github.com/user-attachments/assets/ff833168-a4ea-410a-8cd4-161473a40083" />

 - Imagen publicada en AWS ECR con tag latest
Captura que evidencia la correcta visualización de la imagen guardada dentro del repositorio privado de AWS Elastic Container Registry con el Tipo Image (en lugar de Image Index), lista para ser consumida por Lambda.
<img width="1919" height="893" alt="Captura de pantalla 2026-05-26 074257" src="https://github.com/user-attachments/assets/610b9629-6d36-4352-8573-c4c4128e6bbe" />


### d. Creación de la Función Lambda
Se configuró una nueva función en AWS Lambda seleccionando la opción Container image y apuntando directamente al URI de la imagen alojada en ECR con el tag latest.
<img width="1907" height="831" alt="Captura de pantalla 2026-05-26 074828" src="https://github.com/user-attachments/assets/f5691b73-badc-4ed5-822c-e1cdc8f8e2db" />
<img width="1903" height="836" alt="Captura de pantalla 2026-05-26 074557" src="https://github.com/user-attachments/assets/e62f956f-79d8-45bf-8a0b-f63e948bd46d" />
<img width="1913" height="829" alt="Captura de pantalla 2026-05-26 074423" src="https://github.com/user-attachments/assets/a52ecc36-1c64-48dd-887b-b18b8d465e95" />


### e. Configuración de la Lambda Function URL
Se expuso la aplicación de forma externa configurando una Function URL con tipo de autenticación NONE para habilitar el consumo público de los endpoints.

### f. Verificación del Funcionamiento con curl
Pruebas de conectividad y respuesta de los endpoints definidos en app.py realizados desde la terminal mediante comandos curl.

Prueba de los endpoints con CURL
<img width="1915" height="203" alt="Captura de pantalla 2026-05-26 074759" src="https://github.com/user-attachments/assets/604437c3-cc4e-47c5-b92a-b46e0330aee7" />
<img width="1916" height="131" alt="Captura de pantalla 2026-05-26 074652" src="https://github.com/user-attachments/assets/9df08251-b4eb-49d9-9b90-7357fa864af1" />
