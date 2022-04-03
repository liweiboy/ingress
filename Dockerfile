FROM golang:1.17 as builder

WORKDIR /app

COPY . .

ENV GO111MODULE=on GOPROXY=https://goproxy.cn,direct

RUN CGO_ENABLED=0 go build -o app main.go

FROM alpine:3.15.3

WORKDIR /app

COPY --from=builder /app/app .

CMD ["./app"]



