FROM node:14.10.1-alpine3.10

RUN apk add --no-cache tini

WORKDIR /app
ADD . /app
RUN npm install
EXPOSE 3000 
ENTRYPOINT [ "tini","--" ]
CMD npm start