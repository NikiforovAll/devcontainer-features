#!/bin/bash
set -e
source dev-container-features-test-lib

check "csharpier runs as $(whoami)" csharpier --version

reportResults
