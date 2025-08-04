#!/bin/bash

# Update Translation Status Script
# This script updates STATUS.md based on translation execution results

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

# Function to update STATUS.md with translation results
update_translation_status() {
    local phase=$1
    local status=$2
    local quality_score=$3
    local languages=$4
    
    local status_file="STATUS.md"
    local temp_file="STATUS.md.tmp"
    
    print_info "Updating translation status for phase: $phase"
    
    if [ ! -f "$status_file" ]; then
        print_error "STATUS.md not found"
        return 1
    fi
    
    # Create backup
    cp "$status_file" "$status_file.backup"
    
    # Update phase status
    case "$phase" in
        "phase1")
            # Update Phase 1 status
            sed -i.tmp "s/Phase 1: High Priority (Quality-Focused)/Phase 1: High Priority (Quality-Focused) - **Status: $status**/" "$status_file"
            if [ ! -z "$quality_score" ]; then
                sed -i.tmp "s/Quality Target: 95% minimum/Quality Target: 95% minimum (Achieved: $quality_score%)/" "$status_file"
            fi
            ;;
        "phase2")
            # Update Phase 2 status
            sed -i.tmp "s/Phase 2: Additional Languages (Efficiency-Focused)/Phase 2: Additional Languages (Efficiency-Focused) - **Status: $status**/" "$status_file"
            if [ ! -z "$quality_score" ]; then
                sed -i.tmp "s/Quality Target: 90% minimum/Quality Target: 90% minimum (Achieved: $quality_score%)/" "$status_file"
            fi
            ;;
        *)
            print_warning "Unknown phase: $phase"
            return 1
            ;;
    esac
    
    # Update last updated timestamp
    local current_date=$(date '+%B %d, %Y')
    sed -i.tmp "s/Last Updated:.*/Last Updated: $current_date/" "$status_file"
    
    # Clean up temp files
    rm -f "$status_file.tmp"
    
    print_success "Updated STATUS.md for phase $phase"
    
    # Clean up backup if update was successful
    if [ -f "$status_file.backup" ]; then
        rm "$status_file.backup"
        print_info "Cleaned up backup file"
    fi
}

# Function to calculate quality score from translation results
calculate_quality_score() {
    local course_name=$1
    local languages=$2
    
    local total_score=0
    local language_count=0
    
    # Parse languages
    IFS=',' read -ra LANG_ARRAY <<< "$languages"
    
    for lang in "${LANG_ARRAY[@]}"; do
        local lang_dir="courses/$course_name/$lang"
        if [ -d "$lang_dir" ]; then
            # Check if translation files exist and have content
            local files=("README.md" "lesson-01.md" "lesson-02.md")
            local file_score=0
            
            for file in "${files[@]}"; do
                if [ -f "$lang_dir/$file" ]; then
                    local file_size=$(wc -c < "$lang_dir/$file")
                    if [ $file_size -gt 100 ]; then  # Basic content check
                        file_score=$((file_score + 33))
                    fi
                fi
            done
            
            total_score=$((total_score + file_score))
            language_count=$((language_count + 1))
        fi
    done
    
    if [ $language_count -gt 0 ]; then
        echo $((total_score / language_count))
    else
        echo 0
    fi
}

# Function to update translation metrics
update_translation_metrics() {
    local status_file="STATUS.md"
    local course_name=$1
    
    print_info "Updating translation metrics..."
    
    # Count completed languages
    local completed_languages=0
    local total_languages=10  # From TRANSLATIONS.md
    
    # Check for language directories
    for lang in es zh ja ko fr de pt ru ar hi; do
        if [ -d "courses/$course_name/$lang" ]; then
            # Check if all required files exist
            local files=("README.md" "lesson-01.md" "lesson-02.md")
            local has_all_files=true
            
            for file in "${files[@]}"; do
                if [ ! -f "courses/$course_name/$lang/$file" ]; then
                    has_all_files=false
                    break
                fi
            done
            
            if [ "$has_all_files" = "true" ]; then
                completed_languages=$((completed_languages + 1))
            fi
        fi
    done
    
    # Update metrics in STATUS.md
    local completion_percentage=$((completed_languages * 100 / total_languages))
    
    # Update the metrics section
    sed -i.tmp "s/Total Languages:.*/Total Languages: $total_languages (Completed: $completed_languages, $completion_percentage%)/" "$status_file"
    rm -f "$status_file.tmp"
    
    print_success "Updated translation metrics: $completed_languages/$total_languages languages completed"
}

# Main execution
main() {
    local course_name=$1
    local phase=$2
    local status=$3
    local languages=$4
    
    if [ -z "$course_name" ] || [ -z "$phase" ] || [ -z "$status" ]; then
        echo "Usage: $0 <course-name> <phase> <status> [languages]"
        echo ""
        echo "Examples:"
        echo "  $0 ai-for-web3 phase1 'In Progress' 'es,zh,ja,ko'"
        echo "  $0 ai-for-web3 phase1 'Completed' 'es,zh,ja,ko'"
        echo "  $0 ai-for-web3 phase2 'Not Started' 'fr,de,pt,ru,ar,hi'"
        exit 1
    fi
    
    print_info "Updating translation status for course: $course_name"
    print_info "Phase: $phase, Status: $status"
    
    # Calculate quality score if languages provided
    local quality_score=""
    if [ ! -z "$languages" ]; then
        quality_score=$(calculate_quality_score "$course_name" "$languages")
        print_info "Calculated quality score: $quality_score%"
    fi
    
    # Update STATUS.md
    update_translation_status "$phase" "$status" "$quality_score" "$languages"
    
    # Update translation metrics
    update_translation_metrics "$course_name"
    
    print_success "Translation status update complete"
}

# Run main function with all arguments
main "$@" 