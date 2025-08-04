# CI/CD Integration Scripts

This directory contains scripts for integrating Cursor AI validation into your CI/CD pipeline.

## Available Scripts

### `validate.sh`
**Purpose**: Comprehensive validation script for Cursor AI quality standards
**Usage**: `./scripts/validate.sh`
**Triggers**: 
- Template compliance checking
- Cross-reference validation
- Content structure verification
- Quality template reference checking
- File structure compliance
- `.cursorrules` compliance validation

### `translate.sh`
**Purpose**: Pipeline-optimized translation script with git-based change detection and TRANSLATIONS.md-driven language selection
**Usage**: 
- `./scripts/translate.sh <course-name>` - Show available languages
- `./scripts/translate.sh <course-name> <language>` - Single language
- `./scripts/translate.sh <course-name> 'es,fr,ja'` - Multiple languages
- `./scripts/translate.sh <course-name> 'es,fr,ja' true` - Incremental mode
- `./scripts/translate.sh <course-name> phase1` - Phase 1 languages (high quality)
- `./scripts/translate.sh <course-name> phase2` - Phase 2 languages (efficiency)
- `./scripts/translate.sh <course-name> all` - All languages from TRANSLATIONS.md
- `./scripts/translate.sh <course-name> es quality` - High-quality single language
- `./scripts/translate.sh <course-name> 'es,zh' fast` - Fast translation mode
- `./scripts/translate.sh <course-name> 'es,zh' pipeline` - CI/CD optimized mode
**Features**:
- **Git diff detection**: Uses `git diff` to detect changed files
- **Pipeline safety**: Fails fast if source content is invalid
- **Multi-language support**: Translate to multiple languages in one run
- **Quality validation**: Validates translations using quality template
- **Smart change detection**: Uses git history for efficient translation
- **No backups needed**: Pipeline safety eliminates need for rollbacks
- **TRANSLATIONS-driven**: Automatically extracts target languages from TRANSLATIONS.md
- **Status tracking**: Automatically updates STATUS.md with translation results
- **Quality modes**: quality, fast, pipeline optimization modes

### `update-status.sh`
**Purpose**: Updates STATUS.md with translation execution results and metrics
**Usage**: 
- `./scripts/update-status.sh <course-name> <phase> <status> [languages]`
**Features**:
- **Automatic status updates**: Updates phase status in STATUS.md
- **Quality score calculation**: Calculates quality scores from translation results
- **Metrics tracking**: Updates completion percentages and language counts
- **Backup creation**: Creates backup before making changes
- **Pipeline integration**: Called automatically by translate.sh

### `cleanup.sh`
**Purpose**: Cleans up temporary files and commits translation changes to git
**Usage**: 
- `./scripts/cleanup.sh <course-name> <phase> <status> [languages] [should-commit]`
**Features**:
- **Backup cleanup**: Removes STATUS.md.backup and other backup files
- **Temporary file cleanup**: Removes translation prompt files and temp files
- **Git commits**: Automatically commits translation files and STATUS.md updates
- **Pipeline validation**: Validates translation success before committing
- **Pipeline integration**: Called automatically by translate.sh

### `deploy.sh`
**Purpose**: Deployment gate script that ensures quality standards before deployment
**Usage**: `./scripts/deploy.sh`
**Features**:
- Runs cursor validation as a prerequisite
- Checks deployment readiness
- Validates content quality
- Ensures template compliance
- Blocks deployment if quality issues exist

## GitHub Actions Integration

### Workflow: `.github/workflows/validation.yml`
**Triggers**: 
- Push to main/develop branches
- Pull requests to main/develop branches
- Changes to courses/, templates/, scripts/, or .cursorrules

**Validation Steps**:
1. **Cursor AI validation**: Runs `./scripts/validate.sh`
2. **Template compliance**: Checks all required templates exist
3. **Cross-reference validation**: Ensures template relationships
4. **File structure validation**: Verifies correct directory structure
5. **Quality summary**: Reports validation results

### Workflow: `.github/workflows/translation.yml`
**Triggers**: 
- Push to main/develop branches with `[translate]` in commit message
- Changes to courses/, scripts/, TRANSLATIONS.md, or STATUS.md

**Translation Steps**:
1. **Translation trigger detection**: Checks for `[translate]` in commit message
2. **Language extraction**: Extracts target languages from commit message
3. **Translation execution**: Runs `./scripts/translate.sh`
4. **Status update**: Updates `STATUS.md` with results
5. **Pipeline cleanup**: Commits translated files and cleans up

## Pre-commit Hook

### Location: `.git/hooks/pre-commit`
**Purpose**: Runs validation before each commit
**Features**:
- Automatic validation on every commit
- Prevents commits with quality issues
- Ensures template compliance
- Validates file structure

## PR-Based Translation

### Translation Triggers
**Usage**: Include `[translate]` in commit messages to trigger translation
**Examples**:
- `[translate:es]` - Translate to Spanish only
- `[translate:es,zh,ja]` - Translate to multiple languages
- `[translate]` - Translate to all languages
- `[translate:phase1]` - Translate Phase 1 languages only

### Translation Pipeline
1. **Trigger Detection**: GitHub Actions detects `[translate]` in commit message
2. **Language Extraction**: Extracts target languages from commit message
3. **Translation Execution**: Runs translation pipeline with quality validation
4. **Status Update**: Updates `STATUS.md` with translation results
5. **Pipeline Cleanup**: Commits translated files and cleans up temporary files

