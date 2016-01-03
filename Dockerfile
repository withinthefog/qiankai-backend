FROM ruby

COPY Gemfile* /tmp/
RUN cd /tmp/ && ls
RUN cd /tmp/ && bundle install --verbose --without=development

RUN brew install imagemagick

COPY ./ /app/

EXPOSE 8080

CMD ["/app/run"]
