---
description: Repository Information Overview
alwaysApply: true
---

# Telekeeper Proto Information

## Summary
This repository provides a collection of Protocol Buffer (`.proto`) files for generating gRPC stubs in Python and Ruby. The generated stubs are published as libraries to GitHub Packages. The repository automates the process of generating and publishing these libraries through GitHub Actions workflows.

## Structure
- **proto/**: Contains the `.proto` files that define gRPC services and messages
- **ruby/**: Contains the generated Ruby library and gemspec file
- **python/**: Contains the generated Python library and configuration
- **scripts/**: Contains scripts for generating stubs and publishing libraries
- **.github/workflows/**: Contains GitHub Actions workflow for automation

## Language & Runtime
**Languages**: Protocol Buffers, Ruby, Python
**Proto Version**: Protocol Buffers v3
**Build System**: Shell scripts with Docker
**Package Managers**: RubyGems, pip

## Dependencies
**Main Dependencies**:
- gRPC tools for Python and Ruby
- Docker for isolation and consistent builds
- GitHub Packages for distribution

**Development Dependencies**:
- protoc compiler
- grpc-tools for Python
- grpc-ruby generator

## Build & Installation
```bash
# Generate stubs
./scripts/generate.sh

# Install the Ruby gem
gem install telekeeper-grpc

# Install the Python package
pip install telekeeper-grpc
```

## Docker
**Configuration**: Docker is used for isolated generation of gRPC stubs
- Ruby stubs: `ghcr.io/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-ruby:latest`
- Python stubs: `python:3.10-slim` with grpcio-tools

## CI/CD
**Workflow**: `.github/workflows/publish.yml`
**Trigger**: Push to master branch with changes in proto/ directory
**Process**:
1. Generate stubs using the script
2. Build and publish Ruby gem to GitHub Packages
3. Build and publish Python wheel to GitHub Packages

## Versioning
The version of the libraries is set to the current date and time in the format `YYYYMMDDHHMMSS`. This version is exported to the environment variable `VERSION` and used in the gemspec and wheel files.
