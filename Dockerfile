FROM ruby

COPY Gemfile* /tmp/
RUN cd /tmp/ && ls
RUN cd /tmp/ && bundle install --verbose --without=development

COPY ./ /app/

EXPOSE 8080

CMD ["/app/run"]
