FROM node:16 AS build
WORKDIR  /vivek
COPY . /vivek
RUN npm install
RUN npm run build

FROM nginx:alpine AS deploy
COPY --from=build /vivek/build /usr/share/nginx/html
ENTRYPOINT ["nginx", "-g", "daemon off"]