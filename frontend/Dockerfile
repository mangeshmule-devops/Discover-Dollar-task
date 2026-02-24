# ---------------------------
# Stage 1: Build Angular App
# ---------------------------
FROM node:18-alpine AS build

WORKDIR /app

# Install only production dependencies for faster install
COPY package*.json ./
RUN npm ci --silent

# Copy rest of the source code
COPY . .

# Build Angular for production (modern Angular)
RUN npm run build


# ---------------------------
# Stage 2: Minimal Nginx Image
# ---------------------------
FROM nginx:stable-alpine

# Remove default static files
RUN rm -rf /usr/share/nginx/html/*

# Copy only built app (replace folder name if needed)
COPY --from=build /app/dist/angular-15-crud/.  /usr/share/nginx/html

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
