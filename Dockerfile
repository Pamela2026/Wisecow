# Use official lightweight Python base image
FROM python:3.9-slim

# Install required packages for fortune and cowsay
RUN apt-get update && apt-get install -y fortune-mod cowsay netcat-openbsd && rm -rf /var/lib/apt/lists/*

# Copy the app
WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

# Expose default Wisecow port
EXPOSE 4499

# Run the app
CMD ["./wisecow.sh"]

