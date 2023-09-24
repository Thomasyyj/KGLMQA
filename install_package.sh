#!/bin/bash

# List of packages to install
PACKAGES=(
    "torch-scatter==2.0.9"
    "torch-sparse==0.6.15"
    "torch-spline-conv==1.2.1"
    "torchvision==0.12.0"
    "tornado==6.1"
    "traitlets==5.3.0"
    "transformers==3.4.0"
    "typer==0.4.2"
    "typing-extensions==4.2.0"
    "urllib3==1.26.13"
    "wandb==0.13.10"
    "wasabi==0.10.1"
    "wcwidth==0.2.5"
    "webencodings==0.5.1"
    "websocket-client==1.3.3"
    "werkzeug==2.1.2"
    "widgetsnbextension==3.6.0"
    "zipp==3.8.0"
)

# Install each package using pip
for package in "${PACKAGES[@]}"; do
    pip install "$package"
done

# Optionally, you can print a message when all installations are done
echo "All packages have been successfully installed."
