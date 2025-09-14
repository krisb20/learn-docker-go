# Stage 1: Build the Go app
FROM golang:1.24 AS builder

# Set working directory inside container
WORKDIR /app

# Copy go mod files and download dependencies
COPY go.mod ./
RUN go mod download

# Copy the rest of the source code
COPY . .

# Build the Go app
RUN go build -o main .

# Stage 2: Create minimal runtime image
FROM debian:bookworm-slim

WORKDIR /app

# Copy the compiled binary from builder
COPY --from=builder /app/main .

# Expose the port your app runs on
EXPOSE 8080

# Run the app
CMD ["./main"]


