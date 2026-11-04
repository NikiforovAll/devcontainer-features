#!/bin/bash
set -e
source dev-container-features-test-lib

check "csharpier runs as $(whoami)" csharpier --version
check "csharpier is a global tool of $(whoami)" bash -c "dotnet tool list --global | grep -i '^csharpier '"

reportResults
