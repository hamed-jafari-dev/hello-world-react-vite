# Use the official Node.js 16 image from Docker Hub
FROM node:18-alpine as BUILD_IMAGE

ENV NODE_OPTIONS --max_old_space_size=3500

WORKDIR /app

COPY package.json .

RUN npm i --force

COPY . .

# Build the app
RUN npm run build


FROM node:18-alpine as PRODUCTION_IMAGE

WORKDIR /app

COPY --from=BUILD_IMAGE /app/dist/ /app/dist/

COPY package.json .
COPY vite.config.ts .

RUN npm install typescript --force

EXPOSE 4545

CMD ["npm", "run", "start"]
