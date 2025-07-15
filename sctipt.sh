#!/bin/bash

# Array of all Weka.io domains
domains=(
    "win.weka.io","admin.dc1.weka.io", "learn.weka.io", "www.weka-for-sizer.sizer.weka.io", "weka-for-sizer.sizer.weka.io", "home.prod.weka.io", "api.home.prod.weka.io", "cloud.prod.weka.io", "api.home.weka.io", "cloud.weka.io", "home.weka.io", "start.weka.io", "partnertest.sizer.weka.io", "field.weka.io", "brand.weka.io", "info.weka.io", "engagement.weka.io", "home.rnd.weka.io", "vault.dev.weka.io", "service.weka.io", "sizer-staging.dev.weka.io", "wins.weka.io"

)

# Check if backmeup.sh exists and is executable
if [ ! -f "./backmeup.sh" ]; then
    echo "Error: ./backmeup.sh not found in current directory"
    exit 1
fi

if [ ! -x "./backmeup.sh" ]; then
    echo "Error: ./backmeup.sh is not executable. Run: chmod +x ./backmeup.sh"
    exit 1
fi

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "Starting backup for ${#domains[@]} Weka.io domains..."
echo "=============================================="

# Counters
success_count=0
failed_count=0
failed_domains=()

# Loop through each domain
for domain in "${domains[@]}"; do
    echo -e "${YELLOW}Processing: $domain${NC}"
    
    # Run the backup script with the domain
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
