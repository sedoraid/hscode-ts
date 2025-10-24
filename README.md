# hscode-ts

TypeScript library for working with Harmonized System (HS) codes.

## What are HS Codes?

The Harmonized System (HS) is an internationally standardized system of names and numbers used to classify traded products. HS codes are essential for:

- International trade and customs declarations
- Calculating duties and tariffs
- Trade statistics and analysis
- Regulatory compliance
- E-commerce cross-border transactions

## Documentation

We provide comprehensive documentation about HS codes and implementation guidance:

- **[DOCS_INDEX.md](./ai/DOCS_INDEX.md)** - Complete documentation index and navigation guide
- **[HSCODE_SUMMARY.md](./ai/HSCODE_SUMMARY.md)** - Comprehensive overview of HS codes
- **[IMPLEMENTATION_GUIDE.md](./ai/IMPLEMENTATION_GUIDE.md)** - Technical implementation guide for TypeScript
- **[QUICK_REFERENCE.md](./ai/QUICK_REFERENCE.md)** - Quick reference and cheat sheet

Start with [DOCS_INDEX.md](./ai/DOCS_INDEX.md) to navigate all available documentation.

## Features (Planned)

This TypeScript library will provide:

- ✅ HS code validation and format checking
- ✅ Hierarchical code structure navigation
- ✅ Code lookup and description retrieval
- ✅ Search functionality across HS nomenclature
- ✅ Support for multiple HS versions (HS2017, HS2022, etc.)
- ✅ Country-specific extensions (HTSUS, CN/TARIC, etc.)
- ✅ Type-safe TypeScript interfaces
- ✅ Conversion between HS versions

## Quick Start (Coming Soon)

```typescript
import { HSCode, validateHSCode, getHSCodeInfo } from 'hscode-ts';

// Validate an HS code
const isValid = validateHSCode('847130');

// Get code information
const info = getHSCodeInfo('847130');
console.log(info.description); // "Portable automatic data processing machines"

// Navigate hierarchy
const chapter = info.getChapter(); // Chapter 84
const heading = info.getHeading(); // Heading 8471
```

## Project Status

This project is currently in the planning and research phase. The comprehensive HS code documentation can be found in [HSCODE_SUMMARY.md](./ai/HSCODE_SUMMARY.md).

## License

MIT © 2025 sedoraid
