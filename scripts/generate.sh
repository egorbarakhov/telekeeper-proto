#!/bin/bash

# Cleanup
rm -rf ruby/lib/* python/telekeeper_grpc/*

# Generate Ruby stubs
docker run -v $PWD:/def -v $PWD/ruby/lib:/out \
    ghcr.io/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-ruby:latest \
    -I /def/proto \
    --ruby_out=/out \
    --grpc_out=/out \
    /def/proto/**/*.proto

# Generate Python stubs
docker run -v $PWD:/def -v $PWD/python/telekeeper_grpc:/out \
    python:3.10-slim \
    bash -c "pip install grpcio-tools && \
    python -m grpc_tools.protoc \
      -I /def/proto \
      --python_out=/out \
      --grpc_python_out=/out \
      /def/proto/**/*.proto"

# Export version to env
echo "VERSION=$(date +%Y%m%d%H%M%S)" >> $GITHUB_ENV
