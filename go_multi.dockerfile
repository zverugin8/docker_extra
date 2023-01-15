FROM golang:1.16-alpine as build
ENV GOOS=linux
ENV GOARCH=386
COPY web.go .
## Compiling *.go file
RUN go build -a ./web.go

## Define container process
# CMD ["./web"]

FROM scratch

COPY --from=build go/web ./web
EXPOSE 8080
## Define container process
CMD ["./web"]