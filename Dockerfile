FROM rails

WORKDIR /app

COPY ./ /app/

bundle install

EXPOSE 8080

CMD ["/app/run"]
