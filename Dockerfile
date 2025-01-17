# 使用 Node.js 官方镜像作为基础镜像
FROM swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/library/node:20.18.0-alpine

# 安装curl
RUN apk add --update curl && rm -rf /var/cache/apk/*

# 容器内创建目录/app
RUN mkdir -p /app
# 设置工作目录
WORKDIR /app/

# 2、复制当前的内容到容器内容部目录/app
COPY ./ /app/

# 安装 Squoosh 项目的依赖项
RUN npm install

# 构建应用程序
RUN npm run build
RUN npm config set strict-ssl false

RUN npm i pm2 -g --registry=http://registry.npm.taobao.org

# RUN mkdir -p /app/.tmp/build/static

# 暴露服务端口
EXPOSE 8080

# 运行应用程序
# CMD ["npm", "run", "serve"]
ENTRYPOINT ["pm2-runtime", "start", "ecosystem.config.cjs"]
