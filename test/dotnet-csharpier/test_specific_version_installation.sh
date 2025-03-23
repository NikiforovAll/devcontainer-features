#!/bin/bash
set -e
source dev-container-features-test-lib

check "Make sure CSharpier 0.30.0 tool is installed. grep returns 0 if found." test "$(dotnet tool list --global | grep csharpier       0.30.0 | echo $?)" = "0"

reportResults
