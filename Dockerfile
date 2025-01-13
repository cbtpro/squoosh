# node环境
# FROM docker.io/library/node:20-alpine
FROM swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/library/node:20-alpine

# 安装curl
RUN apk add --update curl && rm -rf /var/cache/apk/*

# 容器内创建目录/app
RUN mkdir -p /app
# 设置工作目录
WORKDIR /app/

# 2、复制当前的内容到容器内容部目录/app
COPY ./ /app/

RUN cd /app/

RUN chmod -R 777 * 

RUN npm install

RUN npm run build

RUN npm config set strict-ssl false

RUN npm i pm2 -g --registry=http://registry.npm.taobao.org


# 容器对外暴露的端口号，要和node项目配置的端口号一致
EXPOSE 5000

# 运行
ENTRYPOINT ["pm2-runtime", "start", "ecosystem.config.cjs"]