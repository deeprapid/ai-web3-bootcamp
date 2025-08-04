#!/bin/bash

# Cursor AI validation script for CI/CD
# This script validates template compliance and quality standards

echo "=== Cursor AI Quality Validation ==="
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
WARNINGS=0

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

print_warning() {
    echo -e "${YELLOW}⚠️  WARNING${NC}: $1"
    ((WARNINGS++))
}

echo "1. Checking template compliance..."
echo "--------------------------------"

# Check if all required templates exist
if [ -f "templates/course-template.md" ]; then
    print_result 0 "Course template exists"
else
    print_result 1 "Course template missing"
fi

if [ -f "templates/translation-template.md" ]; then
    print_result 0 "Translation template exists"
else
    print_result 1 "Translation template missing"
fi

if [ -f "templates/quality-template.md" ]; then
    print_result 0 "Quality template exists"
else
    print_result 1 "Quality template missing"
fi

echo ""
echo "2. Checking template cross-references..."
echo "----------------------------------------"

# Check for cross-references in templates
if grep -q "Related Templates" templates/course-template.md; then
    print_result 0 "Course template has cross-references"
else
    print_result 1 "Course template missing cross-references"
fi

if grep -q "Related Templates" templates/translation-template.md; then
    print_result 0 "Translation template has cross-references"
else
    print_result 1 "Translation template missing cross-references"
fi

if grep -q "Related Templates" templates/quality-template.md; then
    print_result 0 "Quality template has cross-references"
else
    print_result 1 "Quality template missing cross-references"
fi

echo ""
echo "3. Checking content structure..."
echo "-------------------------------"

# Check for required sections in course content
for course_dir in courses/*/en/; do
    if [ -d "$course_dir" ]; then
        course_name=$(basename $(dirname "$course_dir"))
        echo "Checking course: $course_name"
        
        # Check for lesson files
        lesson_count=$(find "$course_dir" -name "lesson-*.md" | wc -l)
        if [ $lesson_count -gt 0 ]; then
            print_result 0 "Found $lesson_count lesson files"
        else
            print_result 1 "No lesson files found"
        fi
        
        # Check for README
        if [ -f "$course_dir/README.md" ]; then
            print_result 0 "Course README exists"
        else
            print_result 1 "Course README missing"
        fi
    fi
done

echo ""
echo "4. Checking quality template references..."
echo "----------------------------------------"

# Check if quality template is referenced in other templates
if grep -q "quality-template.md" templates/course-template.md; then
    print_result 0 "Course template references quality template"
else
    print_warning "Course template doesn't reference quality template"
fi

if grep -q "quality-template.md" templates/translation-template.md; then
    print_result 0 "Translation template references quality template"
else
    print_warning "Translation template doesn't reference quality template"
fi

echo ""
echo "5. Checking file structure compliance..."
echo "---------------------------------------"

# Check if courses follow the correct structure
for course_dir in courses/*/; do
    if [ -d "$course_dir" ]; then
        course_name=$(basename "$course_dir")
        echo "Checking structure for: $course_name"
        
        # Check for language directories
        if [ -d "$course_dir/en" ]; then
            print_result 0 "English directory exists"
        else
            print_result 1 "English directory missing"
        fi
        
        # Check for other language directories
        for lang_dir in "$course_dir"*/; do
            if [ -d "$lang_dir" ] && [ "$lang_dir" != "$course_dir/en/" ]; then
                lang_name=$(basename "$lang_dir")
                print_result 0 "Language directory exists: $lang_name"
            fi
        done
    fi
done

echo ""
echo "6. Checking .cursorrules compliance..."
echo "------------------------------------"

# Check if .cursorrules exists and has required content
if [ -f ".cursorrules" ]; then
    print_result 0 ".cursorrules file exists"
    
    # Check for key sections
    if grep -q "Template System Requirements" .cursorrules; then
        print_result 0 ".cursorrules has template system requirements"
    else
        print_result 1 ".cursorrules missing template system requirements"
    fi
    
    if grep -q "Unified Quality System" .cursorrules; then
        print_result 0 ".cursorrules references unified quality system"
    else
        print_result 1 ".cursorrules missing unified quality system reference"
    fi
else
    print_result 1 ".cursorrules file missing"
fi

echo ""
echo "=== VALIDATION SUMMARY ==="
echo "Passed: $PASSED"
echo "Failed: $FAILED"
echo "Warnings: $WARNINGS"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}🎉 All validation checks passed!${NC}"
    exit 0
else
    echo -e "${RED}❌ Validation failed with $FAILED errors${NC}"
    exit 1
fi 