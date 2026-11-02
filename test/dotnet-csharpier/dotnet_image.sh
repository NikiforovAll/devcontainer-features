#!/bin/bash
set -e
source dev-container-features-test-lib

check "remote user is vscode" test "$(whoami)" = "vscode"
check "csharpier runs as vscode" csharpier --version

reportResults
