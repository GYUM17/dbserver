# 1단계: Maven으로 WAR 빌드
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
RUN mvn -B dependency:go-offline

COPY src ./src
# 필요하면 mvnw도 포함해서 전체 복사해도 됨
# COPY . .

RUN mvn -DskipTests package -Pproduction
# 결과: /app/target/어쩌구.war 생성

# 2단계: Tomcat으로 실행
FROM tomcat:9.0

# 기본 앱들 제거하고 ROOT.war 하나만 사용
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]
