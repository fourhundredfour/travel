FROM node:16-alpine AS build

WORKDIR /app
COPY . .

RUN yarn && yarn build


FROM caddy:2-alpine

WORKDIR /srv

COPY --from=build /app/build .

ENTRYPOINT ["caddy", "file-server"]