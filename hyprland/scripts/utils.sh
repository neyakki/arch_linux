#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

color_print() {
    local color=$1
    local msg=$2
    echo -e "$color$msg$NC"
}
