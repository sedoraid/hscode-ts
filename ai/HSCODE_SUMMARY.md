# Harmonized System (HS) Codes - Summary Documentation

## What are HS Codes?

The Harmonized System (HS) is an internationally standardized system of names and numbers used to classify traded products. Developed and maintained by the World Customs Organization (WCO), HS codes are used by customs authorities around the world to identify products for the application of duties and taxes and for the gathering of statistics.

## Purpose and Importance

HS codes serve several critical purposes in international trade:

1. **Customs Classification**: Enable customs authorities to determine the appropriate duties and taxes for imported goods
2. **Trade Statistics**: Provide standardized data for trade analysis and policy-making
3. **Trade Facilitation**: Streamline customs procedures and reduce trade barriers
4. **Risk Assessment**: Help identify goods that require special handling or inspection
5. **Trade Agreements**: Used to specify products covered by preferential trade agreements
6. **Regulatory Compliance**: Facilitate enforcement of import/export regulations

## Structure and Format

### Code Hierarchy

HS codes follow a hierarchical structure with increasing specificity:

- **2 digits**: Chapter (e.g., 84 - Nuclear reactors, boilers, machinery)
- **4 digits**: Heading (e.g., 8471 - Automatic data processing machines)
- **6 digits**: Subheading (e.g., 847130 - Portable automatic data processing machines)

Many countries extend HS codes beyond 6 digits for more detailed classification:
- **8 digits**: Some countries add national subdivisions (e.g., U.S. uses HTSUS)
- **10 digits**: Statistical suffixes for detailed trade data

### Example Breakdown

For HS code `8471.30`:
```
84     - Chapter: Nuclear reactors, boilers, machinery
8471   - Heading: Automatic data processing machines and units
847130 - Subheading: Portable automatic data processing machines
```

## HS Code Sections

The HS is organized into 21 sections and 99 chapters:

1. **Section I (Chapters 1-5)**: Live animals and animal products
2. **Section II (Chapters 6-14)**: Vegetable products
3. **Section III (Chapter 15)**: Animal or vegetable fats and oils
4. **Section IV (Chapters 16-24)**: Prepared foodstuffs, beverages, tobacco
5. **Section V (Chapters 25-27)**: Mineral products
6. **Section VI (Chapters 28-38)**: Products of chemical industries
7. **Section VII (Chapters 39-40)**: Plastics and rubber
8. **Section VIII (Chapters 41-43)**: Raw hides, skins, leather
9. **Section IX (Chapters 44-46)**: Wood and articles of wood
10. **Section X (Chapters 47-49)**: Pulp, paper, paperboard
11. **Section XI (Chapters 50-63)**: Textiles and textile articles
12. **Section XII (Chapters 64-67)**: Footwear, headgear, umbrellas
13. **Section XIII (Chapters 68-70)**: Articles of stone, ceramics, glass
14. **Section XIV (Chapter 71)**: Precious metals, stones, jewelry
15. **Section XV (Chapters 72-83)**: Base metals and articles
16. **Section XVI (Chapters 84-85)**: Machinery and electrical equipment
17. **Section XVII (Chapters 86-89)**: Vehicles, aircraft, vessels
18. **Section XVIII (Chapters 90-92)**: Optical, photographic, medical instruments
19. **Section XIX (Chapter 93)**: Arms and ammunition
20. **Section XX (Chapters 94-96)**: Miscellaneous manufactured articles
21. **Section XXI (Chapter 97)**: Works of art, collectors' pieces

## Common Use Cases

### 1. Import/Export Operations
- Determining applicable tariffs and duties
- Completing customs declarations
- Calculating landed costs

### 2. Trade Compliance
- Verifying product classifications
- Ensuring regulatory compliance
- Managing licenses and permits

### 3. Supply Chain Management
- Optimizing logistics routes based on tariff codes
- Managing inventory with proper classifications
- Calculating total cost of ownership

### 4. E-commerce
- Automatic duty calculation for international shipments
- Product categorization for cross-border sales
- Integration with shipping carriers and customs brokers

### 5. Trade Analytics
- Market research and opportunity identification
- Competitive analysis by product category
- Trade flow analysis and forecasting

## Version Management

The WCO updates the HS nomenclature approximately every 5 years:

- **HS 1988**: Original version (1,241 headings)
- **HS 1992**: First revision
- **HS 1996**: Second revision
- **HS 2002**: Third revision (5,019 subheadings)
- **HS 2007**: Fourth revision (5,052 subheadings)
- **HS 2012**: Fifth revision (5,205 subheadings)
- **HS 2017**: Sixth revision (5,387 subheadings)
- **HS 2022**: Seventh revision (current - 5,609 subheadings)

