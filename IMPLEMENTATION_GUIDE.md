# HS Code TypeScript Implementation Guide

This guide provides technical details for implementing HS code functionality in TypeScript.

## Core Data Models

### Basic Interfaces

```typescript
/**
 * Represents a Harmonized System code with its hierarchical structure
 */
interface HSCode {
  /** Full HS code (6-10 digits depending on country) */
  code: string;
  
  /** Two-digit chapter code */
  chapter: string;
  
  /** Four-digit heading code */
  heading: string;
  
  /** Six-digit international subheading code */
  subheading: string;
  
  /** Human-readable description */
  description: string;
  
  /** HS nomenclature version (e.g., "2022", "2017") */
  version: HSVersion;
  
  /** Country-specific extension beyond 6 digits (optional) */
  nationalExtension?: string;
  
  /** ISO country code for national extensions (optional) */
  country?: string;
}

/**
 * HS nomenclature version
 */
type HSVersion = '1988' | '1992' | '1996' | '2002' | '2007' | '2012' | '2017' | '2022';

/**
 * Hierarchical navigation interface
 */
interface HSHierarchy {
  /** Get parent chapter */
  getChapter(): HSChapter;
  
  /** Get parent heading */
  getHeading(): HSHeading;
  
  /** Get all child codes at next level */
  getChildren(): HSCode[];
  
  /** Get sibling codes at same level */
  getSiblings(): HSCode[];
}

/**
 * Chapter-level information (2 digits)
 */
interface HSChapter {
  code: string;           // e.g., "84"
  title: string;          // e.g., "Nuclear reactors, boilers, machinery"
  section: number;        // Section number (1-21)
  sectionTitle: string;   // Section description
  notes?: string[];       // Chapter notes
}

/**
 * Heading-level information (4 digits)
 */
interface HSHeading {
  code: string;           // e.g., "8471"
  title: string;          // e.g., "Automatic data processing machines"
  chapter: string;        // Parent chapter code
  notes?: string[];       // Heading notes
}
```

### Validation

```typescript
/**
 * Validation result for HS codes
 */
interface HSValidationResult {
  valid: boolean;
  errors: ValidationError[];
  warnings: ValidationWarning[];
}

interface ValidationError {
  code: string;
  message: string;
  field?: string;
}

interface ValidationWarning {
  code: string;
  message: string;
}

/**
 * Validates an HS code format and structure
 */
function validateHSCode(
  code: string, 
  options?: ValidationOptions
): HSValidationResult {
  const errors: ValidationError[] = [];
  const warnings: ValidationWarning[] = [];
  
  // Check format (digits only)
  if (!/^\d+$/.test(code)) {
    errors.push({
      code: 'INVALID_FORMAT',
      message: 'HS code must contain only digits'
    });
  }
  
  // Check length (6-10 digits typical)
  if (code.length < 6) {
    errors.push({
      code: 'TOO_SHORT',
      message: 'HS code must be at least 6 digits'
    });
  } else if (code.length > 10) {
    warnings.push({
      code: 'LONG_CODE',
      message: 'Code longer than 10 digits is unusual'
    });
  }
  
  // Additional validation based on options
  if (options?.checkExistence && !codeExistsInDatabase(code)) {
    errors.push({
      code: 'NOT_FOUND',
      message: `HS code ${code} not found in ${options.version} database`
    });
  }
  
  return {
    valid: errors.length === 0,
    errors,
    warnings
  };
}

interface ValidationOptions {
  version?: HSVersion;
  country?: string;
  checkExistence?: boolean;
}
```

### Search and Lookup

```typescript
/**
 * Search options for finding HS codes
 */
interface HSSearchOptions {
  /** Search query string */
  query: string;
  
  /** HS version to search in */
  version?: HSVersion;
  
  /** Search in specific chapter(s) */
  chapters?: string[];
  
  /** Limit number of results */
  limit?: number;
  
  /** Search mode */
  mode?: 'exact' | 'fuzzy' | 'prefix';
  
  /** Include code or description or both */
  fields?: ('code' | 'description')[];
}

/**
 * Search result
 */
interface HSSearchResult {
  code: HSCode;
  score: number;        // Relevance score (0-1)
  highlights?: string[]; // Matched text snippets
}

/**
 * Search for HS codes
 */
async function searchHSCodes(
  options: HSSearchOptions
): Promise<HSSearchResult[]> {
  // Implementation would query database/index
  // Return sorted by relevance score
}

/**
 * Get HS code information by code string
 */
async function getHSCodeInfo(
  code: string,
  version?: HSVersion
): Promise<HSCode | null> {
  // Implementation would query database
}

/**
 * Get all codes in a chapter
 */
async function getChapterCodes(
  chapter: string,
  version?: HSVersion
): Promise<HSCode[]> {
  // Implementation would query database
}
```

