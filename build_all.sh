#!/bin/bash
# Build all Jupyter Books in the teach project

set -e

echo "Building all Jupyter Books..."

# Root book
echo "Building root book..."
jupyter-book build .

# Physics sub-books
echo "Building Theoretical Physics..."
jupyter-book build physics/theoretical

echo "Building Applied Physics..."
jupyter-book build physics/applied

echo "Building General Physics..."
jupyter-book build physics/general

echo "All books built successfully!"
echo ""
echo "Output directories:"
echo "  Root: _build/html/"
echo "  Theoretical: physics/theoretical/_build/html/"
echo "  Applied: physics/applied/_build/html/"
echo "  General: physics/general/_build/html/"