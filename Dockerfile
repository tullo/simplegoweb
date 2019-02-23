FROM golang:1.12-rc-alpine3.9 as builder
WORKDIR /go/src/app
COPY src/simplegoweb .
RUN CGO_ENABLED=0 GOOS=linux go build -a -o goweb .

FROM alpine:3.9
ENV PORT=8080
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD wget -q --spider --tries=1 localhost:5000/healthz || false
COPY --from=builder /go/src/app/goweb /usr/local/bin/
ENTRYPOINT ["goweb"]