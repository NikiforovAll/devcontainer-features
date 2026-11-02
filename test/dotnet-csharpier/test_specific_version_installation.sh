#!/bin/bash
set -e
source dev-container-features-test-lib

check "csharpier 0.30.0 runs as $(whoami)" bash -c "dotnet-csharpier --version | grep '^0.30.0'"

reportResults
