# Stage 1: Build Vite app
FROM node:18 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Stage 2: Serve static files and CPU endpoint
FROM node:18

# Install lightweight static file server and concurrency tools
RUN npm install -g serve concurrently

WORKDIR /app
COPY --from=build /app/dist ./dist
COPY cpu-api.js .
COPY package.json .

# Start CPU server + static file server
CMD ["concurrently", "\"node cpu-api.js\"", "\"serve -s dist -l 80\""]
