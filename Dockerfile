# Use official Golang image as a build stage
FROM golang:1.20 AS builder

# Set working directory inside the container
WORKDIR /app

# Initialize a new Go module inside the container
RUN go mod init basic-go-app

# Copy Go project files
COPY . .

# Ensure dependencies are managed properly
RUN go mod tidy

# Build the Go binary
# This creates an executable from main.go

# Build the Go binary for Linux (64-bit architecture)
# RUN GOOS=linux GOARCH=amd64 go build -o basic-go-app

RUN go build -o basic-go-app

# Use a lightweight Debian-based image to run the application
FROM debian:latest

# Set working directory
WORKDIR /app

# Copy the compiled binary from the builder stage
COPY --from=builder /app/basic-go-app .

# Command to run the executable
# This runs the compiled Go application
CMD ["./basic-go-app"]
