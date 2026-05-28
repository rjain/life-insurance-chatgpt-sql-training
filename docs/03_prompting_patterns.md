# Prompting Patterns

## Ask For Schema Inspection First

```text
Before answering, inspect the workbook structure.
Return table grain, row counts, candidate keys, and join paths.
```

## Ask For SQL-Like Logic

```text
Use SQL or SQL-like logic.
Show CTEs or intermediate steps.
Validate row counts after major joins.
```

## Ask For Assumptions

```text
State assumptions before calculating.
If a metric definition is ambiguous, propose a definition and use it consistently.
```

## Ask For Business Interpretation

```text
After the result table, explain the business meaning in life insurance terms.
Call out operational implications and data-quality caveats.
```

## Ask For Data Quality Profiling

```text
Before trusting the results, check primary keys, foreign keys, date sequence, financial reasonableness, and allocation totals.
Rank issues by business impact.
```
