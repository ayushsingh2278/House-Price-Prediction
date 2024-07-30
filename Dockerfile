# Use a base image with Python
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Install Git (needed for GitHub dependencies)
RUN apt-get update && apt-get install -y git

# Copy requirements.txt into the container
COPY requirements.txt /app/

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app

# Expose a port (if needed)
EXPOSE 80

# Define environment variable
ENV NAME World

# Run the application
CMD ["python", "app.py"]
