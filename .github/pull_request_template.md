# Pull Request: [Brief Description]

## Description
[Describe the changes made in this PR]

## Type of Change
- [ ] New course content
- [ ] Translation updates
- [ ] Template modifications
- [ ] Quality improvements
- [ ] Bug fix
- [ ] Documentation update

## Template Compliance Checklist
- [ ] Content follows `templates/course-template.md` structure
- [ ] Translation process follows `templates/translation-template.md`
- [ ] Quality validation uses `templates/quality-template.md`
- [ ] Cross-references between templates are maintained
- [ ] File structure follows established conventions

## Quality Validation
- [ ] Cursor AI validation script passes (`./scripts/validate.sh`)
- [ ] All templates have proper cross-references
- [ ] `.cursorrules` file is up to date
- [ ] Content meets educational quality standards
- [ ] Technical accuracy verified
- [ ] GitHub Actions validation workflow will run automatically

## Files Changed
[List the files that were modified, added, or deleted]

### Content Files
- [ ] Course README files
- [ ] Lesson files
- [ ] Translation files

### Template Files
- [ ] Course template
- [ ] Translation template
- [ ] Quality template
- [ ] Template README

### Configuration Files
- [ ] `.cursorrules`
- [ ] `STATUS.md`
- [ ] Validation scripts

## Testing
- [ ] Cursor validation script runs successfully
- [ ] Template compliance verified
- [ ] Cross-references checked
- [ ] File structure validated
- [ ] GitHub Actions workflows will run automatically

## Impact
- [ ] No breaking changes to existing content
- [ ] Template relationships maintained
- [ ] Quality standards preserved
- [ ] Educational value enhanced

## Additional Notes
[Any additional information or context for reviewers]

---

**Note**: This PR will trigger automated validation checks including:
- GitHub Actions validation workflow (runs automatically)
- Cursor AI quality validation
- Template compliance verification
- Cross-reference validation
- File structure validation

**Translation Workflow**: If this PR includes `[translate]` in the commit message, the translation workflow will also run automatically.

Please ensure all checks pass before merging. 