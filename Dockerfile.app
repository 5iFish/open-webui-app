FROM --platform=$TARGETPLATFORM  node:22-alpine3.20 as builder

WORKDIR /app
ENV NODE_OPTIONS="--max_old_space_size=4096"

COPY package.json package-lock.json ./
RUN npm i --verbose

COPY . .
RUN npm run build

FROM --platform=$TARGETPLATFORM  alpine:latest

COPY --from=build /app/build /app/build
COPY --from=build /app/CHANGELOG.md /app/CHANGELOG.md
COPY --from=build /app/package.json /app/package.json