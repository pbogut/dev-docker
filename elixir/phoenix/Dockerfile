FROM pbogut/elixir

MAINTAINER Pawel Bogut <https://pbogut.me>

RUN apk update \
      && apk --no-cache --update add yarn bash \
      && mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez


COPY docker-entrypoint.sh /usr/bin/docker-entrypoint

ENTRYPOINT ["bash", "/usr/bin/docker-entrypoint"]

CMD ["yarn-and-phx-server"]
