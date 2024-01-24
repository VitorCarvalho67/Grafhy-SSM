FROM node:latest

WORKDIR /app/client

COPY package.json /app/client

RUN npm install

COPY . /app/client

EXPOSE 5173

CMD ["npm", "run", "dev"]