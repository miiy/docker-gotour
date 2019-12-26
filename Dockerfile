FROM golang:latest

ARG DOCKER_GOPROXY

RUN if [ -n "${DOCKER_GOPROXY}" ] ; \
    then \
        go env -w GO111MODULE=on && \
        go env -w GOPROXY=${DOCKER_GOPROXY} \
        ; \
    fi

ARG DOCKER_TOUR_LANG

RUN if [ "${DOCKER_TOUR_LANG}" = "zh-CN" ] ; \
    then \
        go get -u github.com/Go-zh/tour && \
        mkdir -p src/github.com/Go-zh && \
        cp -r pkg/mod/github.com/\!go-zh/tour@* src/github.com/Go-zh/tour \
        ; \
    else \
        go get golang.org/x/tour && \
        mkdir -p src/golang.org/x && \
        cp -r pkg/mod/golang.org/x/tour@* src/golang.org/x/tour \
        ; \
    fi

CMD [ "/go/bin/tour", "-http", "0.0.0.0:3999" ]