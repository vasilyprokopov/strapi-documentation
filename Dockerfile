# Use official Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies and build the static site
RUN yarn install && yarn build

# Install a simple web server to serve static files
RUN yarn global add serve

# Expose port 3000
EXPOSE 3000

# Start the server
CMD ["serve", "-s", "build", "-l", "3000"]
