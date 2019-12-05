FROM golang:1.12 as build

WORKDIR /go/src/app
COPY lab3.go .

RUN go get -d -v ./...
RUN go install -v ./...

FROM gcr.io/distroless/base
EXPOSE 8080

COPY --from=build /go/bin/app /
CMD ["/app"]