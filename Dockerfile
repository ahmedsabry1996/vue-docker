FROM node:alpine as build_stage

WORKDIR '/vueapp'

RUN apk add yarn

COPY package.json .

RUN yarn

COPY  . .

RUN yarn build

FROM nginx

EXPOSE 80

COPY --from=build_stage /vueapp/dist /usr/share/nginx/html

