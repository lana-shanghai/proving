# Use a Debian-based Linux distribution as the base image
FROM debian:stable-slim

# Install necessary packages for Rust and Python development
RUN apt-get update && \
    apt-get install -y \
    libdw-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /prover

COPY . .

# Set the default command to run when the container starts
ENTRYPOINT ["/prover/entrypoint.sh"]
