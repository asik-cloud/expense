FROM node:20
EXPOSE 8080
ENV DB_HOST="mysql"
RUN groupadd -S expense && useradd -S expense -G expense && \
    mkdir /opt/server && \
    chown -R expense:expense /opt/server
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install
USER expense
CMD ["node", "index.js"]