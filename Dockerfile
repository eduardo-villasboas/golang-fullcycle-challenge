FROM golang:latest AS golang_builder

WORKDIR /app/src

COPY ./src .

RUN go build main.go

FROM scratch

WORKDIR /app

COPY --from=golang_builder /app/src/main .

ENTRYPOINT [ "/app/main" ]