#!/bin/bash

# Pipeline Cleanup Script
# This script cleans up temporary files and ensures proper git commits

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${BLUE}ℹ️  INFO:${NC} $1"
}

print_success() {
    echo -e "${GREEN}✅ SUCCESS:${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠️  WARNING:${NC} $1"
}

print_error() {
    echo -e "${RED}❌ ERROR:${NC} $1"
}

# Function to clean up backup files
cleanup_backups() {
    print_info "Cleaning up backup files..."
    
    # Remove STATUS.md backup
    if [ -f "STATUS.md.backup" ]; then
        rm "STATUS.md.backup"
        print_success "Removed STATUS.md.backup"
    fi
    
    # Remove any other backup files
    find . -name "*.backup" -type f -delete
    print_success "Cleaned up all backup files"
}

# Function to clean up translation temporary files
cleanup_translation_files() {
    print_info "Cleaning up translation temporary files..."
    
    # Remove prompt files (these are temporary)
    find . -name "incremental-translation-prompts.md" -type f -delete
    find . -name "full-translation-prompts.md" -type f -delete
    print_success "Removed translation prompt files"
    
    # Remove any other temporary translation files
    find . -name "*translation-temp*" -type f -delete
    find . -name "*prompt-temp*" -type f -delete
    print_success "Cleaned up temporary translation files"
}

# Function to check if files should be committed
check_commit_status() {
    local course_name=$1
    local languages=$2
    
    print_info "Checking files for commit..."
    
    # Check if translation files exist and have content
    local files_to_commit=()
    
    # Parse languages
    IFS=',' read -ra LANG_ARRAY <<< "$languages"
    
    for lang in "${LANG_ARRAY[@]}"; do
        local lang_dir="courses/$course_name/$lang"
        if [ -d "$lang_dir" ]; then
            # Check for required files
            local files=("README.md" "lesson-01.md" "lesson-02.md")
            for file in "${files[@]}"; do
                if [ -f "$lang_dir/$file" ]; then
                    local file_size=$(wc -c < "$lang_dir/$file")
                    if [ $file_size -gt 100 ]; then  # Basic content check
                        files_to_commit+=("$lang_dir/$file")
                    fi
                fi
            done
        fi
    done
    
    # Check if STATUS.md was modified
    if git diff --name-only | grep -q "STATUS.md"; then
        files_to_commit+=("STATUS.md")
    fi
    
    echo "${files_to_commit[@]}"
}

# Function to commit changes
commit_changes() {
    local course_name=$1
    local phase=$2
    local status=$3
    local languages=$4
    
    print_info "Committing translation changes..."
    
    # Get files to commit
    local files_to_commit=$(check_commit_status "$course_name" "$languages")
    
    if [ -z "$files_to_commit" ]; then
        print_warning "No files to commit"
        return 0
    fi
    
    # Add files to git
    for file in $files_to_commit; do
        if [ -f "$file" ]; then
            git add "$file"
            print_info "Added $file to git"
        fi
    done
    
    # Create commit message
    local commit_message="feat: Update translation status for $course_name - Phase $phase ($status)"
    
    # Add language details to commit message
    if [ ! -z "$languages" ]; then
        commit_message="$commit_message - Languages: $languages"
    fi
    
    # Commit changes
    if git commit -m "$commit_message"; then
        print_success "Committed translation changes"
        return 0
    else
        print_error "Failed to commit changes"
        return 1
    fi
}

# Function to validate pipeline success
validate_pipeline() {
    local course_name=$1
    local languages=$2
    
    print_info "Validating pipeline success..."
    
    # Check if translation directories exist
    IFS=',' read -ra LANG_ARRAY <<< "$languages"
    local success_count=0
    
    for lang in "${LANG_ARRAY[@]}"; do
        local lang_dir="courses/$course_name/$lang"
        if [ -d "$lang_dir" ]; then
            # Check for required files
            local files=("README.md" "lesson-01.md" "lesson-02.md")
            local has_all_files=true
            
            for file in "${files[@]}"; do
                if [ ! -f "$lang_dir/$file" ]; then
                    has_all_files=false
                    break
                fi
            done
            
            if [ "$has_all_files" = "true" ]; then
                success_count=$((success_count + 1))
            fi
        fi
    done
    
    local total_languages=${#LANG_ARRAY[@]}
    local success_rate=$((success_count * 100 / total_languages))
    
    print_info "Pipeline success rate: $success_count/$total_languages languages ($success_rate%)"
    
    if [ $success_rate -ge 80 ]; then
        print_success "Pipeline validation passed"
        return 0
    else
        print_error "Pipeline validation failed"
        return 1
    fi
}

# Main execution
main() {
    local course_name=$1
    local phase=$2
    local status=$3
    local languages=$4
    local should_commit=${5:-"true"}
    
    if [ -z "$course_name" ] || [ -z "$phase" ] || [ -z "$status" ]; then
        echo "Usage: $0 <course-name> <phase> <status> [languages] [should-commit]"
        echo ""
        echo "Examples:"
        echo "  $0 ai-for-web3 phase1 'Completed' 'es,zh,ja,ko'"
        echo "  $0 ai-for-web3 phase1 'Completed' 'es,zh,ja,ko' false"
        exit 1
    fi
    
    print_info "Starting pipeline cleanup for course: $course_name"
    print_info "Phase: $phase, Status: $status"
    
    # Clean up backup files
    cleanup_backups
    
    # Clean up translation temporary files
    cleanup_translation_files
    
    # Validate pipeline success
    if [ ! -z "$languages" ]; then
        if validate_pipeline "$course_name" "$languages"; then
            # Commit changes if requested
            if [ "$should_commit" = "true" ]; then
                if commit_changes "$course_name" "$phase" "$status" "$languages"; then
                    print_success "Pipeline cleanup and commit completed successfully"
                else
                    print_error "Pipeline cleanup completed but commit failed"
                    exit 1
                fi
            else
                print_info "Skipping commit as requested"
            fi
        else
            print_error "Pipeline validation failed - not committing changes"
            exit 1
        fi
    else
        print_info "No languages specified - skipping validation"
    fi
    
    print_success "Pipeline cleanup completed"
}

# Run main function with all arguments
main "$@" 