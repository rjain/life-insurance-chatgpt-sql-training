# Dataset Overview

The dataset is a synthetic life insurance data mart. It is designed to feel like an operational analytics extract without using real customer data.

## Core Tables

| Table | Purpose |
|---|---|
| `customers` | Synthetic applicant and customer attributes |
| `applications` | Submitted applications and underwriting outcomes |
| `uw_evidence` / `underwriting_evidence` | Underwriting requirements such as lab, RX, APS, and review indicators |
| `policies` | Issued policy records |
| `coverages` / `policy_coverages` | Base death benefit and rider details |
| `payments` / `premium_payments` | Scheduled and actual premium payment events |
| `claims` | Death and accelerated benefit claim records |
| `lapse_events` | Lapse, surrender, and reinstatement events |
| `beneficiaries` | Beneficiary relationship and allocation details |
| `agents` | Producer and channel details |
| `products` | Product definitions |
| `mortality_table` | Illustrative mortality reference data |
| `state_demo` / `state_demographics` | Synthetic state-level context |

## Clean Dataset Scale

- 12,667 customers
- 15,000 applications
- 10,637 issued policies
- 134,727 premium payment rows
- 48,690 underwriting evidence rows
- 65 claims
- 818 lapse events

## Common Join Paths

```text
customers.customer_id -> applications.customer_id
applications.application_id -> policies.application_id
policies.policy_id -> payments.policy_id
policies.policy_id -> claims.policy_id
policies.policy_id -> lapse_events.policy_id
policies.policy_id -> beneficiaries.policy_id
policies.policy_id -> coverages.policy_id
agents.agent_id -> applications.agent_id / policies.agent_id
products.product_id -> applications.product_id / policies.product_id
customers.state -> state_demo.state
policies.issue_age + sex/year -> mortality_table
```

## Analysis Themes

- Underwriting funnel and placement rate
- Cycle time by underwriting path
- Agent and channel performance
- Early lapse and 13-month persistency
- Premium collection behavior
- Claims and contestability
- Actual-to-expected mortality approximations
- Data quality profiling before analysis
