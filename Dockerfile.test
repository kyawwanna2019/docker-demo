FROM node:14.10.1-alpine3.10

# set maintainer
LABEL maintainer "kyawwanna@hotmail.com"
ENV USER appUser
ENV GROUP appGroup
ENV HOME /app

RUN apk add --no-cache tini

# Create a group and user
RUN addgroup $GROUP && adduser -S -G $GROUP $USER
RUN mkdir $HOME && chown $USER:$GROUP $HOME
USER $USER 

WORKDIR $HOME
COPY package*.json ./
COPY . .
RUN npm install 

ENTRYPOINT [ "tini","--" ]
CMD npm start

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:3010 || exit 1

EXPOSE 3010 