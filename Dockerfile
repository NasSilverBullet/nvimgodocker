FROM golang:1.12-alpine3.9 as build

RUN apk update && apk upgrade && \
    apk add --no-cache git

WORKDIR /go/src/github.com/NasSilverBullet/nvimgodocker

COPY . /go/src/github.com/NasSilverBullet/nvimgodocker

EXPOSE 8080

RUN go get -u github.com/pilu/fresh

CMD ["fresh"]
