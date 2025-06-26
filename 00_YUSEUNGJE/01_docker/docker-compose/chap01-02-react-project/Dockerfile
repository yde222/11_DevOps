# FROM node:lts-alpine AS build
# WORKDIR /app

# COPY package*.json ./
# RUN npm install

# COPY . .
# RUN npm run build

# FROM node:lts-alpine
# WORKDIR /app

# COPY --from=build /app ./
# EXPOSE 3000
# CMD ["npm", "run", "dev"]

# 1단계: Build stage
FROM node:lts-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build # .next 폴더생성

# 2단계: Production stage
FROM node:lts-alpine
WORKDIR /app

# build 결과물과 필요한 파일을 명시적으로 복사
COPY --from=builder /app/.next .next
COPY --from=builder /app/public public
COPY --from=builder /app/node_modules node_modules
COPY --from=builder /app/package.json package.json

ENV NODE_ENV=production
EXPOSE 3000
CMD ["npm", "run", "start"]
