FROM node:14.10.1-alpine3.10

RUN groupadd -g 1000 basicuser && useradd -r -u 1000 -g basicuser basicuser
USER basicuser

# set maintainer
LABEL maintainer "kyawwanna@hotmail.com"

RUN apk add --no-cache tini

WORKDIR /app
ADD . /app
RUN npm install 

ENTRYPOINT [ "tini","--" ]
CMD npm start

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:3010 || exit 1

EXPOSE 3010 