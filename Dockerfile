FROM ruby:2.4.2-alpine AS bundle-build
MAINTAINER Tei1988

WORKDIR /opt/mlit-station-api

ADD . /opt/mlit-station-api

RUN apk --update --no-cache add build-base tzdata postgresql-dev &&\
    sh -c "echo 'install: --no-document' > ~/.gemrc" &&\
    sh -c "echo 'update: --no-document' >> ~/.gemrc" &&\
    gem update --system &&\
    gem install bundler &&\
    bundle install --without test development --path vendor/bundler

FROM ruby:2.4.2-alpine
MAINTAINER Tei1988
COPY --from=bundle-build /opt/mlit-station-api/vendor/bundler /opt/mlit-station-api/vendor/bundler

WORKDIR /opt/mlit-station-api

ADD . /opt/mlit-station-api

RUN apk --update --no-cache add tzdata libpq &&\
    sh -c "echo 'install: --no-document' > ~/.gemrc" &&\
    sh -c "echo 'update: --no-document' >> ~/.gemrc" &&\
    gem update --system &&\
    gem install bundler &&\
    bundle install --without test development --path vendor/bundler
