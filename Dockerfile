# Dockerfile

FROM node:16-alpine  
WORKDIR /app

COPY package*.json ./  

RUN npm install

COPY . .

# Use main file defined in package.json 
# CMD [ "node", "details.js" ]
# Add instrumentation file
COPY instrumentation.js .

# Use instrumented start command 
CMD ["node", "--require", "./instrumentation.js", "details.js"]