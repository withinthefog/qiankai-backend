FROM ruby

RUN apt-get update && apt-get install -y nodejs && apt-get clean
RUN apt-get install imagemagick

COPY Gemfile* /tmp/
RUN cd /tmp/ && ls
RUN cd /tmp/ && bundle install --verbose --without=development

COPY ./ /app/

EXPOSE 8080

CMD ["/app/run"]
