FROM golang:1.18-alpine as builder

WORKDIR /app
COPY hello-world.go .
RUN go build hello-world.go

FROM scratch

COPY --from=builder /app/hello-world hello-world
ENTRYPOINT ["/hello-world"]