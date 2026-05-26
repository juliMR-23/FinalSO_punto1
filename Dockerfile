FROM public.ecr.aws/lambda/python:3.11

# Copiar e instalar las dependencias de tu archivo requirements.txt
COPY requirements.txt ${LAMBDA_TASK_ROOT}
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo el código (incluyendo app.py) al directorio de ejecución
COPY . ${LAMBDA_TASK_ROOT}

# Comando configurado con tu archivo 'app' y el manejador 'mangum_handler'
CMD [ "app.mangum_handler" ]