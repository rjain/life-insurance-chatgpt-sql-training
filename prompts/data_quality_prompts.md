# Data Quality Prompts

## Full Data Quality Profile

```text
Treat each worksheet in the uploaded Excel workbook as a relational life insurance data mart.

Before answering business questions, profile the data quality:
1. Check primary-key uniqueness.
2. Check foreign-key joins.
3. Check invalid reference values.
4. Check date order across application, policy, payment, lapse, underwriting, and claim events.
5. Check financial values for signs and reasonableness.
6. Check beneficiary allocation totals.

Return a ranked issue list with issue name, table, columns, affected row count, sample records, detection logic, business impact, and recommended remediation.
```

## Join Integrity

```text
Check whether all child records have valid parent records.
Focus on applications, policies, premium payments, claims, lapse events, coverages, beneficiaries, and underwriting evidence.
Return orphan counts and sample IDs.
```

## Business Rule Checks

```text
Check for business-rule violations:
- policy issue date before application date
- claim incurred date before issue date
- paid amount above face amount
- paid payment missing paid date
- negative premium payment amount
- beneficiary shares not summing to 100%

Return counts, examples, and likely business impact.
```
