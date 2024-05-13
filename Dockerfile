# Use a Debian-based Linux distribution as the base image
FROM debian:stable-slim

# Install necessary packages for Rust and Python development
RUN apt-get update && \
    apt-get install -y \
    curl \
    gcc \
    libc6-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Rust using Rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add Rust binaries to the PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Display installed Rust version
RUN rustc --version && cargo --version

# Install cargo-make
RUN cargo install --force cargo-make

# Install cargo-nextest
RUN curl -LsSf https://get.nexte.st/latest/linux | tar zxf - -C ${CARGO_HOME:-~/.cargo}/bin

# Set the working directory
WORKDIR /prover

COPY . .

# Set the default command to run when the container starts
CMD ["bash"]
