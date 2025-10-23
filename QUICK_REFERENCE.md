# HS Code Quick Reference

A concise reference guide for working with Harmonized System codes.

## Code Structure

```
Chapter (2 digits)
└── Heading (4 digits)
    └── Subheading (6 digits)
        └── National Extension (8-10 digits)

Example: 8471.30.00.00
├── 84: Chapter - Machinery
├── 8471: Heading - Data processing machines
├── 847130: Subheading - Portable computers
└── 8471300000: Full HTSUS code (US)
```

## Common Chapters

| Chapter | Description |
|---------|-------------|
| 01-05 | Live animals & animal products |
| 06-14 | Vegetable products |
| 25-27 | Mineral products |
| 28-38 | Chemicals |
| 39-40 | Plastics & rubber |
| 44-49 | Wood, paper |
| 50-63 | Textiles |
| 64-67 | Footwear, headgear |
| 72-83 | Base metals |
| 84-85 | Machinery & electrical equipment |
| 86-89 | Vehicles, aircraft, vessels |
| 90-92 | Precision instruments |
| 94-96 | Furniture, toys, misc |

## Key Terminology

- **Chapter**: First 2 digits (e.g., 84)
- **Heading**: First 4 digits (e.g., 8471)
- **Subheading**: 6-digit international code (e.g., 847130)
- **Tariff item**: National extension beyond 6 digits
- **HTSUS**: US Harmonized Tariff Schedule (10 digits)
- **CN**: EU Combined Nomenclature (8 digits)
- **TARIC**: EU Integrated Tariff (10-12 digits)

## HS Versions Timeline

| Version | Year | Subheadings |
|---------|------|-------------|
| HS 2022 | Current | 5,609 |
| HS 2017 | 2017-2021 | 5,387 |
| HS 2012 | 2012-2016 | 5,205 |
| HS 2007 | 2007-2011 | 5,052 |
| HS 2002 | 2002-2006 | 5,019 |

## Validation Rules

✅ **Valid HS Code**:
- 6-10 digits (most common)
- All numeric characters
- Starts with valid chapter (01-97)
- Exists in current HS version

❌ **Invalid HS Code**:
- Contains letters or special characters
- Less than 6 digits
- Starts with 98 or 99 (reserved)
- Non-existent code in database

## Common Use Cases

### 1. Import/Export
```typescript
// Classify product for customs
const hsCode = '847130'; // Laptops
const dutyRate = getDutyRate(hsCode, 'US');
```

### 2. E-commerce
```typescript
// Calculate international shipping costs
const product = {
  hsCode: '847130',
  value: 1000,
  weight: 2.5
};
const totalCost = calculateLandedCost(product, 'GB');
```

### 3. Trade Analytics
```typescript
// Analyze import trends
const imports = getImportData({
  hsCode: '8471',  // All computers
  country: 'US',
  year: 2023
});
```

## Popular HS Codes

| Code | Description | Common Use |
|------|-------------|------------|
| 847130 | Portable computers | Laptops, tablets |
| 851712 | Mobile phones | Smartphones |
| 620520 | Men's shirts | Apparel |
| 640399 | Footwear | Shoes, boots |
| 901380 | Liquid crystal devices | LCD displays |
| 392321 | Plastic bags/sacks | Packaging |
| 854231 | Processors & controllers | CPUs, microcontrollers |
| 950450 | Video game consoles | Gaming systems |
| 610910 | T-shirts | Cotton t-shirts |
| 871120 | Motorcycles | Motorcycles 50-250cc |

## Country-Specific Systems

### United States (HTSUS)
- 10 digits
- Example: 8471.30.01.00
- Source: USITC

### European Union (CN/TARIC)
- CN: 8 digits
- TARIC: 10-12 digits
- Example: 8471 30 00 00
- Source: EU Taxation & Customs

### Canada
- 10 digits
- Example: 8471.30.00.00
- Source: CBSA

### United Kingdom
- 10 digits (post-Brexit)
- Example: 8471300000
- Source: UK Trade Tariff

## Quick Commands (TypeScript Examples)

