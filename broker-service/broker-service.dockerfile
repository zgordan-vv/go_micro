FROM golang:1.21-alpine AS builder

RUN mkdir /app

WORKDIR /app

RUN CGO_ENABLED=0 go build -o brokerApp ./cmd/api

RUN chmod +x /app/brokerApp

FROM alpine:latest

RUN mkdir /app

COPY --from=builder /app/brokerApp /app

CMD ["/app/brokerApp"]