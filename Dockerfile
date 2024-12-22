FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt upgrade -y
RUN mkdir hello && cd hello
RUN echo "hello world" > test.txt

CMD ["tail", "-f", "/dev/null"]  # Keeps the container alive
