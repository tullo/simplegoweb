FROM golang:1.12-rc-alpine3.9 as builder
WORKDIR /go/src/app
COPY src/simplegoweb .
RUN CGO_ENABLED=0 GOOS=linux go build -a -o goweb .

FROM alpine:3.9
ENV PORT=8080
COPY --from=builder /go/src/app/goweb /usr/local/bin/
ENTRYPOINT ["goweb"]