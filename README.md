# Life Insurance ChatGPT SQL Training

Participant-facing assets for a hands-on workshop on using ChatGPT Enterprise with uploaded structured data. The dataset is synthetic and simulates common life insurance workflows: applications, underwriting, policy issue, premium payments, claims, lapses, products, agents, beneficiaries, and mortality reference data.

No live database connector is required. The primary workflow is to upload one Excel workbook into ChatGPT and ask it to inspect the workbook as a relational data mart.

## What To Use

For most exercises, upload one of these files:

- `data/clean/life_insurance_clean.xlsx` - clean analytics dataset
- `data/dq-learner/life_insurance_dq_learner.xlsx` - learner version with intentional data quality issues

Each workbook is about 12 MB and contains one worksheet per table.

If you prefer separate CSV files, use:

- `data/clean/csv/`
- `data/dq-learner/csv/`

## Recommended First Prompt

```text
Treat each worksheet in the uploaded Excel workbook as a relational life insurance data mart.

First inspect the workbook and return:
1. Sheet names
2. Row counts
3. Primary key candidates
4. Foreign key candidates
5. Table grain
6. Important date fields
7. Important financial fields

Then infer the joins and wait for my analysis question.
```

## Repo Layout

```text
docs/       Workshop instructions, dataset overview, metrics, and exercise guides
prompts/    Copy/paste prompt templates for ChatGPT
data/       Clean and data-quality learner datasets
```

## Important Notes

- The dataset is synthetic and privacy-safe.
- Do not treat the mortality table as a real actuarial basis.
- The data-quality learner workbook intentionally contains issues for profiling exercises.
- The repository excludes facilitator answer keys and validation summaries.

Start with `docs/00_start_here.md`.
