FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

# /app/build <--- all the stuff we care about
# single block can have single FROM statement
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
