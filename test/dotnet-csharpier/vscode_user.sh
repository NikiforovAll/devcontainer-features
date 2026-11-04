#!/bin/bash
set -e
source dev-container-features-test-lib

check "remote user is vscode" test "$(whoami)" = "vscode"
check "csharpier runs as vscode" csharpier --version
check "csharpier is a global tool of vscode" bash -c "dotnet tool list --global | grep -i '^csharpier '"
check "csharpier runs from a non-login process" env -i PATH=/usr/local/bin:/usr/bin:/bin csharpier --version

reportResults