### Version Conversion

```typescript
/**
 * Conversion result between HS versions
 */
interface HSConversion {
  sourceCode: string;
  sourceVersion: HSVersion;
  targetCode: string | null;
  targetVersion: HSVersion;
  confidence: 'exact' | 'probable' | 'uncertain' | 'not_found';
  notes?: string;
  alternatives?: string[]; // Other possible target codes
}

/**
 * Convert HS code from one version to another
 */
async function convertHSCode(
  code: string,
  fromVersion: HSVersion,
  toVersion: HSVersion
): Promise<HSConversion> {
  // Implementation would use correlation tables
}

/**
 * Get conversion correlation table between versions
 */
async function getCorrelationTable(
  fromVersion: HSVersion,
  toVersion: HSVersion
): Promise<Map<string, string[]>> {
  // Returns mapping of old codes to new codes
}
```

## Database Schema

### Relational Database Approach

```sql
-- Chapters table
CREATE TABLE hs_chapters (
  id INTEGER PRIMARY KEY,
  version VARCHAR(4) NOT NULL,
  code VARCHAR(2) NOT NULL,
  title TEXT NOT NULL,
  section INTEGER NOT NULL,
  section_title TEXT NOT NULL,
  notes TEXT,
  UNIQUE(version, code)
);

-- Headings table
CREATE TABLE hs_headings (
  id INTEGER PRIMARY KEY,
  version VARCHAR(4) NOT NULL,
  code VARCHAR(4) NOT NULL,
  title TEXT NOT NULL,
  chapter VARCHAR(2) NOT NULL,
  notes TEXT,
  UNIQUE(version, code),
  FOREIGN KEY (version, chapter) REFERENCES hs_chapters(version, code)
);

-- Subheadings table (6-digit codes)
CREATE TABLE hs_codes (
  id INTEGER PRIMARY KEY,
  version VARCHAR(4) NOT NULL,
  code VARCHAR(10) NOT NULL,
  description TEXT NOT NULL,
  chapter VARCHAR(2) NOT NULL,
  heading VARCHAR(4) NOT NULL,
  subheading VARCHAR(6) NOT NULL,
  national_extension VARCHAR(4),
  country VARCHAR(2),
  unit_of_quantity VARCHAR(20),
  UNIQUE(version, code, country),
  FOREIGN KEY (version, heading) REFERENCES hs_headings(version, code)
);

-- Correlation table for version conversions
CREATE TABLE hs_correlations (
  id INTEGER PRIMARY KEY,
  from_version VARCHAR(4) NOT NULL,
  from_code VARCHAR(10) NOT NULL,
  to_version VARCHAR(4) NOT NULL,
  to_code VARCHAR(10) NOT NULL,
  confidence VARCHAR(20) NOT NULL,
  notes TEXT
);

-- Full-text search indexes
CREATE INDEX idx_hs_codes_description ON hs_codes USING GIN (to_tsvector('english', description));
CREATE INDEX idx_hs_codes_code ON hs_codes(code);
CREATE INDEX idx_hs_codes_version ON hs_codes(version);
```

### Document Database Approach (MongoDB/JSON)

```typescript
interface HSCodeDocument {
  _id: string;
  version: HSVersion;
  code: string;
  chapter: {
    code: string;
    title: string;
    section: number;
    sectionTitle: string;
  };
  heading: {
    code: string;
    title: string;
  };
  subheading: string;
  description: string;
  nationalExtension?: string;
  country?: string;
  metadata: {
    unitOfQuantity?: string;
    notes?: string[];
    effectiveDate?: string;
    expirationDate?: string;
  };
  searchTerms: string[]; // Pre-processed for search
}
```

## Data Loading and Management

### Loading HS Data

