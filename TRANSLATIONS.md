# DeepRapid University Translation Configuration

**Last Updated:** August 4, 2025

> **📋 Status Tracking**: For current translation status and progress, see `STATUS.md`. This file contains only configuration and strategy.

## Translation Strategy

### **Quality-First Approach**
- **Phase 1**: High-priority languages with immediate demand
- **Phase 2**: Additional languages with growing markets
- **Quality Gates**: Each phase must pass quality validation before proceeding

### **Translation Phases**

#### **Phase 1: High Priority (Immediate Translation)**
```yaml
phase1:
  languages:
    - code: "es"
      name: "Spanish"
      priority: 1
      market_size: "Large"
      quality_required: 95
    - code: "zh"
      name: "Chinese"
      priority: 2
      market_size: "Massive"
      quality_required: 95
    - code: "ja"
      name: "Japanese"
      priority: 3
      market_size: "Established"
      quality_required: 98
    - code: "ko"
      name: "Korean"
      priority: 4
      market_size: "Strong"
      quality_required: 98
  max_concurrent: 2
  quality_gate: 95
```

#### **Phase 2: Additional Languages (Quality Validated)**
```yaml
phase2:
  languages:
    - code: "fr"
      name: "French"
      priority: 5
      market_size: "Growing"
      quality_required: 90
    - code: "de"
      name: "German"
      priority: 6
      market_size: "Technical"
      quality_required: 95
    - code: "pt"
      name: "Portuguese"
      priority: 7
      market_size: "Active"
      quality_required: 90
    - code: "ru"
      name: "Russian"
      priority: 8
      market_size: "Growing"
      quality_required: 90
    - code: "ar"
      name: "Arabic"
      priority: 9
      market_size: "Emerging"
      quality_required: 85
    - code: "hi"
      name: "Hindi"
      priority: 10
      market_size: "Large"
      quality_required: 85
  max_concurrent: 3
  quality_gate: 90
```

### **Quality Standards**

#### **Translation Quality Requirements**
- **Phase 1**: Minimum 95% quality score
- **Phase 2**: Minimum 90% quality score
- **Technical Accuracy**: 100% required for all phases
- **Cultural Adaptation**: 95% required for all phases

#### **Quality Validation Process**
1. **Automated Checks**: Regex pattern matching for missed translations
2. **AI Validation**: Cursor AI quality review
3. **Manual Review**: Human validation for Phase 1 languages
4. **Quality Gates**: Block progression if standards not met

### **Translation Commands**

#### **PR-Based Translation Triggers**
```bash
# Single language translation
git commit -m "feat: Add Spanish translation [translate:es]"
git push

# Multiple languages
git commit -m "feat: Add multiple translations [translate:es,zh,ja]"
git push

# All languages (default when no language specified)
git commit -m "feat: Update course content [translate]"
git push

# Phase-based translation (legacy approach)
git commit -m "feat: Phase 1 translation [translate:phase1]"
git push
```

#### **Direct Script Commands**
```bash
# Single language with quality focus
./scripts/translate.sh ai-for-web3 es quality

# Multiple languages
./scripts/translate.sh ai-for-web3 'es,zh,ja' quality

# All languages
./scripts/translate.sh ai-for-web3 all quality

# Phase-based (legacy)
./scripts/translate.sh ai-for-web3 phase1
./scripts/translate.sh ai-for-web3 phase2
```

### **Performance Optimization**

#### **Concurrent Translation Limits**
- **Phase 1**: Max 2 concurrent translations (quality focus)
- **Phase 2**: Max 3 concurrent translations (efficiency focus)
- **Quality Mode**: Max 1 concurrent (intensive validation)

#### **Fast Translation Mode**
```bash
# Fast translation (reduced validation for speed)
./scripts/translate.sh ai-for-web3 'es,zh,ja,ko' fast

# Pipeline-optimized (CI/CD friendly)
./scripts/translate.sh ai-for-web3 'es,zh,ja,ko' pipeline
```



### **Configuration Management**

#### **Adding New Languages**
1. Add language to appropriate phase in this file
2. Update quality requirements
3. Test with single language first
4. Integrate into batch process

#### **Quality Thresholds**
- **Minimum Quality**: 85% (Phase 2)
- **Target Quality**: 95% (Phase 1)
- **Excellence Quality**: 98% (Japanese, Korean)

### **Pipeline Integration**

#### **GitHub Actions Workflow**
```yaml
# Translation workflow triggers
- name: Check for translation trigger
  run: |
    if [[ "${{ github.event.head_commit.message }}" == *"[translate]"* ]]; then
      echo "translation_needed=true" >> $GITHUB_OUTPUT
    fi

- name: Run translation pipeline
  run: ./scripts/translate.sh ai-for-web3 "$LANGUAGE" quality
  if: steps.translation-check.outputs.translation_needed == 'true'
```

#### **Translation Trigger Patterns**
```bash
# Single language
[translate:es]     # Spanish only
[translate:zh]     # Chinese only
[translate:ja]     # Japanese only

# Multiple languages
[translate:es,zh]  # Spanish and Chinese
[translate:es,zh,ja,ko]  # Multiple languages

# All languages (default)
[translate]        # All configured languages

# Phase-based (legacy)
[translate:phase1] # Phase 1 languages only
[translate:phase2] # Phase 2 languages only
```

#### **Quality Gates**
- **Pre-translation**: Source content validation
- **Post-translation**: Quality template validation
- **Pipeline**: Automated quality checks
- **Manual**: Human review for high-priority languages

## **Simplified Translation Approach**

### **Future Direction: Eliminating Phases**
As we complete initial translations, we're moving toward a simplified approach:

#### **Target State (All Languages Complete)**
```bash
# Default behavior: translate all changed content
git commit -m "feat: Update course content [translate]"
git push
# → Automatically translates all languages for changed files

# Specific language override
git commit -m "feat: Update course content [translate:es,zh]"
git push
# → Only translates Spanish and Chinese for changed files
```

#### **Benefits of Simplified Approach**
- **Automatic**: No need to specify languages for routine updates
- **Efficient**: Only translates changed content
- **Consistent**: All languages stay synchronized
- **Simple**: Single trigger for all translations

#### **Current State (Phased Approach)**
- **Phase 1**: High-priority languages (es, zh, ja, ko)
- **Phase 2**: Additional languages (fr, de, pt, ru, ar, hi)
- **Manual Control**: Specify languages or phases as needed

#### **Migration Path**
1. **Complete Phase 1**: Finish high-priority languages
2. **Complete Phase 2**: Finish all languages
3. **Enable Auto-Translation**: Default to all languages
4. **Remove Phases**: Simplify to single translation approach

---

**Note**: This configuration enables flexible, quality-focused translation with clear phases and performance optimization options. For current translation status and progress tracking, see `STATUS.md`. 