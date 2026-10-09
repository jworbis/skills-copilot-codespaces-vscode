#!/bin/bash

echo "Installing Power Platform CLI..."

dotnet tool install --global Microsoft.PowerApps.CLI.Tool

echo 'export PATH="$PATH:$HOME/.dotnet/tools"' >> ~/.bashrc
export PATH="$PATH:$HOME/.dotnet/tools"

echo ""
echo "Versions:"
dotnet --version
az --version | head -n 1
pac help
