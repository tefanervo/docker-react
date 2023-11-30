FROM node:16-alpine as builder

USER node

WORKDIR '/app'
COPY --chown=node package.json .
RUN npm install
COPY --chown=node . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
