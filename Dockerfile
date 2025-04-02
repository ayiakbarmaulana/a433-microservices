FROM node:23.11.0-alpine3.20

WORKDIR /usr/app/src

ENV PORT=3001
ENV AMQP_URL=amqp://192.168.151.210:5673

COPY . .
RUN npm install

EXPOSE 3001
CMD [ "npm", "run", "start" ]