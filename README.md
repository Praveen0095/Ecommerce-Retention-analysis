# 🛒 E-commerce Retention Analysis 

An end-to-end modern data engineering architecture designed to ingest raw transactional data, clean and transform it using scalable distributed frameworks, stage it in a cloud data warehouse, build robust data models via dbt, and visualize key retention insights in Power BI.

---

## 📐 Architecture Overview
<img width="1376" height="768" alt="Architecture Diagram" src="blob:https://gemini.google.com/4db071a8-6269-420d-b9ae-1747aa75139f" />

The pipeline follows a modern, modular cloud architecture:

1. **Raw Ingestion**: Extracting 1M+ raw e-commerce records in CSV format.
2. **Distributed Data Processing**: Cleaning, handling nulls, type conversions, and feature engineering using **PySpark** hosted on an **AWS EC2** instance.
3. **Data Lake Storage**: Saving optimized, compressed Parquet files to **Amazon S3**.
4. **Cloud Data Warehousing**: Loading raw data into a cloud data warehouse (**Google BigQuery** / **Snowflake**).
5. **Data Transformation & Analytics Engineering**: Modular data transformations using **dbt (Data Build Tool)** structured into clean staging and mart layers.
6. **BI & Analytics**: Interactive **Power BI** dashboards consuming dbt mart tables for executive decision-making.
7. **Business Insights**: Deriving actionable retention metrics, cohort behavior, churn warnings, and Customer Lifetime Value (LTV) strategies.

---

## 🏗️ Data Warehouse Migration Note

> **Note on Data Warehouse Architecture:**  
> This project was initially designed, configured, and staged using **Snowflake**. However, due to the expiration of the Snowflake free trial period, the data warehouse layer was migrated and finalized using **Google BigQuery**. 
>
> The pipeline, dbt project models, and standard SQL queries are fully compatible with BigQuery standard SQL, while preserving the original modular analytics engineering design patterns built for Snowflake.

---

## 🛠️ Tech Stack

| Domain | Technology / Tool | Purpose |
| :--- | :--- | :--- |
| **Compute & Processing** | AWS EC2 & PySpark | Distributed data cleaning and feature engineering |
| **Data Lake** | Amazon S3 | Scalable cloud storage for Parquet files |
| **Data Warehouse** | Google BigQuery *(previously Snowflake)* | Cloud data warehousing, staging, and analytics queries |
| **Data Transformation** | dbt (Data Build Tool) | Data modeling, staging layers, and analytics engineering |
| **Data Visualization** | Power BI | Interactive dashboards and business metric reporting |
| **Data Format** | Apache Parquet | Columnar storage optimization |

---

## 📁 Repository Structure

All dbt project configurations, models, and scripts are stored inside the `dbt/` subdirectory:

```text
Ecommerce-Retention-analysis/
├── dbt/
│   ├── dbt_project.yml          # Core dbt project configuration
│   ├── packages.yml             # Project dependencies and packages
│   ├── macros/                 
│   ├── seeds/                   
│   ├── snapshots/               
│   ├── tests/                  
│   └── models/
│       ├── staging/             # Initial cleaning, casting, & naming
│       └── marts/               # Business-facing analytical models
│          
├── Snowflake/                   # Initial Snowflake staging scripts (historical)
├── logs/
├── target/
└── README.md

```


## 📊 Analytical Scope & dbt Models

This project models static historical e-commerce data across two core transformation layers:

1. **Staging Layer (`dbt/models/staging/`)**
   * Cleans raw transactional datasets, casts data types, standardizes column naming, and registers sources in `_sources.yml`.
   * **Models:** `stg_rfm_analysis`, `stg_Churn_analysis`, `stg_cohort_analysis_24M`, `stg_customer_segments`.

2. **Marts Layer (`dbt/models/marts/`)**
   * Aggregates staging models into business-ready fact and dimension tables ready for BI visualization.
   * **Key Metrics Covered:**
     * **RFM Segmentation:** Recency, Frequency, and Monetary scoring to segment customers into actionable tiers.
     * **Cohort & Retention Analysis:** 24-month customer retention behavior and drop-off tracking.
     * **Churn Analysis:** Churn identification based on customer inactivity thresholds.

---

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone [https://github.com/Praveen0095/Ecommerce-Retention-analysis.git](https://github.com/Praveen0095/Ecommerce-Retention-analysis.git)
cd Ecommerce-Retention-analysis

```

### 2. Configure dbt Profile

Ensure your local `~/.dbt/profiles.yml` is configured for Google BigQuery (or Snowflake):

```yaml
ecommerce_retention_analysis:
  target: dev
  outputs:
    dev:
      type: bigquery
      method: service-account
      project: your-gcp-project-id
      dataset: analytics
      threads: 4
      keyfile: path/to/your/bigquery-key.json

```

> ⚠️ **Security Notice:** Credentials and `profiles.yml` are excluded from version control via `.gitignore`.

### 3. Running dbt Commands

Target or run commands directly inside the `dbt/` subdirectory:

```bash
# Verify project parsing
dbt parse --project-dir dbt

# Execute models and data quality tests
dbt build --project-dir dbt

# Generate and view project documentation and lineage DAG
dbt docs generate --project-dir dbt
dbt docs serve --project-dir dbt

```

---

## 📈 Quality & Testing

* **Data Quality Tests:** Schema-level test constraints (`not_null`, `unique`, `accepted_values`) are configured in `_staging__models.yml` and `_marts__models.yml`.
* **Lineage & Dependency Tracking:** Model dependencies and DAG relationships are explicitly managed using dbt's native `{{ source() }}` and `{{ ref() }}` functions.
---
