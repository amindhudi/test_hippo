# Use Node.js official image as base
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json from the root directory to the container
COPY package*.json ./

# Install dependencies with --force option
RUN npm i --force

# Copy tsconfig.server.json if it exists in root or src
COPY tsconfig.server.json ./
# If it's inside src, use:
# COPY ./src/tsconfig.server.json ./

# Copy the rest of your application files, including the src directory
COPY ./src ./src

# Set the working directory inside the src directory where your app is located
WORKDIR /app/src/app

# Build the Next.js app
RUN npm run build

# Expose the port Next.js will run on
EXPOSE 8080

# Start the application
CMD ["npm", "run", "start"]
