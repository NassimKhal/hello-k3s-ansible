# Stage 1: Python Dependencies
FROM python:3.12-alpine AS builder

# Set work directory
WORKDIR /app

# Install build dependencies
RUN apk add --no-cache gcc musl-dev linux-headers

# Install Python dependencies
COPY flask-app/requirements.txt .
RUN pip install --prefix=/install -r requirements.txt

# Stage 2: Minimal Runtime
FROM python:3.12-alpine

# Set working directory
WORKDIR /app

# Copy only runtime dependencies
COPY --from=builder /install /usr/local

# Copy Flask application
COPY flask-app/app.py .

# Minimal user privileges
RUN adduser -D flaskuser
USER flaskuser

# Expose container port
EXPOSE 5000

# Start Flask application
CMD ["python", "app.py"]
