#!/bin/bash

# Enhanced Cursor AI Translation Script for CI/CD
# Implements incremental translation with git diff detection and multi-language support

echo "=== Enhanced Cursor AI Translation Process ==="
echo "Repository: DeepRapid University"
echo "Date: $(date)"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Initialize counters
PASSED=0
FAILED=0
WARNINGS=0
CHANGED_FILES=0
TRANSLATED_FILES=0

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

print_info() {
    echo -e "${BLUE}ℹ️  INFO${NC}: $1"
}

# Function to extract target languages from TRANSLATIONS.md
extract_target_languages() {
    local translations_file="TRANSLATIONS.md"
    
    if [ ! -f "$translations_file" ]; then
        print_warning "TRANSLATIONS.md not found, using default languages"
        echo "es,zh,ja,ko,fr,de,pt,ru,ar,hi"
        return
    fi
    
    local phase=$1
    local languages=""
    
    case "$phase" in
        "phase1")
            # Extract Phase 1 languages from YAML-like structure
            languages=$(grep -A 20 "Phase 1: High Priority" "$translations_file" | grep "code:" | sed 's/.*code: "//' | sed 's/"//' | tr '\n' ',' | sed 's/,$//')
            ;;
        "phase2")
            # Extract Phase 2 languages from YAML-like structure
            languages=$(grep -A 20 "Phase 2: Additional Languages" "$translations_file" | grep "code:" | sed 's/.*code: "//' | sed 's/"//' | tr '\n' ',' | sed 's/,$//')
            ;;
        "all")
            # Extract all languages
            local phase1_languages=$(grep -A 20 "Phase 1: High Priority" "$translations_file" | grep "code:" | sed 's/.*code: "//' | sed 's/"//' | tr '\n' ',' | sed 's/,$//')
            local phase2_languages=$(grep -A 20 "Phase 2: Additional Languages" "$translations_file" | grep "code:" | sed 's/.*code: "//' | sed 's/"//' | tr '\n' ',' | sed 's/,$//')
            languages="${phase1_languages},${phase2_languages}"
            ;;
        *)
            # Default: return all languages
            local phase1_languages=$(grep -A 20 "Phase 1: High Priority" "$translations_file" | grep "code:" | sed 's/.*code: "//' | sed 's/"//' | tr '\n' ',' | sed 's/,$//')
            local phase2_languages=$(grep -A 20 "Phase 2: Additional Languages" "$translations_file" | grep "code:" | sed 's/.*code: "//' | sed 's/"//' | tr '\n' ',' | sed 's/,$//')
            languages="${phase1_languages},${phase2_languages}"
            ;;
    esac
    
    # Clean up and return
    echo "$languages" | sed 's/,,/,/g' | sed 's/^,//' | sed 's/,$//' | tr ',' '\n' | sort -u | tr '\n' ',' | sed 's/,$//'
}

# Parse command line arguments
COURSE_NAME=$1
TARGET_LANGUAGES=$2
INCREMENTAL_MODE=$3

if [ -z "$COURSE_NAME" ]; then
    echo "Usage: $0 <course-name> [target-languages|phase] [incremental] [mode]"
    echo ""
    echo "Examples:"
    echo "  $0 ai-for-web3                    # Show available languages"
    echo "  $0 ai-for-web3 es                 # Translate to Spanish"
    echo "  $0 ai-for-web3 'es,fr,ja'        # Translate to Spanish, French, Japanese"
    echo "  $0 ai-for-web3 'es,fr,ja' true   # Incremental translation"
    echo "  $0 ai-for-web3 phase1            # Phase 1 languages (high quality)"
    echo "  $0 ai-for-web3 phase2            # Phase 2 languages (efficiency)"
    echo "  $0 ai-for-web3 all               # All languages from TRANSLATIONS.md"
    echo "  $0 ai-for-web3 es quality        # High-quality single language"
    echo "  $0 ai-for-web3 'es,zh' fast      # Fast translation mode"
    echo "  $0 ai-for-web3 'es,zh' true pipeline # Pipeline-optimized incremental"
    echo ""
    echo "Modes: quality, fast, pipeline"
    echo "Phases: phase1, phase2, all"
    echo ""
    echo "Available courses:"
    ls -1 courses/ 2>/dev/null | grep -v "^$" || echo "No courses found"
    echo ""
    echo "Common languages: es, fr, de, ja, ko, zh, th, ar, hi, ru"
    exit 1
