#Usar una imagen oficial de Ubuntu
FROM ubuntu:latest

#Instalar apache y ssh
RUN apt-get update
RUN apt-get install -y apache openssh-server

#Instalar curl para visualizar el servicio de apache
RUN apt-get install curl

#Crear un directorio de separacion de privilegios faltantes
RUN mkdir /run/sshd

#Dar privilegios a la carpeta creada
RUN chmod 755 /run/sshd

#Crear un usuario para correr la aplicacion
RUN useradd -m appuser && echo "appuser:password" | chpasswd

#Copiar el contenido de un index generico de html para poder visualizar su contenido
COPY index.html /var/www/html/

#seleccionar el directorio de trabajo
WORKDIR /var/www/html

#Configurar apache para que se ejecute como el usuario de la aplicacion
RUN chown -R appuser:appuser /var/www/html/

#Abrir puerto 22 para ssh y el puerto 80 para Apache
EXPOSE 80 20

#Correr los servicios de apache y ssh
CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]
CMD ["/usr/sbin/sshd","-D"]
