# Use official Node.js image
FROM node:18-alpine

# Set working directory to docusaurus folder
WORKDIR /usr/src/app

# Copy package.json and yarn.lock from the docusaurus folder
COPY docusaurus/package.json docusaurus/yarn.lock ./

# Install dependencies
RUN yarn install

# Copy all files from the docusaurus folder
COPY docusaurus .

# Build the Docusaurus static site
RUN yarn build

# Install a simple web server to serve static files
RUN yarn global add serve

# Expose port 3000
EXPOSE 3000

# Start the server
CMD ["serve", "-s", "build", "-l", "3000"]
