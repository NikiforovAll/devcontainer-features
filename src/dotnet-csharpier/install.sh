#!/bin/sh
set -e

CSHARPIER_VERSION="${VERSION:-"latest"}"
TARGET_USER="${_REMOTE_USER:-"root"}"
TARGET_HOME="${_REMOTE_USER_HOME:-"$(getent passwd "$TARGET_USER" | cut -d: -f6)"}"

echo "Activating feature 'dotnet-csharpier'"

DOTNET="$(command -v dotnet || true)"
if [ -z "$DOTNET" ]; then
  echo "(!) dotnet-csharpier requires the .NET SDK, but 'dotnet' was not found."
  echo "    Use an image with .NET (for example mcr.microsoft.com/devcontainers/dotnet),"
  echo "    or add the 'ghcr.io/devcontainers/features/dotnet' feature."
  exit 1
fi

# Install as a global tool of the remote user: editor integrations such as the
# CSharpier VS Code extension find CSharpier only through `dotnet tool list -g`.
# Feature scripts run as root, so switch to the remote user (issue #13).
INSTALL_CMD="\"$DOTNET\" tool install --global csharpier"
if [ "$CSHARPIER_VERSION" != "latest" ]; then
  INSTALL_CMD="$INSTALL_CMD --version \"$CSHARPIER_VERSION\""
fi

if [ "$TARGET_USER" = "root" ]; then
  HOME="$TARGET_HOME" DOTNET_CLI_HOME="$TARGET_HOME" sh -c "$INSTALL_CMD"
else
  su "$TARGET_USER" -s /bin/sh -c "HOME=\"$TARGET_HOME\" DOTNET_CLI_HOME=\"$TARGET_HOME\" DOTNET_ROOT=\"${DOTNET_ROOT:-}\" $INSTALL_CMD"
fi

# containerEnv cannot refer to the remote user's home, so expose the tool
# through /usr/local/bin for shells and non-login processes alike.
TOOLS_DIR="$TARGET_HOME/.dotnet/tools"
for tool in csharpier dotnet-csharpier; do
  if [ -e "$TOOLS_DIR/$tool" ]; then
    ln -sf "$TOOLS_DIR/$tool" "/usr/local/bin/$tool"
  fi
done
