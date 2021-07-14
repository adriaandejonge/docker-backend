FROM golang as compile
RUN CGO_ENABLED=0 go get -a -ldflags '-s' github.com/adriaandejonge/backend

FROM scratch
COPY --from=compile /go/bin/backend .
EXPOSE 8080
CMD ["./backend"]
