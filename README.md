# Docker Go Tour

## Build

English

```bash
docker build -t dockergotour --build-arg DOCKER_TOUR_LANG=en .
```

Chinese

```bash
docker build -t dockergotour --build-arg DOCKER_TOUR_LANG=zh-CN --build-arg DOCKER_GOPROXY=https://goproxy.cn,direct .
```

## Start

```bash
docker run -it -p 3999:3999 dockergotour
```

## sh

```bash
docker run -it --rm -p 3999:3999 dockergotour sh
```

and then visit http://localhost:3999/ in your browser.
