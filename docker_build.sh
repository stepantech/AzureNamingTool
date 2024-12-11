docker buildx build --platform linux/amd64 -t aznamingtool -t tspsaznamingtool.azurecr.io/aznamingtool:v1 --load ./src

az acr login --name tspsaznamingtool

docker push tspsaznamingtool.azurecr.io/aznamingtool:v1