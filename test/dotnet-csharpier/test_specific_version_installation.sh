#!/bin/bash
set -e
source dev-container-features-test-lib

check "csharpier -v | grep 0.20.0" csharpier -v | grep 0.20.0

reportResults
