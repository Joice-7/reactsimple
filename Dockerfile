FROM node:23-alpine3.20
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
COPY public ./public
COPY src ./src
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /path/to/docker-entrypoint.sh
RUN npm install
CMD ["npm","start"]
