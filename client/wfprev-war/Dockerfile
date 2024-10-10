# Use an official Node.js runtime as a base image
FROM node:20

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json (if available)
COPY src/main/angular/package*.json ./

# Install the project dependencies
RUN npm install

# Copy the entire Angular project into the container
COPY src/main/angular/ .

# Build the Angular app
RUN npm run build -- --configuration production

# Install a lightweight web server to serve the Angular app
RUN npm install -g serve

# Expose the port your app will run on
EXPOSE 8080

# Serve the Angular app using 'serve' from the 'dist' folder
CMD ["serve", "-s", "dist/wfprev", "-l", "8080"]