FROM ruby:3

CMD ["rails", "server", "-b", "0.0.0.0"]
EXPOSE 3000

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . .
