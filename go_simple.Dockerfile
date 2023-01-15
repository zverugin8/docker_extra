FROM golang

ENV GOOS=linux
ENV GOARCH=386

COPY web.go .

## Compiling *.go file
RUN go build -a ./web.go

## Define container process
CMD ["./web"]