fi

# Check if course exists
if [ ! -d "courses/$COURSE_NAME" ]; then
    echo -e "${RED}❌ Course '$COURSE_NAME' not found${NC}"
    exit 1
fi

# Check if English source exists
if [ ! -d "courses/$COURSE_NAME/en" ]; then
    echo -e "${RED}❌ English source not found for course '$COURSE_NAME'${NC}"
    exit 1
fi

# Auto-detect languages from TRANSLATIONS.md if requested
if [ "$TARGET_LANGUAGES" = "auto" ] || [ "$TARGET_LANGUAGES" = "all" ]; then
    TARGET_LANGUAGES=$(extract_target_languages "all")
    print_info "Auto-detected languages from TRANSLATIONS.md: $TARGET_LANGUAGES"
elif [ "$TARGET_LANGUAGES" = "phase1" ]; then
    TARGET_LANGUAGES=$(extract_target_languages "phase1")
    print_info "Phase 1 languages (high quality): $TARGET_LANGUAGES"
elif [ "$TARGET_LANGUAGES" = "phase2" ]; then
    TARGET_LANGUAGES=$(extract_target_languages "phase2")
    print_info "Phase 2 languages (efficiency): $TARGET_LANGUAGES"
fi

# Detect translation mode
TRANSLATION_MODE=$4
if [ -z "$TRANSLATION_MODE" ]; then
    TRANSLATION_MODE="standard"
fi

echo "Course: $COURSE_NAME"
echo "Target Languages: ${TARGET_LANGUAGES:-'Not specified'}"
echo "Incremental Mode: ${INCREMENTAL_MODE:-'false'}"
echo "Translation Mode: $TRANSLATION_MODE"
echo ""

# Function to optimize translation based on mode
optimize_translation_mode() {
    local mode=$1
    
    case "$mode" in
        "quality")
            print_info "Quality mode: Enhanced validation and reduced concurrency"
            export MAX_CONCURRENT=1
            export QUALITY_LEVEL="high"
            export VALIDATION_LEVEL="intensive"
            ;;
        "fast")
            print_info "Fast mode: Reduced validation for speed"
            export MAX_CONCURRENT=4
            export QUALITY_LEVEL="standard"
            export VALIDATION_LEVEL="basic"
            ;;
        "pipeline")
            print_info "Pipeline mode: CI/CD optimized"
            export MAX_CONCURRENT=2
            export QUALITY_LEVEL="standard"
            export VALIDATION_LEVEL="automated"
            ;;
        *)
            print_info "Standard mode: Balanced performance and quality"
            export MAX_CONCURRENT=2
            export QUALITY_LEVEL="standard"
            export VALIDATION_LEVEL="standard"
            ;;
    esac
}

# Optimize translation based on mode
optimize_translation_mode "$TRANSLATION_MODE"

