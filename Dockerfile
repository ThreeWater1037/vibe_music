# Docker image for springboot file run
# VERSION 0.0.1
# Author: laihx

# 使用Java 17作为基础镜像
FROM openjdk:17-jdk-slim

# 作者信息
LABEL maintainer="laihx"

# 设置工作目录
WORKDIR /app

# 创建临时文件目录
VOLUME /tmp

# 将本地的JAR包添加到容器中并保持原名
COPY vibe-music-server-0.0.1-SNAPSHOT.jar app.jar

# 优化容器启动时间
RUN bash -c 'touch /app/app.jar'

# 暴露应用端口（如果应用使用其他端口，请修改为实际端口）
EXPOSE 8080

# 运行JAR包
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app/app.jar"]