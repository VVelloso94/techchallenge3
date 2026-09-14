# Build
FROM golang:1.23-alpine AS builder

# Instalação de certificados
RUN apk add --no-cache git ca-certificates 

WORKDIR /src

# Cache das dependências
COPY go.mod go.sum ./
RUN --mount=type=cache,target=/go/pkg/mod \
    go mod download

COPY . .

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    CGO_ENABLED=0 GOOS=linux go build \
    -ldflags="-s -w" \
    -o evaluation-service .

# Runtime
FROM alpine:3.20

RUN adduser -D -u 10001 appuser

WORKDIR /app

COPY --from=builder /src/evaluation-service /app/evaluation-service

USER appuser

EXPOSE 8080

ENTRYPOINT ["./evaluation-service"]