# Function to detect changed files using git
detect_changed_files() {
    local course_path="courses/$COURSE_NAME/en"
    local changed_files=()
    
    if [ "$INCREMENTAL_MODE" = "true" ]; then
        print_info "Detecting changed files using git diff..."
        
        # Get changed files in the last commit
        if git diff --name-only HEAD~1 HEAD | grep "^$course_path/" > /dev/null; then
            changed_files=($(git diff --name-only HEAD~1 HEAD | grep "^$course_path/" | sed "s|^$course_path/||"))
        fi
        
        # If no changes in last commit, check for uncommitted changes
        if [ ${#changed_files[@]} -eq 0 ]; then
            if git diff --name-only | grep "^$course_path/" > /dev/null; then
                changed_files=($(git diff --name-only | grep "^$course_path/" | sed "s|^$course_path/||"))
            fi
        fi
        
        if [ ${#changed_files[@]} -gt 0 ]; then
            print_result 0 "Found ${#changed_files[@]} changed files" >&2
            for file in "${changed_files[@]}"; do
                echo "  - $file" >&2
            done
        else
            print_warning "No changed files detected" >&2
        fi
    else
        # Full translation mode - get all .md files
        changed_files=($(find "$course_path" -name "*.md" -exec basename {} \;))
        print_result 0 "Full translation mode - ${#changed_files[@]} files" >&2
    fi
    
    # Return clean filenames without colored output
    for file in "${changed_files[@]}"; do
        echo "$file"
    done
}

# Function to validate source content (pipeline-focused)
validate_source_content() {
    local course_path="courses/$COURSE_NAME/en"
    
    print_info "Validating source content for pipeline..."
    
    # Check if source files exist
    if [ ! -d "$course_path" ]; then
        print_result 1 "Source directory missing: $course_path"
        return 1
    fi
    
    # Check for required files
    local required_files=("README.md" "lesson-01.md" "lesson-02.md")
    for file in "${required_files[@]}"; do
        if [ ! -f "$course_path/$file" ]; then
            print_result 1 "Required source file missing: $file"
            return 1
        fi
    done
    
    # Validate file structure
    local md_files=$(find "$course_path" -name "*.md" | wc -l)
    if [ $md_files -eq 0 ]; then
        print_result 1 "No markdown files found in source"
        return 1
    fi
    
    print_result 0 "Source content validation passed"
    return 0
}



# Function to detect section-level changes (pipeline-optimized)
detect_section_changes() {
    local file=$1
    
    # In pipeline context, we focus on git diff for change detection
    # Section-level analysis is simplified for efficiency
    
    if [ "$INCREMENTAL_MODE" = "true" ]; then
        # Check if file has been modified in git
        if git diff --name-only HEAD~1 HEAD | grep -q "courses/$COURSE_NAME/en/$file"; then
            echo "modified_file"
        elif git diff --name-only | grep -q "courses/$COURSE_NAME/en/$file"; then
            echo "modified_file"
        else
            echo "unchanged_file"
        fi
    else
        echo "full_translation"
    fi
}

# Function to generate incremental translation prompts
generate_incremental_prompts() {
    local language=$1
    local changed_files=$2
    
    local prompt_file="courses/$COURSE_NAME/$language/incremental-translation-prompts.md"
    
    cat > "$prompt_file" << EOF
# Incremental Translation Prompts for $COURSE_NAME → $language

## Translation Strategy: Incremental Updates

This translation focuses only on changed content to preserve existing translation work.

### Changed Files Detected:
$(for file in $changed_files; do echo "- $file"; done)

### Translation Guidelines:
1. **Preserve existing translations** of unchanged sections
2. **Translate only new/modified content**
3. **Follow templates/translation-template.md** for quality standards
4. **Use templates/quality-template.md** for validation
5. **Maintain technical term consistency**

### Section-Level Translation Process:

EOF
    
    for file in $changed_files; do
        local sections=$(detect_section_changes "$file")
        
        # Determine change status
        local change_status
        case "$sections" in
            "modified_file") change_status="- File has been modified (translate completely)" ;;
            "unchanged_file") change_status="- File unchanged (preserve existing translation)" ;;
            "full_translation") change_status="- Full translation required" ;;
            *) change_status="- Translation status: $sections" ;;
        esac
        
        cat >> "$prompt_file" << EOF

#### File: $file
**Change status:**
$change_status

**Translation instructions:**
- For modified files: Translate completely (pipeline safety)
- For unchanged files: Preserve existing translations
- Maintain file structure and formatting
- Apply quality validation to all content

EOF
    done
    
    cat >> "$prompt_file" << EOF

## Cursor AI Commands

### For New Files:
\`\`\`
Translate this new file to $language following the translation template guidelines. This is a new file, so translate completely.
\`\`\`

### For Modified Files:
\`\`\`
Translate this file completely to $language. The file has been modified, so translate all content for pipeline safety.
\`\`\`

### For Quality Validation:
\`\`\`
Validate this $language translation against the English source. Check for accuracy, completeness, and quality standards.
\`\`\`

## Expected Output

After translation:
- Modified files translated completely
- Unchanged files preserved
- Quality validation passed
- File structure maintained
EOF

    print_result 0 "Generated incremental translation prompts"
    echo "$prompt_file"
}

# Function to generate full translation prompts
generate_full_prompts() {
    local language=$1
    local files=$2
    
    local prompt_file="courses/$COURSE_NAME/$language/full-translation-prompts.md"
    
    cat > "$prompt_file" << EOF
# Full Translation Prompts for $COURSE_NAME → $language

## Translation Strategy: Complete Translation

This is a full translation of all course content.

### Files to Translate:
$(for file in $files; do echo "- $file"; done)

### Translation Guidelines:
1. **Follow templates/translation-template.md** process
2. **Reference templates/course-template.md** for structure
3. **Use templates/quality-template.md** for validation
4. **Preserve technical terms** (Next.js, GitHub, AI, Web3, etc.)
5. **Maintain educational clarity** and cultural appropriateness

### Quality Standards:
- **Accuracy**: Preserve meaning exactly
- **Completeness**: Translate all instructional text
- **Cultural appropriateness**: Adapt for target audience
- **Technical precision**: Handle technical terms correctly

## Cursor AI Commands

### For Course README:
\`\`\`
Translate this course README to $language following the translation template guidelines. Preserve technical terms and maintain educational clarity.
\`\`\`

### For Lesson Files:
\`\`\`
Translate this lesson to $language following the translation template guidelines. Preserve technical terms, maintain structure, and ensure educational clarity.
\`\`\`

### For Quality Validation:
\`\`\`
Validate this $language translation against the English source using the quality template standards. Check for missed translations, technical accuracy, and cultural appropriateness.
\`\`\`

## Expected Output

After translation:
- All files translated completely
- Quality validation passed
- Template compliance verified
- Technical terms preserved
EOF

    print_result 0 "Generated full translation prompts"
    echo "$prompt_file"
}

# Function to validate translations
validate_translations() {
    local language=$1
    local files=$2
    
    print_info "Validating $language translations..."
    
    local validation_errors=0
    
    for file in $files; do
        local translated_file="courses/$COURSE_NAME/$language/$file"
        
        if [ -f "$translated_file" ]; then
            # Check for missed English text
            local missed_count=$(grep -r "[A-Z][a-z]\+ [a-z]\+ [a-z]\+ [a-z]\+ [a-z]\+ [a-z]\+ [a-z]\+ [a-z]\+ [a-z]\+ [a-z]\+" "$translated_file" 2>/dev/null | wc -l)
            
            if [ $missed_count -eq 0 ]; then
                print_result 0 "No missed translations in $file"
            else
                print_warning "Found $missed_count potential missed translations in $file"
                ((validation_errors++))
            fi
        else
            print_warning "Translated file missing: $file"
            ((validation_errors++))
        fi
    done
    
    if [ $validation_errors -eq 0 ]; then
        print_result 0 "Translation validation passed for $language"
    else
        print_warning "Translation validation found $validation_errors issues for $language"
    fi
    
    return $validation_errors
}

# Main translation process
echo "1. Preparing translation environment..."
echo "------------------------------------"

# Validate source content for pipeline
if ! validate_source_content; then
    echo -e "${RED}❌ Source content validation failed${NC}"
    echo "Pipeline will fail - fix source content issues before proceeding"
    exit 1
fi

# Detect changed files
changed_files=$(detect_changed_files)
if [ -z "$changed_files" ]; then
    print_warning "No files to translate"
    exit 0
fi

echo ""
echo "2. Processing target languages..."
echo "-------------------------------"

# Parse target languages
if [ -z "$TARGET_LANGUAGES" ]; then
    # Show available languages
    echo "Available target languages:"
    find "courses/$COURSE_NAME" -maxdepth 1 -type d | grep -v "^courses/$COURSE_NAME$" | grep -v "/en$" | sed 's|.*/||' | while read lang; do
        echo "  - $lang"
    done
    echo ""
    echo "Use: $0 $COURSE_NAME 'es,fr,ja' to translate to multiple languages"
    exit 0
fi

# Convert comma-separated languages to array
IFS=',' read -ra LANGUAGES <<< "$TARGET_LANGUAGES"

for language in "${LANGUAGES[@]}"; do
    echo ""
    echo "Processing language: $language"
    echo "------------------------"
    
    # Create language directory
    if [ ! -d "courses/$COURSE_NAME/$language" ]; then
        mkdir -p "courses/$COURSE_NAME/$language"
        print_result 0 "Created language directory"
    fi
    
    # Validate existing translations (pipeline-focused)
    if [ -d "courses/$COURSE_NAME/$language" ] && [ "$INCREMENTAL_MODE" = "true" ]; then
        print_info "Validating existing translations for incremental mode"
        # Check for basic translation quality
        local existing_files=$(find "courses/$COURSE_NAME/$language" -name "*.md" | wc -l)
        if [ $existing_files -eq 0 ]; then
            print_warning "No existing translations found - will do full translation"
        else
            print_result 0 "Found $existing_files existing translated files"
        fi
    fi
    
    # Generate appropriate prompts
    if [ "$INCREMENTAL_MODE" = "true" ]; then
        prompt_file=$(generate_incremental_prompts "$language" "$changed_files")
    else
        prompt_file=$(generate_full_prompts "$language" "$changed_files")
    fi
    
    # Copy source files to target language directory
    for file in $changed_files; do
        if [ ! -f "courses/$COURSE_NAME/$language/$file" ]; then
            cp "courses/$COURSE_NAME/en/$file" "courses/$COURSE_NAME/$language/$file"
            print_result 0 "Copied $file to $language directory"
        fi
    done
    
    # Validate existing translations
    validate_translations "$language" "$changed_files"
    
    ((TRANSLATED_FILES++))
done

echo ""
echo "3. Translation workflow..."
echo "------------------------"

echo "Translation workflow for $COURSE_NAME:"
echo ""
echo "**Mode**: ${INCREMENTAL_MODE:-'Full translation'}"
echo "**Target Languages**: ${TARGET_LANGUAGES}"
echo "**Changed Files**: $changed_files"
echo ""

for language in "${LANGUAGES[@]}"; do
    echo "For $language translation:"
    echo "1. Open: courses/$COURSE_NAME/$language/$(basename $(generate_incremental_prompts "$language" "$changed_files"))"
    echo "2. Follow the translation instructions"
    echo "3. Use Cursor AI with the provided commands"
    echo "4. Run validation: ./scripts/validate.sh"
    echo ""
done

echo "4. Quality validation..."
echo "----------------------"

# Run quality validation
if [ -f "scripts/validate.sh" ]; then
    print_info "Running quality validation..."
    if ./scripts/validate.sh; then
        print_result 0 "Quality validation passed"
    else
        print_warning "Quality validation found issues"
    fi
else
    print_warning "Quality validation script not found"
fi

# Update STATUS.md with translation results
if [ -f "scripts/update-status.sh" ]; then
    print_info "Updating translation status in STATUS.md..."
    
    # Determine status based on results
    status="Completed"
    if [ $FAILED -gt 0 ]; then
        status="Failed"
    elif [ $WARNINGS -gt 0 ]; then
        status="Completed with Warnings"
    fi
    
    # Update status for the appropriate phase
    if [[ "$TARGET_LANGUAGES" == *"es"* ]] && [[ "$TARGET_LANGUAGES" == *"zh"* ]] && [[ "$TARGET_LANGUAGES" == *"ja"* ]] && [[ "$TARGET_LANGUAGES" == *"ko"* ]]; then
        if [ -f "scripts/update-status.sh" ]; then
            ./scripts/update-status.sh "$COURSE_NAME" "phase1" "$status" "$TARGET_LANGUAGES"
        fi
        # Run pipeline cleanup and commit
        if [ -f "scripts/cleanup.sh" ]; then
            ./scripts/cleanup.sh "$COURSE_NAME" "phase1" "$status" "$TARGET_LANGUAGES"
        fi
    elif [[ "$TARGET_LANGUAGES" == *"fr"* ]] || [[ "$TARGET_LANGUAGES" == *"de"* ]] || [[ "$TARGET_LANGUAGES" == *"pt"* ]]; then
        if [ -f "scripts/update-status.sh" ]; then
            ./scripts/update-status.sh "$COURSE_NAME" "phase2" "$status" "$TARGET_LANGUAGES"
        fi
        # Run pipeline cleanup and commit
        if [ -f "scripts/cleanup.sh" ]; then
            ./scripts/cleanup.sh "$COURSE_NAME" "phase2" "$status" "$TARGET_LANGUAGES"
        fi
    fi
fi

echo ""
echo "=== TRANSLATION SUMMARY ==="
echo "Course: $COURSE_NAME"
echo "Mode: ${INCREMENTAL_MODE:-'Full translation'}"
echo "Target Languages: ${TARGET_LANGUAGES}"
echo "Changed Files: $changed_files"
echo "Languages Processed: ${#LANGUAGES[@]}"
echo "Passed: $PASSED"
echo "Failed: $FAILED"
echo "Warnings: $WARNINGS"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}🎉 Translation setup complete!${NC}"
    echo "Use Cursor AI with the generated prompts to complete translation"
    exit 0
else
    echo -e "${RED}❌ Translation setup failed${NC}"
    exit 1
fi 