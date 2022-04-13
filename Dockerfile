FROM golang:1-alpine as builder

RUN apk update && \
    apk add git && \
    rm -rf /var/cache/apk/*

WORKDIR /go/src/mockify/

COPY . /go/src/mockify/

# used this because go get is depricated
RUN go mod init && go mod tidy

RUN CGO_ENABLED=0 go build -v -o /usr/local/bin/mockify ./app/cmd/mockify.go
