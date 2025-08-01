#!/bin/bash

cd aieng-template-implementation
if [ -d ".venv" ]; then
    echo "Virtual environment already exists."
else
    echo "Creating virtual environment..."
    uv venv .venv
fi

source .venv/bin/activate
uv sync --dev

echo "Virtual environment activated and dependencies synced."

# Install Jupyter kernel
uv run ipython kernel install --user --name=aieng-template-implementation --display-name "AIEng Template Implementation"
echo "Jupyter kernel installed."

# Start Jupyter lab
echo "Starting Jupyter lab..."
uv run jupyter lab --no-browser --port=8888 --ip=0.0.0.0
