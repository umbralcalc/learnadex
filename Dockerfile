# syntax=docker/dockerfile:1

FROM golang:1.21

WORKDIR /logsplorer

COPY go.mod go.sum ./
RUN go mod download

COPY ./cmd/logsplorer ./cmd/logsplorer

# build the logsplorer binary
RUN go build -o bin/ ./cmd/logsplorer

# expose the logsplorer API port
EXPOSE 8080

ENTRYPOINT ["./bin/logsplorer"]