## National Variations

While the first 6 digits are standardized internationally, countries add their own extensions:

### United States - HTSUS (Harmonized Tariff Schedule)
- 10-digit codes
- Managed by the U.S. International Trade Commission
- Additional statistical suffixes

### European Union - CN (Combined Nomenclature)
- 8-digit codes
- Extended with TARIC (10-12 digits) for specific EU measures
- Updated annually

### Canada - Canadian Customs Tariff
- 10-digit codes
- Aligned with HS but with Canadian-specific classifications

### Other Countries
- Most countries use 8-10 digit codes
- National extensions reflect local trade priorities and statistical needs

## Implementation Considerations for TypeScript

### Data Structures

When implementing HS code handling in TypeScript, consider:

```typescript
interface HSCode {
  code: string;           // The full HS code
  chapter: string;        // 2-digit chapter
  heading: string;        // 4-digit heading
  subheading: string;     // 6-digit subheading
  description: string;    // Text description
  version: string;        // HS version (e.g., "HS2022")
  nationalExtension?: string; // Country-specific digits
}
```

### Validation

- **Format validation**: Ensure codes follow proper digit patterns
- **Existence validation**: Verify codes exist in the current HS version
- **Version compatibility**: Handle transitions between HS versions
- **Country-specific rules**: Support national extensions

### Key Features to Implement

1. **Code Lookup**: Fast retrieval of HS code descriptions
2. **Search**: Full-text search across descriptions
3. **Hierarchy Navigation**: Browse chapter/heading/subheading structure
4. **Validation**: Verify code format and validity
5. **Conversion**: Map codes between HS versions
6. **Country Support**: Handle national extensions (HTSUS, CN, etc.)
7. **Duty Calculation**: Integration with tariff rate databases

### Data Sources

- **WCO**: Official HS nomenclature and updates
- **National customs authorities**: Country-specific extensions and rates
- **Commercial APIs**: Third-party data providers
- **Open datasets**: Public trade data repositories

## Challenges and Considerations

### 1. Complexity
- Over 5,000 subheadings in HS 2022
- Multiple valid classifications possible for some products
- Requires expert knowledge for accurate classification

### 2. Version Management
- Periodic updates every 5 years
- Backward compatibility requirements
- Migration paths between versions

### 3. Country Variations
- Different national extensions
- Varying duty rates and regulations
- Local compliance requirements

### 4. Data Quality
- Maintaining accurate, up-to-date databases
- Handling ambiguous or edge cases
- Quality assurance and validation

### 5. Performance
- Fast lookup in large datasets
- Efficient search and filtering
- Caching strategies for frequently used codes

## Best Practices

1. **Always use the correct HS version**: Ensure you're using the version applicable for your transaction date
2. **Verify with authorities**: When in doubt, consult customs authorities or experts
3. **Document assumptions**: Keep records of classification decisions
4. **Maintain audit trails**: Track changes and updates to classifications
5. **Regular updates**: Keep your HS code database current with official releases
6. **User-friendly search**: Implement intuitive search for non-experts
7. **Provide context**: Include descriptions and examples with codes
8. **Support multiple languages**: HS descriptions are available in multiple languages

## References and Resources

### Official Sources
- **World Customs Organization (WCO)**: https://www.wcoomd.org/
- **HS Nomenclature 2022**: Official WCO publication
- **UN Comtrade**: United Nations trade statistics database

### Country-Specific Resources
- **USA - USITC**: https://www.usitc.gov/ (HTSUS)
- **EU - TARIC**: https://ec.europa.eu/taxation_customs/taric
- **Canada**: https://www.cbsa-asfc.gc.ca/
- **UK**: https://www.gov.uk/trade-tariff

### Tools and APIs
- Customs authorities' online lookup tools
- Commercial HS code databases and APIs
- Trade management software platforms

### Standards and Documentation
- WCO HS Convention
- Explanatory Notes to the HS
- Classification Opinions and rulings

## Glossary

- **Chapter**: First two digits of HS code
- **Heading**: First four digits of HS code
- **Subheading**: Six-digit HS code (internationally standardized)
- **Tariff item**: National extension beyond 6 digits
- **Duty**: Tax imposed on imported goods
- **WCO**: World Customs Organization
- **HTSUS**: Harmonized Tariff Schedule of the United States
- **CN**: Combined Nomenclature (EU)
- **TARIC**: Integrated Tariff of the European Union

## License

This documentation is provided for informational purposes. Always consult official sources and customs authorities for authoritative classification guidance.
