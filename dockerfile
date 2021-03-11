FROM maven:3.5.4-jdk-8-alpine as maven
RUN mkdir -p /user/src/app
COPY . /user/src/app
WORKDIR /usr/src/app
RUN mvn install

FROM openjdk:8u171-jre-alpine
WORKDIR /user/src/app
#COPY --from=user/src/app/target/jgsu-spring-petclinic-*.jar /user/src/app
CMD ["java -jar jgsu-spring-petclinic.jar"]