```typescript
/**
 * Loads HS codes from various data sources
 */
class HSDataLoader {
  /**
   * Load from CSV file
   */
  async loadFromCSV(
    filePath: string,
    version: HSVersion,
    options?: LoadOptions
  ): Promise<number> {
    // Parse CSV and insert into database
    // Return number of codes loaded
  }
  
  /**
   * Load from WCO official format
   */
  async loadFromWCO(
    filePath: string,
    version: HSVersion
  ): Promise<number> {
    // Parse WCO format and insert into database
  }
  
  /**
   * Load country-specific extensions
   */
  async loadNationalExtension(
    filePath: string,
    version: HSVersion,
    country: string
  ): Promise<number> {
    // Load national tariff extensions
  }
}
```

### Caching Strategy

```typescript
/**
 * Cache for frequently accessed HS codes
 */
class HSCodeCache {
  private cache: Map<string, HSCode>;
  private maxSize: number;
  
  constructor(maxSize: number = 10000) {
    this.cache = new Map();
    this.maxSize = maxSize;
  }
  
  get(key: string): HSCode | undefined {
    return this.cache.get(key);
  }
  
  set(key: string, value: HSCode): void {
    // Implement LRU eviction if needed
    if (this.cache.size >= this.maxSize) {
      const firstKey = this.cache.keys().next().value;
      this.cache.delete(firstKey);
    }
    this.cache.set(key, value);
  }
  
  clear(): void {
    this.cache.clear();
  }
}
```

## API Design

### RESTful API

```typescript
// Example Express.js routes
import express from 'express';

const router = express.Router();

/**
 * GET /api/hs-codes/:code
 * Get information about a specific HS code
 */
router.get('/api/hs-codes/:code', async (req, res) => {
  const { code } = req.params;
  const { version = '2022', country } = req.query;
  
  const info = await getHSCodeInfo(code, version as HSVersion);
  if (!info) {
    return res.status(404).json({ error: 'HS code not found' });
  }
  
  res.json(info);
});

/**
 * POST /api/hs-codes/validate
 * Validate an HS code
 */
router.post('/api/hs-codes/validate', async (req, res) => {
  const { code, version, country } = req.body;
  
  const result = await validateHSCode(code, { version, country, checkExistence: true });
  res.json(result);
});

/**
 * GET /api/hs-codes/search
 * Search for HS codes
 */
router.get('/api/hs-codes/search', async (req, res) => {
  const { q, version, chapters, limit = 20 } = req.query;
  
  const results = await searchHSCodes({
    query: q as string,
    version: version as HSVersion,
    chapters: chapters ? (chapters as string).split(',') : undefined,
    limit: parseInt(limit as string)
  });
  
  res.json(results);
});

/**
 * GET /api/hs-codes/chapter/:chapter
 * Get all codes in a chapter
 */
router.get('/api/hs-codes/chapter/:chapter', async (req, res) => {
  const { chapter } = req.params;
  const { version = '2022' } = req.query;
  
  const codes = await getChapterCodes(chapter, version as HSVersion);
  res.json(codes);
});

/**
 * POST /api/hs-codes/convert
 * Convert HS code between versions
 */
router.post('/api/hs-codes/convert', async (req, res) => {
  const { code, fromVersion, toVersion } = req.body;
  
  const conversion = await convertHSCode(code, fromVersion, toVersion);
  res.json(conversion);
});
```

## Testing Strategies

### Unit Tests

```typescript
import { validateHSCode, getHSCodeInfo } from './hscode';

describe('HS Code Validation', () => {
  it('should accept valid 6-digit codes', () => {
    const result = validateHSCode('847130');
    expect(result.valid).toBe(true);
  });
  
  it('should reject codes with non-digits', () => {
    const result = validateHSCode('84713A');
    expect(result.valid).toBe(false);
    expect(result.errors[0].code).toBe('INVALID_FORMAT');
  });
  
  it('should reject codes shorter than 6 digits', () => {
    const result = validateHSCode('8471');
    expect(result.valid).toBe(false);
  });
});

describe('HS Code Lookup', () => {
  it('should retrieve code information', async () => {
    const info = await getHSCodeInfo('847130');
    expect(info).toBeDefined();
    expect(info?.chapter).toBe('84');
    expect(info?.heading).toBe('8471');
  });
  
  it('should return null for non-existent codes', async () => {
    const info = await getHSCodeInfo('999999');
    expect(info).toBeNull();
  });
});
```

