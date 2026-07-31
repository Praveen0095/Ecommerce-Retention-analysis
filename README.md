# 🛒 E-commerce Retention Analysis 

An end-to-end modern data engineering architecture designed to ingest raw transactional data, clean and transform it using scalable distributed frameworks, stage it in a cloud data warehouse, build robust data models via dbt, and visualize key retention insights in Power BI.

---

## 📐 Architecture Overview
<img width="1376" height="768" alt="Gemini_Generated_Image_722he6722he6722h" src="https://github.com/user-attachments/assets/e518b622-13f1-451c-bac5-b014f336b98a" />


The pipeline follows a modern, modular cloud architecture:

1. **Raw Ingestion**: Extracting 1M+ raw e-commerce records in CSV format.
2. **Distributed Data Processing**: Cleaning, handling nulls, type conversions, and feature engineering using **PySpark** hosted on an **AWS EC2** instance.
3. **Data Lake Storage**: Saving optimized, compressed Parquet files to **Amazon S3**.
4. **Cloud Data Warehousing**: Loading Parquet files into a **Snowflake** RAW schema using external stages and `COPY INTO` commands.
5. **Data Transformation & Modeling**: Modular data transformations using **dbt** (Data Build Tool) following staging and mart layers.
6. **BI & Analytics**: Interactive **Power BI** dashboards consuming dbt mart tables for executive decision-making.
7. **Business Insights**: Deriving actionable retention metrics, churn warnings, and Customer Lifetime Value (LTV) strategies.

---

## 🛠️ Tech Stack

| Domain | Technology / Tool | Purpose |
| :--- | :--- | :--- |
| **Compute & Processing** | AWS EC2 & PySpark | Distributed data cleaning and feature engineering |
| **Data Lake** | Amazon S3 | Scalable cloud storage for Parquet files |
| **Data Warehouse** | Snowflake | Enterprise cloud warehousing and staging |
| **Data Transformation** | dbt (Data Build Tool) | Data modeling, staging, and analytics engineering |
| **Data Visualization** | Power BI | Interactive dashboards and business metric reporting |
| **Data Format** | Apache Parquet | Columnar storage optimization |

---
