FROM --platform=$BUILDPLATFORM  node:22-alpine3.20

WORKDIR /app
ENV NODE_OPTIONS="--max_old_space_size=4096"

COPY package.json package-lock.json ./
RUN npm i --verbose

COPY . .
RUN npm run build