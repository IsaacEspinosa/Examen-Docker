# Examen Docker:

### Descargar la imagen desde Dockerhub:
```bash
docker pull isaaceg/examen_docker:latest
```
### Correr el contenedor de la imagen:
```bash
docker run -v [FolderPath]:/var/www/html/ -p 8083:80 -p 2221:22 -d isaaceg/examen_docker:latest
```
### Verificar que los servicios SSH y Apache esten corriendo:
```bash
docker exec -it <container_id> bash
curl localhost:80
ssh appuser@localhost -p 22
```
### En caso de que el servicio de apache no este activo, levantarlo
```bash
service apache2 start
```
### Acceder al contenido de la pagina web:
```bash
http://localhost:8083
```
