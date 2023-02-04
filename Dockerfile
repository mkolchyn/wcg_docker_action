FROM golang:1.16 as build
RUN git clone https://github.com/Fenikks/word-cloud-generator.git
WORKDIR /go/word-cloud-generator 
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /go/artifacts/word-cloud-generator

FROM alpine:latest
COPY --from=build /go/artifacts/word-cloud-generator .
CMD ./word-cloud-generator
