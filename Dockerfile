# Etapa de construcción: usa Maven + JDK 17
FROM maven:3.9.3-eclipse-temurin-17 AS build

# Crea y entra al directorio de trabajo
WORKDIR /app

# Copia los archivos necesarios para la construcción
COPY pom.xml ./
COPY src ./src

# Construye el proyecto (sin correr los tests)
RUN mvn clean package -DskipTests

# Etapa final: usa imagen ligera con solo el JRE
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copia el .jar generado en la etapa anterior
COPY --from=build /app/target/backend-0.0.1-SNAPSHOT.jar app.jar

# Expone el puerto que usa Spring Boot
EXPOSE 8081

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]