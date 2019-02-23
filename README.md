# Dockerized Simple Golang Web Server

A simple golang web server with basic logging, tracing, health check, graceful shutdown and zero dependencies

## Default Timezone

Run the server process in default timezone (GMT/UTC)

`docker run --rm -p 5000:5000 tullo/simplegoweb:utc`

## Custom Timezone

`docker run --rm -e "TZ=Europe/Copenhagen" -p 5000:5000 tullo/simplegoweb`