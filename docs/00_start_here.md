# Start Here

This workshop uses a synthetic life insurance dataset to practice natural-language data analysis in ChatGPT Enterprise.

The main idea: upload a structured workbook, ask ChatGPT to understand it as a relational data mart, then ask increasingly complex business questions.

## Recommended Setup

1. Open ChatGPT Enterprise.
2. Select Thinking mode for dataset inspection, data-quality profiling, and complex SQL-style analysis.
3. Upload one workbook:
   - Clean analytics: `data/clean/life_insurance_clean.xlsx`
   - Data quality exercise: `data/dq-learner/life_insurance_dq_learner.xlsx`
4. Paste the opening prompt from `prompts/opening_dataset_inspection.md`.
5. Ask one exercise at a time.

## What This Is About

The data follows the life insurance lifecycle:

```text
Customer -> Application -> Underwriting -> Policy -> Payments -> Lapse / Claim
```

It includes supporting dimensions for products, agents, states, beneficiaries, coverages, and mortality assumptions.

## What To Avoid

- Do not upload both clean and data-quality workbooks in the same learner chat.
- Do not ask ChatGPT to answer from memory; ask it to inspect the workbook and compute.
- Do not accept results without row counts, join logic, and assumptions.
- Do not use the data-quality learner file for normal analytics unless the goal is to practice profiling issues.
