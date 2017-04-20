FROM ruby:2.2.0

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev

RUN mkdir /acessoajustica
WORKDIR /acessoajustica

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

COPY . /acessoajustica

# PhantomJS
RUN mv lib/assets/phantomjs-1.9.8-linux-x86_64 /opt/
RUN ln -s /opt/phantomjs-1.9.8-linux-x86_64/bin/phantomjs /bin/phantomjs
