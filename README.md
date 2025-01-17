# [Squoosh]!

[Squoosh] is an image compression web app that reduces image sizes through numerous formats.

# Privacy

Squoosh does not send your image to a server. All image compression processes locally.

However, Squoosh utilizes Google Analytics to collect the following:

- [Basic visitor data](https://support.google.com/analytics/answer/6004245?ref_topic=2919631).
- The before and after image size value.
- If Squoosh PWA, the type of Squoosh installation.
- If Squoosh PWA, the installation time and date.

# Developing

To develop for Squoosh:

1. Clone the repository
1. To install node packages, run:
   ```sh
   npm install
   ```
1. Then build the app by running:
   ```sh
   npm run build
   ```
1. After building, start the development server by running:
   ```sh
   npm run dev
   ```

# Contributing

Squoosh is an open-source project that appreciates all community involvement. To contribute to the project, follow the [contribute guide](/CONTRIBUTING.md).

[squoosh]: https://squoosh.app

## Docker

根据 Dockerfile
创建镜像 docker build --platform=linux/amd64 --pull --rm -f "Dockerfile" -t squoosh:2.0.0 "."

docker run -it --platform=linux/amd64 -p 9999:8080 -d --name squoosh --restart=always squoosh:2.0.0

```bash
docker run -e "DEV_PORT=5000" \
    -it --platform=linux/amd64 -p 127.0.0.1:7981:5000 -d --rm --name squoosh squoosh:2.0.0
```

docker exec -it squoosh /bin/bash

如果您已经有一个正在运行的容器，并希望为其添加自动重启策略，可以使用 docker update 命令：
docker update --restart=always squoosh
