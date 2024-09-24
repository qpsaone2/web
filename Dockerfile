# Build the Next.js app
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Nginx setup
FROM nginx:alpine
COPY --from=builder /app/out /usr/share/nginx/html

# Copy the default.template and entrypoint.sh files
COPY default.template /etc/nginx/conf.d/default.template
COPY entrypoint.sh /entrypoint.sh

# Grant execution rights to entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use the custom entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80