# How To Load In ChatGPT

## Fastest Path

Upload one workbook:

- `data/clean/life_insurance_clean_1third.xlsx`
- `data/dq-learner/life_insurance_dq_learner_1third.xlsx`

Then use this prompt:

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

## CSV Alternative

If the workbook upload is slow, upload the CSV files from one folder:

- `data/clean/csv/`
- `data/dq-learner/csv/`

Use the CSV approach when you want participants to see the raw table files. Use the workbook approach when you want the fastest workshop flow.

## Recommended Mode

Use Thinking mode for:

- Dataset inspection
- SQL-style reasoning
- Multi-table joins
- Data quality profiling
- Business interpretation that depends on calculation

Use Instant mode for:

- Short explanations
- Rewording prompts
- Summarizing a result after analysis is complete