```typescript
// Validate format
const isValid = /^\d{6,10}$/.test(code);

// Extract hierarchy
const chapter = code.slice(0, 2);
const heading = code.slice(0, 4);
const subheading = code.slice(0, 6);

// Format for display
const formatted = code.slice(0, 4) + '.' + code.slice(4, 6);
// Result: "8471.30"

// Check chapter range
const isValid = parseInt(chapter) >= 1 && parseInt(chapter) <= 97;
```

## Data Sources

### Official
- **WCO**: World Customs Organization (international)
- **USITC**: US International Trade Commission
- **TARIC**: EU customs database
- **UN Comtrade**: Trade statistics

### Commercial
- Various API providers offer HS code databases
- Customs brokers and freight forwarders
- Trade compliance software platforms

## Best Practices

1. ✅ **Use current version**: Always use applicable HS version
2. ✅ **Validate input**: Check format and existence
3. ✅ **Document source**: Record where classification came from
4. ✅ **Handle versions**: Support multiple HS versions
5. ✅ **Cache results**: Cache frequently accessed codes
6. ✅ **Verify with experts**: Consult for complex products
7. ❌ **Don't guess**: Never assume classification
8. ❌ **Don't use expired**: Avoid outdated HS versions for new transactions

## Common Mistakes

1. **Using wrong version**: Check transaction date
2. **Incomplete codes**: Use full 6-digit minimum
3. **Wrong country extension**: HTSUS vs CN vs others
4. **Ignoring updates**: HS updates every 5 years
5. **Over-classification**: Don't add unnecessary specificity
6. **Under-classification**: Ensure sufficient detail

## Troubleshooting

### Code Not Found
- Check version (HS2017 vs HS2022)
- Verify format (remove spaces, dots)
- Try parent heading (4-digit)
- Consult official database

### Multiple Matches
- Review product details carefully
- Check chapter notes
- Consult explanatory notes
- Get expert ruling if needed

### Version Conversion Issues
- Some codes split in new versions
- Some codes merge in new versions
- Use official correlation tables
- May require manual review

## Resources Quick Links

- WCO: https://www.wcoomd.org/
- USITC: https://hts.usitc.gov/
- EU TARIC: https://ec.europa.eu/taxation_customs/dds2/taric/taric_consultation.jsp
- UK Tariff: https://www.gov.uk/trade-tariff
- UN Comtrade: https://comtrade.un.org/

## TypeScript Type Definitions

```typescript
// Basic types for quick copy-paste
type HSCode = string;              // e.g., "847130"
type HSChapter = string;           // e.g., "84"
type HSHeading = string;           // e.g., "8471"
type HSSubheading = string;        // e.g., "847130"
type HSVersion = '2017' | '2022';
type CountryCode = string;         // ISO 2-letter

interface HSCodeInfo {
  code: HSCode;
  description: string;
  chapter: HSChapter;
  heading: HSHeading;
  version: HSVersion;
}
```

## Regex Patterns

```typescript
// Basic format validation
const HS_CODE_REGEX = /^\d{6,10}$/;

// With optional dots (international format)
const HS_CODE_WITH_DOTS = /^\d{4}\.\d{2}(\.\d{2})?(\.\d{2})?$/;

// Chapter only
const HS_CHAPTER_REGEX = /^(0[1-9]|[1-8][0-9]|9[0-7])$/;

// Heading only
const HS_HEADING_REGEX = /^\d{4}$/;

// Subheading (6 digits)
const HS_SUBHEADING_REGEX = /^\d{6}$/;
```

## Examples by Industry

### Electronics
- 847130 - Laptops
- 851712 - Smartphones  
- 854231 - Processors
- 852872 - TV receivers

### Apparel
- 610910 - T-shirts (cotton)
- 620520 - Men's shirts
- 640399 - Footwear (leather)
- 420310 - Garments of leather

### Automotive
- 870323 - Cars (1500-3000cc)
- 870880 - Suspension parts
- 401120 - Pneumatic tires
- 870829 - Auto parts

### Food & Beverage
- 090111 - Coffee (not roasted)
- 220421 - Wine
- 170111 - Cane sugar (raw)
- 040221 - Milk powder

## Support

For detailed information, see:
- [HSCODE_SUMMARY.md](./HSCODE_SUMMARY.md) - Complete overview
- [IMPLEMENTATION_GUIDE.md](./IMPLEMENTATION_GUIDE.md) - Technical guide

## License

MIT © 2025 sedoraid
