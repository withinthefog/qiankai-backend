FROM rails

RUN apt-get update && apt-get install -y nodejs && apt-get clean

WORKDIR /app

COPY ./ /app/

RUN bundle install

EXPOSE 8080

CMD ["/app/run"]
