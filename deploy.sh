#!/bin/bash

AWS_REGION="us-east-2"
AWS_ACCOUNT_ID="975822147368"
REPO_NAME="lambda_final"
IMAGE_TAG="latest"

ECR_URL="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"

echo "=== 1. Autenticando Docker con AWS ECR ==="
aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_URL}

echo "=== 2. Construyendo la imagen de Docker ==="
docker buildx build --platform linux/amd64 --provenance=false --load -t ${REPO_NAME} .

echo "=== 3. Asignando la etiqueta 'latest' ==="
docker tag ${REPO_NAME}:${IMAGE_TAG} ${ECR_URL}/${REPO_NAME}:${IMAGE_TAG}

echo "=== 4. Subiendo la imagen al Registry de AWS ==="
docker push ${ECR_URL}/${REPO_NAME}:${IMAGE_TAG}

echo "=== ¡Proceso completado con éxito! ==="
