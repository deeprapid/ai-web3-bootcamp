# Course and Lesson Templates

This directory contains templates for creating consistent course and lesson content across DeepRapid University, as well as templates for automated processes like translation. **These templates are based on the actual structure of existing lessons** to ensure compatibility and predictability.

## Template Quick Reference

| Template | Purpose | When to Use | Related Templates |
|----------|---------|-------------|-------------------|
| `course-template.md` | Structure & Format | Creating new courses/lessons | `translation-template.md`, `quality-template.md` |
| `translation-template.md` | Process & Workflow | Translating content | `course-template.md`, `quality-template.md` |
| `quality-template.md` | Validation & Standards | Quality checking any content | `course-template.md`, `translation-template.md` |

## Template Decision Tree

**What do you want to do?**

1. **Create new content?** → Use `course-template.md`
   - Creating a new course
   - Writing new lessons
   - Defining course structure

2. **Translate existing content?** → Use `translation-template.md`
   - Translating English content to another language
   - Following translation process and workflow
   - Managing incremental updates

3. **Validate quality?** → Use `quality-template.md`
   - Checking English content quality
   - Validating translation quality
   - Running automated quality checks

**Need multiple templates?** → Start with the primary template, then reference related templates as needed.

## Template Files

### Content Creation Templates

#### `course-template.md`
Comprehensive template for creating entire courses, including course structure, lesson format, and task structure. **This template includes the complete lesson and task structure** to ensure consistency and LMS compatibility across all courses. **Also includes technical appendix with LMS parsing guidelines for developers.**

### Process Automation Templates

#### `translation-template.md`
Comprehensive template for translating courses from English to any target language. Provides step-by-step instructions for AI or human translators to ensure high-quality, consistent translations that maintain educational value and technical accuracy. **Includes iterative translation process with regex patterns to catch missed translations and references to course template for structure compliance.**

#### `quality-template.md`
**Unified Quality System**: Comprehensive quality validation template for both English source content and translated content. **This is the single source of truth for all quality standards.** Provides automated checks, AI-powered review processes, and quality standards to ensure educational excellence. **Includes regex patterns for finding missed translations, quality scoring system, and integration with other templates.**

## How to Use the Templates

### Creating New Content

#### Creating a New Course
1. **Copy the template:**
   ```bash
   cp templates/course-template.md README.md
   ```

2. **Customize for your course:**
   - Update course name and description
   - Modify learning objectives
   - Adjust prerequisites and requirements
   - Update course structure

3. **Create lesson files:**
   - Use the lesson template structure included in course-template.md
   - Create lesson-01.md, lesson-02.md, etc.
   - Follow the standardized lesson format

4. **Follow the structure:**
   - **7-11 tasks** per lesson (not 2 as in old templates)
   - **No assessment section** (not in actual content)
   - **No troubleshooting section** (not in actual content)
   - **No resources section** (not in actual content)
   - **Include AI Prompts section**
   - **Include Learning Outcomes section**
   - **Include Next Steps section**

### Managing Translations

#### Translation Process
1. **Use the translation template:**
   - Follow step-by-step translation guidelines
   - Apply quality control processes
   - Ensure technical accuracy preservation
   - Maintain cultural appropriateness

2. **Follow the iterative process:**
   - Complete first pass translation
   - Use regex patterns to find missed translations
   - Apply systematic review for remaining English text
   - Complete final verification

3. **Translation workflow:**
   - Create content in English first
   - Use translation template for guidance
   - Apply iterative review process
   - Update translation status

## Template Benefits

### Content Consistency
- **Real Structure**: Templates match actual lesson format
- **LMS Compatible**: Predictable structure for parsing
- **Quality Assurance**: Built-in sections for learning outcomes
- **AI Integration**: AI prompts section included

### Process Automation
- **Translation Guidance**: Step-by-step translation instructions
- **Quality Control**: Systematic review processes
- **Consistency**: Technical glossary ensures term consistency
- **Scalability**: Templates can be used across multiple courses

### Translation Quality
- **Comprehensive Guidelines**: Ensures high-quality translations
- **Iterative Process**: Regex patterns catch missed translations
- **Quality Control**: Systematic review process
- **Cultural Adaptation**: Guidelines for cultural sensitivity

### Scalability
- **Reusable Templates**: Templates can be used across multiple courses
- **Extensible Structure**: Easy to add new sections or requirements
- **Version Control**: Templates can be versioned and improved

## Actual Lesson Structure

Based on analysis of existing lessons, the predictable structure is:

### **Required Sections (in order):**
1. **Title**: `# Lesson X: [Lesson Title]`
2. **Objectives**: `## Objectives` (7 bullet points)
3. **Prerequisites**: `## Prerequisites` (Tools, Accounts, Knowledge, Note)
4. **Setup**: `## Setup: [Setup Section Title]` (5 setup steps)
5. **Tasks & Instructions**: `## Tasks & Instructions`
6. **AI Prompts**: `## AI Prompts for [Lesson Title]`
7. **Learning Outcomes**: `## Learning Outcomes`
8. **Next Steps**: `## Next Steps`

### **Task Structure:**
- **7-11 tasks** per lesson (not 2 as in old templates)
- **3-5 subtasks** per task
- **Goal statement** for each task
- **Detailed instructions** under each subtask

## Best Practices

### Content Creation
- Always use templates for new content
- Maintain consistent structure across all lessons
- Include all required sections and tasks
- Test content before finalizing

### Translation Management
- Use translation template for guidance
- Apply iterative review process
- Maintain cultural sensitivity
- Ensure technical accuracy

### Quality Assurance
- **Use quality template** for all quality validation
- Review content before translation using quality template
- Validate translations using quality template standards
- Test technical accuracy using quality template guidelines
- Ensure cultural appropriateness using quality template criteria

## Template Customization

### Adding New Sections
- Update templates to include new requirements
- Maintain backward compatibility
- Document changes in template README
- Test with existing content

### Language-Specific Adaptations
- Modify content for target language
- Adjust cultural references
- Consider regional technical terminology
- Account for local educational approaches

## Support and Maintenance

### Template Updates
- Regular review and improvement of templates
- Feedback collection from content creators
- Translation quality monitoring
- Continuous optimization

### Documentation
- Keep templates well-documented
- Provide clear usage instructions
- Include examples and best practices
- Maintain version history

## Notes
- Templates are based on actual lesson structure, not theoretical ideals
- Templates guide automated processes for consistency and quality
- **Quality template is the single source of truth for all quality standards**
- Always test new templates with sample content
- Gather feedback from translators and content creators
- Maintain consistency across all courses and languages
- LMS parsing rules are documented in the technical appendix of `course-template.md` 