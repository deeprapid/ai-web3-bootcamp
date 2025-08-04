#!/bin/bash

# Deployment Gate Script for DeepRapid University
# This script runs before deployment to ensure quality standards

echo "=== DEPLOYMENT GATE VALIDATION ==="
echo "Repository: DeepRapid University"
echo "Date: $(date)"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Initialize counters
PASSED=0
FAILED=0
BLOCKED=0

# Function to print results
print_result() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✅ PASS${NC}: $2"
        ((PASSED++))
    else
        echo -e "${RED}❌ FAIL${NC}: $2"
        ((FAILED++))
    fi
}

print_blocked() {
    echo -e "${RED}🚫 BLOCKED${NC}: $1"
    ((BLOCKED++))
}

echo "1. Running Cursor AI validation..."
echo "--------------------------------"

# Run cursor validation script
if ./scripts/validate.sh; then
    print_result 0 "Cursor AI validation passed"
else
    print_blocked "Cursor AI validation failed - DEPLOYMENT BLOCKED"
    echo "Deployment cannot proceed until validation issues are resolved"
    exit 1
fi

echo ""
echo "2. Checking deployment readiness..."
echo "--------------------------------"

# Check if all required files are present
if [ -f ".cursorrules" ]; then
    print_result 0 ".cursorrules file present"
else
    print_blocked ".cursorrules file missing - DEPLOYMENT BLOCKED"
fi

if [ -f "templates/quality-template.md" ]; then
    print_result 0 "Quality template present"
else
    print_blocked "Quality template missing - DEPLOYMENT BLOCKED"
fi

if [ -f "STATUS.md" ]; then
    print_result 0 "Status file present"
else
    print_blocked "Status file missing - DEPLOYMENT BLOCKED"
fi

echo ""
echo "3. Validating content quality..."
echo "-------------------------------"

# Check for course content
course_count=$(find courses/ -maxdepth 1 -type d | wc -l)
if [ $course_count -gt 1 ]; then
    print_result 0 "Found $((course_count-1)) courses"
else
    print_blocked "No courses found - DEPLOYMENT BLOCKED"
fi

# Check for lesson content
lesson_count=$(find courses/ -name "lesson-*.md" | wc -l)
if [ $lesson_count -gt 0 ]; then
    print_result 0 "Found $lesson_count lesson files"
else
    print_blocked "No lesson files found - DEPLOYMENT BLOCKED"
fi

echo ""
echo "4. Checking template compliance..."
echo "--------------------------------"

# Check template cross-references
if grep -q "Related Templates" templates/course-template.md; then
    print_result 0 "Course template cross-references valid"
else
    print_blocked "Course template missing cross-references - DEPLOYMENT BLOCKED"
fi

if grep -q "Related Templates" templates/translation-template.md; then
    print_result 0 "Translation template cross-references valid"
else
    print_blocked "Translation template missing cross-references - DEPLOYMENT BLOCKED"
fi

if grep -q "Related Templates" templates/quality-template.md; then
    print_result 0 "Quality template cross-references valid"
else
    print_blocked "Quality template missing cross-references - DEPLOYMENT BLOCKED"
fi

echo ""
echo "5. Final deployment check..."
echo "---------------------------"

# Check if any blocking issues exist
if [ $BLOCKED -gt 0 ]; then
    echo ""
    echo -e "${RED}🚫 DEPLOYMENT BLOCKED${NC}"
    echo "Found $BLOCKED blocking issues that must be resolved:"
    echo "- Fix validation errors"
    echo "- Ensure all required files are present"
    echo "- Verify template compliance"
    echo "- Check content quality"
    echo ""
    echo "Deployment cannot proceed until all issues are resolved."
    exit 1
fi

echo ""
echo "=== DEPLOYMENT GATE SUMMARY ==="
echo "Passed: $PASSED"
echo "Failed: $FAILED"
echo "Blocked: $BLOCKED"
echo ""

if [ $BLOCKED -eq 0 ] && [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}🎉 DEPLOYMENT APPROVED${NC}"
    echo "All quality checks passed"
    echo "Deployment can proceed"
    exit 0
else
    echo -e "${RED}❌ DEPLOYMENT BLOCKED${NC}"
    echo "Quality issues must be resolved before deployment"
    exit 1
fi 