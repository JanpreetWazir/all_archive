#!/bin/bash

# File containing subdomains (one per line)
SUBDOMAINS_FILE="/home/janpreet/Desktop/project/zerodha/subdomains.txt"

# Check if subdomains file exists
if [ ! -f "$SUBDOMAINS_FILE" ]; then
    echo "Error: File '$SUBDOMAINS_FILE' not found!"
    exit 1
fi

# Read all domains from file into an array
mapfile -t domains < "$SUBDOMAINS_FILE"

# Check if backmeup.sh exists and is executable
if [ ! -f "./backmeup.sh" ]; then
    echo "Error: ./backmeup.sh not found in current directory"
    exit 1
fi

if [ ! -x "./backmeup.sh" ]; then
    echo "Error: ./backmeup.sh is not executable. Run: chmod +x ./backmeup.sh"
    exit 1
fi

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "Starting backup for ${#domains[@]} Weka.io domains..."
echo "=============================================="

# Counters
success_count=0
failed_count=0
failed_domains=()

# Loop through domains
for domain in "${domains[@]}"; do
    echo -e "${YELLOW}Processing: $domain${NC}"

    if ./backmeup.sh -d "$domain"; then
        echo -e "${GREEN}✓ Success: $domain${NC}"
        ((success_count++))
    else
        echo -e "${RED}✗ Failed: $domain${NC}"
        ((failed_count++))
        failed_domains+=("$domain")
    fi

    echo "---"
done

# Summary
echo "=============================================="
echo "Backup Summary:"
echo -e "Total domains: ${#domains[@]}"
echo -e "${GREEN}Successful: $success_count${NC}"
echo -e "${RED}Failed: $failed_count${NC}"

if [ $failed_count -gt 0 ]; then
    echo ""
    echo "Failed domains:"
    for failed_domain in "${failed_domains[@]}"; do
        echo -e "${RED}- $failed_domain${NC}"
    done
fi

echo "Backup process completed!"
