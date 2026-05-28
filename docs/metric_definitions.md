# Metric Definitions

Use these definitions consistently in training exercises.

## Application and Underwriting

**Application count**: count of rows in `applications`.

**Placement count**: count of applications where `application_status = 'Issued'` or `placement_flag = 'Y'`.

**Placement rate**: placement count divided by application count.

**Decline rate**: count of applications where `application_status = 'Declined'` divided by application count.

**Average underwriting cycle time**: average `days_to_decision`, usually segmented by `underwriting_path`, `risk_class`, product, or channel.

**Manual review rate**: applications with at least one `underwriter_review_required = 'Y'` evidence row divided by application count.

## Policy and Premium

**Issued policy count**: count of rows in `policies`.

**Annualized premium**: sum of `policies.annual_premium`.

**Collected premium**: sum of `premium_payments.payment_amount`.

**Premium collection rate**: sum of `payment_amount` divided by sum of `scheduled_premium`.

**In-force policy count**: policies with `policy_status = 'Active'` as of the analysis date.

## Persistency and Lapse

**Lapse count**: count of `lapse_events` where `lapse_reason <> 'Surrender'` and `reinstated_flag = 'N'`.

**Surrender count**: count of `lapse_events` where `lapse_reason = 'Surrender'`.

**Early lapse count**: lapse events with `policy_duration_month <= 13`.

**Early lapse rate**: early lapse count divided by issued policy count for the same cohort.

**13-month persistency**: 1 minus early lapse rate.

## Claims and Mortality

**Claim count**: count of rows in `claims`.

**Paid claims**: sum of `claims.paid_amount` where `claim_status = 'Paid'`.

**Claim incidence rate**: claim count divided by exposed policy count.

**Contestable claim rate**: claims with `contestable_flag = 'Y'` divided by claim count.

**Actual-to-expected deaths ratio**: actual death claim count divided by expected deaths. A simple training approximation is:

```sql
SUM(CASE WHEN claim_type = 'Death' THEN 1 ELSE 0 END)
/
SUM(mortality_table.qx_annual * exposure_years)
```

For training, exposure years can be approximated from issue date to event date or 2025-12-31.

## Channel Quality

**Agent placement rate**: issued applications divided by all applications by agent or channel.

**Agent early lapse rate**: early lapse count divided by issued policies by agent or channel.

**Agent quality screen**: high placement plus low early lapse plus low outstanding-evidence rate.
