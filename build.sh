#!/bin/bash

# Build script for Offensive Security Docker Image

set -e

echo "=================================="
echo "Building Offensive Security Image"
echo "=================================="

# Create necessary directories
mkdir -p workspace results

echo ""
echo "Building Docker image..."
docker build -t offensive-security:latest .

echo ""
echo "=================================="
echo "Build complete!"
echo "=================================="
echo ""
echo "To run the container:"
echo "  docker-compose up -d"
echo "  docker-compose exec pentest bash"
echo ""
echo "Or directly with Docker:"
echo "  docker run -it --rm --name pentest --network host \\"
echo "    --cap-add=NET_ADMIN --cap-add=NET_RAW \\"
echo "    -v \$(pwd)/workspace:/workspace \\"
echo "    -v \$(pwd)/results:/results \\"
echo "    offensive-security:latest"
echo ""
