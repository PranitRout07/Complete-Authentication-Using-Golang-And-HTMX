FROM golang:1.21.5-alpine3.19
WORKDIR /app
COPY . /app 
RUN go build /app 
EXPOSE 8000 
ENTRYPOINT [ "./login-logout" ]