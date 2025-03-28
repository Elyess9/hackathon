# Build stage
FROM python:3.10-slim as builder

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install build dependencies and create virtual environment
RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir -r requirements.txt && \
    /opt/venv/bin/pip install python-dotenv

RUN apt-get update && \
    apt-get install -y git curl && \
    pip install pre-commit && \
    pip install PyGithub

# Runtime stage
FROM python:3.10-slim

# Copy virtual environment from builder
COPY --from=builder /opt/venv /opt/venv

# Set working directory
WORKDIR /app

# Copy application code
COPY . .

# Set environment variables
ENV PATH="/opt/venv/bin:$PATH" \
    PYTHONPATH="/app" \
    PYTHONUNBUFFERED=1 \
    GITHUB_TOKEN="" \
    GITHUB_REPO=""

# Add metadata
LABEL maintainer="YAML Formatter Team" \
      version="1.0" \
      description="YAML Formatter MCP Server"

# Expose port
EXPOSE 3000

# Healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:3000/ || exit 1

# Run the application
CMD ["python", "yaml_formatter.py"]