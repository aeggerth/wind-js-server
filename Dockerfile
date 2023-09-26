FROM node:14

# Install Java (OpenJDK) and other dependencies
RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless && \
    apt-get clean

# Create symbolic link for java env
RUN ln -s /usr/bin/java /bin/java

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install --omit=dev

# Bundle app source
COPY . .

EXPOSE 7000
CMD [ "node", "app.js" ]