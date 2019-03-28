FROM golang:alpine as builder
RUN mkdir /app 
ADD /app /app/
WORKDIR /app 
EXPOSE 8080
RUN go build -o main .

FROM alpine
WORKDIR /app
COPY --from=builder /app/ /app/
RUN adduser -S -D -H -h /app appuser
USER appuser
CMD ["./main"]
