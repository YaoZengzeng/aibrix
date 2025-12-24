# Use the official Python base image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    WANDB_MODE=disabled \
    MODEL_NAME=deepseek-r1-1-5b \
    SIMULATION=disabled

# Set the working directory
WORKDIR /app

# Install runtime dependencies and clean up
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    jq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY ./*.py /app/
COPY ./*.json /app/

# Python base image has no zScaler root CA, we need add it manually
COPY ./zscaler_root_ca.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates
ENV REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# Expose the port the app runs on
EXPOSE 8000

CMD ["python", "app.py"]