## Pull Request Template

### Location: `.github/pull_request_template.md`
**Purpose**: Guides PR creation with validation checklist
**Includes**:
- Template compliance checklist
- Quality validation requirements
- File change tracking
- Impact assessment
- Testing requirements

## Translation Workflows

### Basic Translation Process
```bash
# Single language translation
./scripts/translate.sh ai-for-web3 es

# Multiple languages translation
./scripts/translate.sh ai-for-web3 'es,fr,ja'

# Incremental translation (only changed content)
./scripts/translate.sh ai-for-web3 'es,fr,ja' true

# Auto-translate all languages from STATUS.md
./scripts/translate.sh ai-for-web3 auto
```

### Translation Features
- **Change Detection**: Uses `git diff` to identify modified files
- **Pipeline Safety**: Fails fast if source content is invalid
- **Quality Validation**: Validates translations using quality template
- **Multi-Language Support**: Translate to multiple languages simultaneously
- **Efficient Translation**: Only translates files that have actually changed

### Translation Workflow
1. **Validate Source**: Ensures source content is valid before translation
2. **Detect Changes**: Script identifies changed files using git diff
3. **Generate Prompts**: Creates detailed translation prompts for Cursor AI
4. **Copy Files**: Copies English source to target language directories
5. **Quality Check**: Validates existing translations for missed content
6. **Translation Guide**: Provides specific instructions for Cursor AI

## Deployment Gates
```yaml
# Example GitHub Actions step
- name: Run deployment gate
  run: ./scripts/deployment-gate.sh
```

### Integration Points
1. **Pre-deployment**: Run before any deployment
2. **Quality gates**: Block deployment if validation fails
3. **Automated checks**: Part of CI/CD pipeline
4. **Manual validation**: Can be run locally

## Validation Checks

### Template Compliance
- [ ] All required templates exist
- [ ] Templates have proper cross-references
- [ ] Template structure is valid
- [ ] Quality template is referenced

### Content Quality
- [ ] Course structure is correct
- [ ] Lesson files follow naming convention
- [ ] README files exist for courses
- [ ] Content meets educational standards

### File Structure
- [ ] Courses in `courses/[course-name]/[language]/`
- [ ] Templates in `templates/`
- [ ] Scripts in `scripts/`
- [ ] Configuration files in root

### Configuration
- [ ] `.cursorrules` file exists and is valid
- [ ] `STATUS.md` is up to date
- [ ] Validation scripts are executable
- [ ] Cross-references are maintained

## Error Handling

### Validation Failures
- **Template missing**: Create or restore missing template
- **Cross-reference broken**: Fix template relationships
- **File structure invalid**: Correct directory structure
- **Quality issues**: Address content quality problems

### Deployment Blocks
- **Quality validation failed**: Fix validation errors
- **Required files missing**: Ensure all files are present
- **Template compliance issues**: Verify template adherence
- **Content quality problems**: Improve content quality

## Best Practices

### For Developers
1. **Run validation locally**: `./scripts/validate.sh`
2. **Check before committing**: Pre-commit hook will catch issues
3. **Follow templates**: Always use established templates
4. **Maintain cross-references**: Keep template relationships intact

### For CI/CD Pipeline
1. **Include in all workflows**: Add validation to every pipeline
2. **Block on failure**: Don't proceed if validation fails
3. **Clear error messages**: Provide actionable feedback
4. **Automated testing**: Run validation in automated tests

### For Deployment
1. **Gate deployment**: Use deployment gate script
2. **Quality first**: Never deploy with quality issues
3. **Rollback plan**: Have rollback strategy if issues found
4. **Monitoring**: Monitor validation results over time

## Troubleshooting

### Common Issues
- **Script not executable**: Run `chmod +x scripts/*.sh`
- **Template missing**: Check if templates exist in `templates/`
- **Cross-reference broken**: Verify "Related Templates" sections
- **File structure wrong**: Ensure correct directory structure
- **Translation issues**: Check for missed English text using regex patterns
- **Git diff problems**: Ensure repository is properly initialized with git
- **Backup conflicts**: Remove existing backups if incremental mode fails

### Debug Commands
```bash
# Check script permissions
ls -la scripts/

# Run validation with verbose output
./scripts/validate.sh

# Check template compliance
grep -r "Related Templates" templates/

# Verify file structure
find courses/ -type f -name "*.md"

# Check for missed translations
grep -r "[A-Z][a-z]\+ [a-z]\+ [a-z]\+ [a-z]\+ [a-z]\+ [a-z]\+ [a-z]\+ [a-z]\+ [a-z]\+ [a-z]\+" courses/*/th/*.md

# Check git diff for changes
git diff --name-only HEAD~1 HEAD | grep courses/
```

## Integration Summary

The CI/CD integration provides:
- ✅ **Automated validation** in GitHub Actions
- ✅ **Pre-commit quality checks**
- ✅ **Deployment gates** for quality assurance
- ✅ **Pull request templates** with validation checklist
- ✅ **Comprehensive error handling**
- ✅ **Clear success/failure reporting**

This ensures that all content meets the unified quality system standards before reaching production. 