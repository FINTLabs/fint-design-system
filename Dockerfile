FROM node:9-alpine as node
COPY . /src
WORKDIR /src
RUN npm install && npm run pl:build

FROM nginx
COPY --from=node /src/public /usr/share/nginx/html/
