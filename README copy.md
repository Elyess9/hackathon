# YAML Formatter MCP Server

A Model Context Protocol (MCP) server that provides YAML formatting and validation capabilities, specifically designed for firewall rules structure.

## Prerequisites

- Python 3.10 or higher
- Docker and Docker Compose (for containerized setup)

## Installation

You can run this project either using Docker or set it up locally.

### Docker Setup

1. Build and run using Docker Compose:
```bash
docker-compose up --build
```

This will:
- Build the Docker image
- Start the service on port 3000
- Enable hot-reload for development

### Local Setup

1. Run the setup script to create a virtual environment and install dependencies:
```bash
chmod +x setup.sh
./setup.sh
```

This script will:
- Remove any existing virtual environment
- Install `uv` package manager if not present
- Create a new virtual environment
- Install all required dependencies

## Dependencies

The project requires the following Python packages:
- mcp[cli] >= 1.5.0
- pyyaml >= 6.0
- pydantic >= 1.8.2
- starlette >= 0.27.0
- uvicorn >= 0.15.0

## Development

### Running the Server

#### Using Docker:
```bash
docker-compose up
```

The server will be available at `http://localhost:3000`

#### Local Development:
1. Activate the virtual environment:
```bash
source .venv/bin/activate
```

2. Start the development server:
```bash
python -m uvicorn yaml_formatter:app --host 0.0.0.0 --port 3000 --reload
```

## Available Tools

The YAML Formatter MCP Server provides the following tools:

1. `format_yaml`: Format YAML content according to firewall rules structure
2. `validate_yaml`: Validate YAML content against firewall rules schema
3. `generate_yaml`: Generate YAML content with required parameters

## Project Structure

```
.
├── Dockerfile           # Multi-stage Docker build configuration
├── docker-compose.yml  # Docker Compose service definition
├── pyproject.toml     # Python project metadata
├── requirements.txt   # Python dependencies
├── setup.sh          # Local development setup script
└── yaml_formatter.py # Main application code