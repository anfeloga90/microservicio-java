FROM openjdk:11-jre-slim-buster
# Default to UTF-8 file.encoding
ENV LANG C.UTF-8
##Exponemos el Puerto 8080
EXPOSE 8080
## Creamos la variable JAR_FILE con el path del jar generado
ARG JAR_FILE=build/libs/testing-web-0.0.1-SNAPSHOT.jar
RUN echo $(ls -1 /)
## Copiamos el jar al contenedor
COPY ${JAR_FILE} app.jar
# se comprime archivo app-local.yml para gatillar error de ejecución si consul esta mal configurado
RUN apt-get update && apt-get install -y zip
##Arrancamos el jar a través de ENTRYPOINT para que no pueda ser modificado en la creación del contenedor
ENTRYPOINT ["java","-jar","/app.jar"]


