#!/bin/bash
set -e
source dev-container-features-test-lib

check "remote user is root" test "$(whoami)" = "root"
check "csharpier runs as root" csharpier --version

reportResults
