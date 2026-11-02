#!/bin/bash
set -e
source dev-container-features-test-lib

check "only the requested .NET 8 SDK is installed" bash -c "test \"\$(dotnet --list-sdks | cut -d. -f1 | sort -u)\" = 8"
check "csharpier 0.30.0 runs" bash -c "csharpier --version | grep '^0.30.0'"

reportResults