### Integration Tests

```typescript
describe('HS Code Search Integration', () => {
  beforeAll(async () => {
    // Initialize test database with sample data
    await initializeTestDatabase();
  });
  
  it('should find codes by description', async () => {
    const results = await searchHSCodes({
      query: 'laptop computers',
      version: '2022'
    });
    
    expect(results.length).toBeGreaterThan(0);
    expect(results[0].code.code).toMatch(/^847130/);
  });
  
  it('should filter by chapter', async () => {
    const results = await searchHSCodes({
      query: 'machines',
      chapters: ['84'],
      version: '2022'
    });
    
    results.forEach(result => {
      expect(result.code.chapter).toBe('84');
    });
  });
});
```

## Performance Considerations

### Indexing Strategy

1. **Primary indexes**: On code, version, country combinations
2. **Full-text search**: On description fields
3. **Composite indexes**: For common query patterns (version + chapter)
4. **Covering indexes**: Include frequently accessed columns

### Query Optimization

```typescript
// Bad: Loading all codes then filtering
async function findCodesInChapterBad(chapter: string): Promise<HSCode[]> {
  const allCodes = await loadAllCodes();
  return allCodes.filter(code => code.chapter === chapter);
}

// Good: Filter at database level
async function findCodesInChapterGood(chapter: string): Promise<HSCode[]> {
  return await db.query(
    'SELECT * FROM hs_codes WHERE chapter = ? AND version = ?',
    [chapter, '2022']
  );
}
```

### Caching Layers

1. **In-memory cache**: For frequently accessed codes (LRU)
2. **Redis/Memcached**: For distributed applications
3. **CDN caching**: For API responses (with appropriate TTL)
4. **Browser caching**: For client-side applications

## Error Handling

```typescript
/**
 * Custom error types for HS code operations
 */
class HSCodeError extends Error {
  constructor(message: string, public code: string) {
    super(message);
    this.name = 'HSCodeError';
  }
}

class HSCodeNotFoundError extends HSCodeError {
  constructor(code: string) {
    super(`HS code ${code} not found`, 'HS_CODE_NOT_FOUND');
  }
}

class HSVersionNotSupportedError extends HSCodeError {
  constructor(version: string) {
    super(`HS version ${version} not supported`, 'VERSION_NOT_SUPPORTED');
  }
}

class HSInvalidFormatError extends HSCodeError {
  constructor(code: string) {
    super(`Invalid HS code format: ${code}`, 'INVALID_FORMAT');
  }
}

// Usage
try {
  const info = await getHSCodeInfo('invalid');
  if (!info) {
    throw new HSCodeNotFoundError('invalid');
  }
} catch (error) {
  if (error instanceof HSCodeNotFoundError) {
    // Handle not found
  } else if (error instanceof HSCodeError) {
    // Handle other HS code errors
  } else {
    // Handle unexpected errors
  }
}
```

## Security Considerations

1. **Input validation**: Always validate and sanitize HS code inputs
2. **SQL injection**: Use parameterized queries
3. **Rate limiting**: Implement API rate limits to prevent abuse
4. **Access control**: Restrict access to sensitive trade data if needed
5. **Audit logging**: Log HS code lookups for compliance purposes

## Deployment Checklist

- [ ] Set up production database with current HS version
- [ ] Configure caching layer (Redis/Memcached)
- [ ] Set up monitoring and logging
- [ ] Implement backup and recovery procedures
- [ ] Configure rate limiting
- [ ] Set up CDN for API responses
- [ ] Document API endpoints
- [ ] Create API authentication mechanism
- [ ] Test with production-like data volume
- [ ] Optimize database indexes
- [ ] Set up alerts for errors and performance issues

## Resources

- WCO HS Database: Official source for HS nomenclature
- UN Comtrade API: Trade statistics with HS codes
- National customs APIs: Country-specific tariff data
- Commercial data providers: Enhanced HS code databases

## Next Steps

1. Choose database technology (PostgreSQL, MongoDB, etc.)
2. Obtain HS nomenclature data for target version(s)
3. Design and implement core data models
4. Build data loading pipeline
5. Implement search and lookup functionality
6. Add version conversion support
7. Create API layer
8. Implement caching
9. Add comprehensive tests
10. Deploy and monitor
