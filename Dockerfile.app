FROM node:22-alpine3.20

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm i --verbose

COPY . .
RUN npm run build