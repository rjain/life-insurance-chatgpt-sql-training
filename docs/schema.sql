-- Generic SQL schema for the synthetic life insurance training pack.
-- Types are intentionally portable across SQLite, DuckDB, and cloud warehouses.

CREATE TABLE customers (
  customer_id TEXT PRIMARY KEY,
  synthetic_age_at_first_application INTEGER,
  sex TEXT,
  state TEXT,
  income_band TEXT,
  occupation_group TEXT,
  marital_status TEXT,
  household_dependents INTEGER,
  smoker_status TEXT,
  bmi REAL,
  synthetic_health_tier TEXT,
  prior_policy_count INTEGER,
  customer_since_date DATE
);

CREATE TABLE applications (
  application_id TEXT PRIMARY KEY,
  customer_id TEXT,
  product_id TEXT,
  agent_id TEXT,
  application_date DATE,
  requested_face_amount INTEGER,
  payment_frequency_requested TEXT,
  underwriting_path TEXT,
  application_status TEXT,
  risk_class TEXT,
  decision_reason TEXT,
  days_to_decision INTEGER,
  placement_flag TEXT,
  quoted_annual_premium REAL,
  replacement_indicator TEXT
);

CREATE TABLE policies (
  policy_id TEXT PRIMARY KEY,
  application_id TEXT,
  customer_id TEXT,
  product_id TEXT,
  agent_id TEXT,
  issue_date DATE,
  policy_status TEXT,
  face_amount INTEGER,
  annual_premium REAL,
  payment_frequency TEXT,
  risk_class TEXT,
  underwriting_path TEXT,
  owner_state TEXT,
  issue_age INTEGER,
  smoker_status_at_issue TEXT,
  billing_method TEXT,
  replacement_indicator TEXT
);

CREATE TABLE premium_payments (
  payment_id TEXT PRIMARY KEY,
  policy_id TEXT,
  due_date DATE,
  paid_date DATE,
  billing_period TEXT,
  scheduled_premium REAL,
  payment_amount REAL,
  payment_status TEXT,
  payment_method TEXT,
  days_late INTEGER,
  nsf_flag TEXT
);
