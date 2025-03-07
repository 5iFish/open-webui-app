FROM --platform=$TARGETPLATFORM  node:22-alpine3.20 as builder

WORKDIR /app
ENV NODE_OPTIONS="--max_old_space_size=4096"

COPY package.json package-lock.json ./
RUN npm i --verbose

COPY . .
RUN npm run build

FROM --platform=$TARGETPLATFORM  alpine:latest

COPY --from=builder /app/build /app/build
COPY --from=builder /app/CHANGELOG.md /app/CHANGELOG.md
COPY --from=builder /app/package.json /app/package.json
