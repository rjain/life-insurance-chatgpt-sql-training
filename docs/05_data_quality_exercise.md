# Data Quality Exercise

Use the DQ learner workbook:

```text
data/dq-learner/life_insurance_dq_learner_1third.xlsx
```

This workbook intentionally contains realistic data quality issues. The goal is for participants to find, explain, and prioritize issues before doing business analysis.

## Learner Prompt

```text
Treat each worksheet in the uploaded Excel workbook as a relational life insurance data mart.

Before answering business questions, profile the data quality:
1. Check primary-key uniqueness.
2. Check foreign-key joins.
3. Check invalid reference values.
4. Check date order across application, policy, payment, lapse, underwriting, and claim events.
5. Check financial values for signs and reasonableness.
6. Check beneficiary allocation totals.

Return a ranked issue list with:
- issue name
- table and columns
- affected row count
- sample records
- detection logic
- business impact
- recommended remediation
```

## Discussion Questions

- Which issues would block analysis?
- Which issues can be filtered out?
- Which issues require source-system remediation?
- How should ChatGPT communicate uncertainty to a business audience?
- What checks should become reusable prompt patterns?
