#!/bin/bash
set -e

echo "Installing Power Platform CLI..."

dotnet tool install --global Microsoft.PowerApps.CLI.Tool

echo 'export PATH="$PATH:$HOME/.dotnet/tools"' >> ~/.bashrc
export PATH="$PATH:$HOME/.dotnet/tools"

echo "Installing Dataverse CLI (@microsoft/dataverse)..."
npm install -g @microsoft/dataverse@latest

echo "Installing Dataverse Python SDK and auth dependencies..."
pip install --upgrade azure-identity requests PowerPlatform-Dataverse-Client pandas msal msal-extensions

echo "Installing GitHub Copilot CLI plugins (Dataverse + Power Platform skills)..."
copilot plugin install dataverse@awesome-copilot
copilot plugin marketplace add microsoft/power-platform-skills
# Add/remove plugin names here as the training scope changes.
power_platform_plugins=(model-apps power-automate)
for plugin in "${power_platform_plugins[@]}"; do
  copilot plugin install "${plugin}@power-platform-skills"
done

echo ""
echo "Versions:"
dotnet --version
az --version | head -n 1
node --version
python3 --version
pac help
npm list -g @microsoft/dataverse
copilot plugin list
