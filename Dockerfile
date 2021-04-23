FROM alpine/git as GitRepo
RUN git clone https://github.com/steffyjohn/simple-nodejs-app.git /tmp/gitRepo

FROM node
LABEL description="Simple app for jenkins tests"

WORKDIR /opt/node-app
COPY --from=GitRepo /tmp/gitRepo ./
EXPOSE 4000
RUN npm install && ls -la
ENTRYPOINT node server.js
