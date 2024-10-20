FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y python3.9 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["tail", "-f", "/dev/null"]  # Keeps the container alive
