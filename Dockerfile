# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json or pnpm-lock.yaml files to the working directory
COPY package*.json ./
COPY pnpm-lock.yaml ./

# Install pnpm
RUN npm install -g pnpm

# Install app dependencies using pnpm
RUN pnpm install

# Copy the rest of the application code to the working directory
COPY . .

# Install Supabase CLI
RUN npm install -g supabase

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Define the command to run the app
CMD ["pnpm", "start"]