# HS Code Documentation - Table of Contents

Welcome to the comprehensive documentation for Harmonized System (HS) codes and the hscode-ts TypeScript library.

## Documentation Overview

This repository contains extensive documentation about HS codes organized into several guides:

### 📚 [HSCODE_SUMMARY.md](./HSCODE_SUMMARY.md)
**Comprehensive overview of Harmonized System codes**

A complete guide to understanding HS codes, their purpose, structure, and applications.

**Topics covered:**
- What are HS codes and why they matter
- Code structure and hierarchy (chapters, headings, subheadings)
- The 21 sections and 99 chapters of the HS system
- Common use cases across industries
- Version management (HS 1988 through HS 2022)
- National variations (HTSUS, CN/TARIC, etc.)
- Implementation considerations
- Data sources and challenges
- Best practices and references

**Best for:** Anyone new to HS codes, business analysts, trade compliance professionals

---

### 🔧 [IMPLEMENTATION_GUIDE.md](./IMPLEMENTATION_GUIDE.md)
**Technical implementation guide for TypeScript developers**

Detailed technical specifications and patterns for building HS code functionality in TypeScript.

**Topics covered:**
- Core data models and TypeScript interfaces
- Database schema design (relational and document)
- Validation logic and error handling
- Search and lookup implementations
- Version conversion algorithms
- Data loading and management
- Caching strategies
- RESTful API design
- Testing strategies
- Performance optimization
- Security considerations
- Deployment checklist

**Best for:** Software developers, architects, technical leads implementing HS code functionality

---

### ⚡ [QUICK_REFERENCE.md](./QUICK_REFERENCE.md)
**Quick reference guide for developers**

A concise cheat sheet for quick lookups and common operations.

**Topics covered:**
- Code structure diagrams
- Common chapters at a glance
- Key terminology
- HS versions timeline
- Validation rules
- Popular HS codes by category
- Country-specific systems
- TypeScript code snippets
- Regex patterns
- Troubleshooting guide
- Resource links

**Best for:** Developers who need quick answers, copy-paste code examples, or a reminder of key concepts

---

### 📖 [README.md](./README.md)
**Project introduction and getting started**

Overview of the hscode-ts project and planned features.

**Topics covered:**
- Project introduction
- What are HS codes (brief)
- Planned library features
- Quick start examples
- Project status
- License information

**Best for:** First-time visitors, potential users evaluating the library

---

## How to Use This Documentation

### 🎯 If you're new to HS codes:
1. Start with [README.md](./README.md) for a quick introduction
2. Read [HSCODE_SUMMARY.md](./HSCODE_SUMMARY.md) for comprehensive understanding
3. Reference [QUICK_REFERENCE.md](./QUICK_REFERENCE.md) as needed

### 💻 If you're implementing HS code functionality:
1. Review [HSCODE_SUMMARY.md](./HSCODE_SUMMARY.md) to understand the domain
2. Study [IMPLEMENTATION_GUIDE.md](./IMPLEMENTATION_GUIDE.md) for technical details
3. Use [QUICK_REFERENCE.md](./QUICK_REFERENCE.md) during development

### 🔍 If you need specific information:
1. Check [QUICK_REFERENCE.md](./QUICK_REFERENCE.md) first for quick answers
2. Refer to specific sections in [IMPLEMENTATION_GUIDE.md](./IMPLEMENTATION_GUIDE.md) for technical details
3. Consult [HSCODE_SUMMARY.md](./HSCODE_SUMMARY.md) for conceptual understanding

## Key Concepts

### What are HS Codes?
Harmonized System codes are internationally standardized product classification codes used in customs and international trade.

### Code Structure
```
84.71.30
└─┬──┬──┬
  │  │  └─ Subheading (6 digits)
  │  └──── Heading (4 digits)  
  └─────── Chapter (2 digits)
```

### Current Version
HS 2022 is the current version with 5,609 subheadings.

### National Extensions
Countries extend the 6-digit international codes:
- **USA (HTSUS)**: 10 digits
- **EU (CN)**: 8 digits
- **Canada**: 10 digits
- **UK**: 10 digits

## Documentation Statistics

| Document | Lines | Size | Topics |
|----------|-------|------|--------|
| HSCODE_SUMMARY.md | ~246 | ~9.5 KB | 15+ major sections |
| IMPLEMENTATION_GUIDE.md | ~707 | ~16 KB | 12+ technical topics |
| QUICK_REFERENCE.md | ~293 | ~7.3 KB | 20+ quick references |
| README.md | ~54 | ~1.7 KB | Project overview |
| **Total** | **~1,300** | **~35 KB** | **Comprehensive** |

## Common Questions

**Q: Which HS version should I use?**  
A: Use the version that was in effect on the date of your transaction. Currently, HS 2022 is in effect.

**Q: What's the difference between HS codes and HTSUS?**  
A: HS codes are the international 6-digit standard. HTSUS is the US system that extends to 10 digits.

**Q: How often do HS codes change?**  
A: The WCO updates the HS nomenclature approximately every 5 years.

**Q: Can I use the same code for all countries?**  
A: The first 6 digits are standardized internationally. National extensions (digits 7-10) vary by country.

**Q: Where can I find official HS code data?**  
A: See the references section in [HSCODE_SUMMARY.md](./HSCODE_SUMMARY.md) for official sources.

## Contributing

This documentation is part of the hscode-ts project. Contributions and improvements are welcome.

## Additional Resources

### Official Organizations
- **WCO** (World Customs Organization): Global HS standards
- **USITC** (US International Trade Commission): US tariff schedules
- **EU Taxation & Customs**: EU TARIC database
- **UN Comtrade**: Global trade statistics

### Related Standards
- ISO 3166 (Country codes)
- ISO 4217 (Currency codes)
- INCOTERMS (International trade terms)
- UOM (Units of Measure)

## License

This documentation is provided under the MIT License.

## Support

For questions about:
- **HS code concepts**: See [HSCODE_SUMMARY.md](./HSCODE_SUMMARY.md)
- **Implementation**: See [IMPLEMENTATION_GUIDE.md](./IMPLEMENTATION_GUIDE.md)
- **Quick lookups**: See [QUICK_REFERENCE.md](./QUICK_REFERENCE.md)
- **Official rulings**: Consult your national customs authority

---

**Last Updated:** October 2025  
**Documentation Version:** 1.0  
**HS Version Covered:** HS 2022 (current)
