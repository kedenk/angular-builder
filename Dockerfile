FROM node:16

ENV VERSION_ANGULAR_CLI 14.0.0
ENV VERSION_ANGULAR 14.0.0
ENV VERSION_TYPESCRIPT 4.6.4
ENV VERSION_RXJS 7.4.0

ENV NPM_CONFIG_LOGLEVEL info

EXPOSE 8888
EXPOSE 4200

RUN npm -v
RUN npm -q install -location=global @angular/cli@$VERSION_ANGULAR_CLI \
    typescript@$VERSION_TYPESCRIPT \
    rxjs@$VERSION_RXJS

RUN cd /srv \
    && ng new pre-install-app --style less --skip-git true --skip-install true \
    && cd pre-install-app \
    && npm -q install -location=global \
    && cd .. && rm -r pre-install-app

RUN mkdir /srv/workdir
WORKDIR /srv/workdir

ENTRYPOINT ng version && npm run build
