# Data Dictionary

## customers.csv

Grain: one synthetic customer/applicant.

Primary key: `customer_id`

Important fields:
- `synthetic_age_at_first_application`: age used for application and issue-age analysis.
- `sex`: synthetic sex category used for mortality table joins.
- `state`: two-letter state code.
- `income_band`, `occupation_group`, `marital_status`, `household_dependents`: segmentation fields.
- `smoker_status`, `bmi`, `synthetic_health_tier`: synthetic risk indicators.
- `prior_policy_count`: count of prior policies before the data window.

## applications.csv

Grain: one life insurance application.

Primary key: `application_id`

Foreign keys: `customer_id`, `product_id`, `agent_id`

Important fields:
- `application_status`: `Issued`, `Declined`, `Postponed`, `Withdrawn`, or `Incomplete`.
- `underwriting_path`: `Accelerated`, `Simplified`, `Full Underwriting`, or `Guaranteed Issue`.
- `risk_class`: underwriting risk class assigned or declined.
- `days_to_decision`: cycle time from application to decision.
- `placement_flag`: `Y` for issued applications.
- `quoted_annual_premium`: annual premium quoted at application.

## underwriting_evidence.csv

Grain: one underwriting evidence requirement per application.

Primary key: `evidence_id`

Foreign key: `application_id`

Important fields:
- `evidence_type`: source such as lab panel, prescription history, paramed exam, or APS.
- `evidence_status`: `Received` or `Outstanding`.
- `result_category`: clear, minor finding, major finding, or administrative.
- `risk_flag`: whether the requirement raised a risk concern.
- `underwriter_review_required`: whether manual review was required.

## policies.csv

Grain: one issued policy.

Primary key: `policy_id`

Foreign keys: `application_id`, `customer_id`, `product_id`, `agent_id`

Important fields:
- `policy_status`: final status as of 2025-12-31.
- `face_amount`: death benefit on the base policy.
- `annual_premium`: annualized base premium.
- `payment_frequency`: monthly, quarterly, semiannual, or annual.
- `risk_class`, `underwriting_path`, `owner_state`, `issue_age`, `smoker_status_at_issue`: rating and segmentation fields.

## policy_coverages.csv

Grain: one base coverage or rider per policy.

Primary key: `coverage_id`

Foreign key: `policy_id`

## premium_payments.csv

Grain: one scheduled premium billing event.

Primary key: `payment_id`

Foreign key: `policy_id`

Important fields:
- `due_date`: scheduled premium due date.
- `paid_date`: actual payment date if paid.
- `billing_period`: year-month string for grouping.
- `payment_status`: `PAID`, `LATE_PAID`, `PAID_AFTER_GRACE`, `MISSED`, or `GRACE_PERIOD_EXPIRED`.
- `scheduled_premium`, `payment_amount`: expected and collected premium.
- `nsf_flag`: simulated non-sufficient-funds indicator.

## claims.csv

Grain: one claim.

Primary key: `claim_id`

Foreign key: `policy_id`

Important fields:
- `claim_type`: death, accelerated benefit, or terminal illness.
- `contestable_flag`: claim occurred within contestability period.
- `investigation_flag`: claim referred for investigation.
- `paid_amount`: claim benefit paid.

## lapse_events.csv

Grain: one lapse, surrender, or reinstatement event.

Primary key: `lapse_event_id`

Foreign key: `policy_id`

Important fields:
- `policy_duration_month`: duration from issue to lapse/surrender.
- `lapse_reason`: non-payment, replacement, affordability, surrender, etc.
- `reinstated_flag`, `reinstatement_date`: reinstatement outcome.

## mortality_table.csv

Grain: one row per calendar year, age, and sex.

Key: `calendar_year`, `age`, `sex`

Important fields:
- `qx_annual`: illustrative annual mortality rate.
- `expected_deaths_per_100k`: qx scaled to 100,000 lives.

## agents.csv

Grain: one producer or distribution partner.

Primary key: `agent_id`

Important fields:
- `channel`: career agent, brokerage, bank partner, direct digital, or worksite.
- `agent_tier`: producer quality tier.
- `rolling_13_month_persistency_pct`: synthetic quality/persistency indicator.

## products.csv

Grain: one life insurance product.

Primary key: `product_id`

Important fields:
- `product_family`: term life, whole life, universal life, indexed UL, final expense.
- `term_years`: 0 for permanent products.
- `issue_age_min`, `issue_age_max`, `min_face_amount`, `max_face_amount`: eligibility parameters.
