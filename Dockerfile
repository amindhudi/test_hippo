# Use Node.js official image as base
FROM node:16-alpine

# Set the working directory inside the container to /app
WORKDIR /app

# Copy package.json, package-lock.json, tsconfig.json, and tsconfig.server.json from the root directory to /app
COPY package*.json tsconfig.json tsconfig.server.json ./

# Install dependencies with --force option
RUN npm i --force

# Copy the entire src directory (which contains the app directory) to /app/src
COPY ./src ./src

# Set the working directory to the app directory inside src where your main app files are located
WORKDIR /app/src/app

# Build the Next.js app
RUN npm run build

# Expose the port Next.js will run on
EXPOSE 8080

# Start the application
CMD ["npm", "run", "start"]
