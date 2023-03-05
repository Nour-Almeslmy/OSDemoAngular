FROM node:latest as build
WORKDIR /app

COPY . .
RUN npm config set strict-ssl false --global
RUN npm install
RUN npm run build --prod

FROM nginx:alpine
COPY --from=build /app/dist/open-shift-demo /usr/share/nginx/html