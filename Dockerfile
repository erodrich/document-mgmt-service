#Using image JAVA 8s
FROM openjdk:15-jdk-alpine3.12
LABEL version="1.0.0"

#EXPOSE puerto del servicio
EXPOSE 8080/tcp

#ENVS
ENV JAVA_OPTS ""
ENV APP_ARGS ""
ENV APP_ROOT /app

#Create base app folder
RUN mkdir ${APP_ROOT}
#Create folder to save configuration files
RUN mkdir ${APP_ROOT}/config
#Create folder with application logs

#Mount volumes
VOLUME ${APP_ROOT}/config

#Change to working directory
WORKDIR ${APP_ROOT}

RUN addgroup --gid 1024 spring
RUN adduser -S spring -G spring
RUN adduser spring wheel
USER spring:spring

#Copying built jar
ARG JAR_FILE
COPY ${JAR_FILE} app.jar

#Copying run script
COPY ./run.sh .

# java -jar /opt/app/app.jar
#ENTRYPOINT ["sh","-c","java ${JAVA_OPTS} -jar app.jar"]
ENTRYPOINT ["sh","-c","./run.sh -f app.jar -o \"${JAVA_OPTS}\" -a \"${APP_ARGS}\""]


