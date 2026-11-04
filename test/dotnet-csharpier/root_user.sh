#!/bin/bash
set -e
source dev-container-features-test-lib

check "remote user is root" test "$(whoami)" = "root"
check "csharpier runs as root" csharpier --version
check "csharpier is a global tool of root" bash -c "dotnet tool list --global | grep -i '^csharpier '"

reportResults
