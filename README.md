# Exploring Tokopedia E-Commerce Data: SQL, Python, and Effective Data Visualization

## Table of Contents
- [File Structures](#file-structures)
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Features](#features)
- [Libraries Used](#libraries-used)
- [Installation](#installation)
- [Model Outputs](#model-outputs)
- [Conclusion](#conclusion)
- [Recommendations](#recommendations)

## File Structures
```
├── Data Visualization
|   ├── Dashboard
|   |   └── Dashboard.pdf
|   └── Data
|       └── df.xlsx
├── Python
|   ├── Dashboard
|   |   └── Dashboard.pdf
|   └── Data
|       ├── customer_detail.csv
|       ├── order_detail.csv
|       ├── payment_detail.csv
|       └── sku_detail.csv
|   ├── 01_Peta Kasus Kusta (Y).png
|   ├── 02_Peta Kepadatan Penduduk (X1).png
|   ├── 03_Peta Rumah Sehat (X2).png
|   ├── 04_Peta Air Minum Aman (X3).png
|   ├── 05_Peta Tempat dan Fasilitas Umum (X4).png
|   └── 06_Peta Sanitasi Layak (X5).png
├── Output
│   ├── Koef.csv
│   ├── Matriks Pembobot Fix Gaussian fixx.csv
│   ├── Output dari Syntax
│   ├── Z.csv
|   └── jarak euclidean fix.csv
├── Syntax Program R
|   ├── Syntax GWNBR.R
|   ├── Syntax Statistika Deskriptif.R
|   └── Syntax Uji Asumsi Spasial.R
├── LICENSE
└── README.md
```
## PROJECT OVERVIEW
This repository contains a data analysis project utilizing SQL, Python, and Looker Studio to gain meaningful insights from business data. The project is divided into three main parts:
- **SQL Analysis**: This section involves querying databases to extract, clean, and analyze data. Using SQL, we explored the data to uncover trends and patterns, such as sales performance across different periods, which provided foundational insights for further analysis.
- **Python Data Processing and Visualization**: In this part, Python was employed to automate data processing tasks and create visual representations. Leveraging libraries like Pandas, Matplotlib, and Seaborn, we cleaned and transformed data, conducted exploratory data analysis (EDA), and generated visualizations that highlighted key metrics and trends.
- **Looker Studio Dashboard**: Finally, we used Looker Studio to build a comprehensive, interactive dashboard for data visualization. This dashboard consolidates metrics like sales, profit, and customer counts by category and payment method, providing a clear and interactive view of the business data for stakeholders.

Each tool plays a vital role in the project, with SQL handling data extraction, Python enabling data manipulation and visualization, and Looker Studio bringing it all together in a dashboard format. This project showcases an end-to-end approach to data analytics, starting from raw data extraction to interactive data presentation.

## TOOLS USED
This project leverages various tools and technologies across data extraction, analysis, and visualization stages:
- **PostgreSQL (SQL)**: Used for querying and extracting data from the relational database. PostgreSQL was chosen for its robustness in handling complex queries and aggregations, allowing efficient data manipulation and retrieval to explore sales trends, customer behaviors, and other key metrics.
- **Google Colab and Jupyter Notebook (Python)**: Python was used for data cleaning, transformation, and exploratory data analysis (EDA).
  - **Google Colab**: This cloud-based platform allows you to run Python code without local setup, making it easier to share notebooks and collaborate.
  - **Jupyter Notebook**: Used for local analysis and testing. Jupyter offers a flexible environment to combine code, outputs, and markdown documentation, making the analysis process both intuitive and reproducible.
- **Google Sheets**: Used for lightweight data cleaning, manipulation, and preliminary visualizations. Google Sheets provided a quick way to manage and organize data, especially when making minor adjustments or calculations before importing into other tools.
- **Looker Studio**: Google Looker Studio (formerly Data Studio) was used to build an interactive dashboard for visualizing key insights. It offers powerful, customizable visualizations and supports multiple data sources, making it ideal for creating a dynamic reporting interface for stakeholders. Looker Studio allowed the integration of various dimensions and metrics to provide an intuitive, user-friendly dashboard experience.

Each tool played a unique role in facilitating the end-to-end data analysis process, from data extraction to final reporting and visualization. Together, they provided a comprehensive solution for understanding and presenting business insights effectively.

## PROJECT HIGHLIGHTS
### 1. Unveiling E-Commerce Patterns: A Transaction Analysis with SQL
For detail explanation in Bahasa, you can check here :
[Medium](https://medium.com/@malikirafli/unveiling-e-commerce-patterns-a-transaction-analysis-with-sql-587595eae73c)


And for full query you can check here :
[SQL Query File](https://github.com/mohmalikirafli/exploring-tokopedia-sql-python-data-visualization/blob/37a21cc50caddc82aa5380b9d1c158917fd9aec7/SQL/query.sql)

#### QUESTIONS

#### SOME ANALYSIS & INSIGHT


### 2. Driving E-Commerce Growth: User Behavior and Demand Analysis with Python (JUPYTER NOTEBOOK)
For detail explanation in Bahasa, you can check here :
[Medium](https://medium.com/@malikirafli/driving-e-commerce-growth-user-behavior-and-demand-analysis-with-python-870d2d2f3824)

And for full query you can check here :
[Full Jupyter Notebook](https://github.com/mohmalikirafli/exploring-tokopedia-sql-python-data-visualization/blob/37a21cc50caddc82aa5380b9d1c158917fd9aec7/Python/Exploring_Tokopedia_E_Commerce_Data.ipynb)



### 3. Crafting Visual Narratives: E-Commerce Data Storytelling with Looker Studio
For detail explanation in Bahasa, you can check here :
[Medium](https://medium.com/@malikirafli/crafting-visual-narratives-e-commerce-data-storytelling-with-looker-studio-571f4df43ec7)
(https://github.com/mohmalikirafli/exploring-tokopedia-sql-python-data-visualization/blob/37a21cc50caddc82aa5380b9d1c158917fd9aec7/Data%20Visualization/Dashboard/Campaign_Performance_Dashboard_%20(5).pdf)
And for full dashboard you can check here :
[LOOKER STUDIO DASHBOARD](https://lookerstudio.google.com/s/roL3FshyzWA)


### PROJECT CONCLUSIONS
This sales data analysis project employs SQL and Python to provide valuable insights into trends and product performance on Tokopedia during 2021 and 2022. It was discovered that August 2021 was the month with the highest transactions, indicating a strong potential for seasonal promotions. The analysis revealed that the Mobile & Tablets category dominated sales in 2022, with the COD payment method remaining a customer favorite. Additionally, in-depth evaluations showed that best-selling products, such as the Idroid BALRX7-Gold, have significant promotional potential, while declines in the Others category, particularly with products like the RB_Dettol Germ Busting Kit-bf, require more effective marketing strategies. The analysis also highlighted a concerning 37.81% decrease in average weekend sales, suggesting that current promotional campaigns are not effectively boosting weekend transactions.

Data visualization using Looker Studio has effectively illustrated sales patterns and business performance, emphasizing key trends and anomalies. Further investigation is needed to understand the sales decline at the end of the year and the dominance of payment methods like Jazzvoucher. Recommendations include reassessing promotional strategies for less popular payment methods, such as Jazzwallet, and addressing the identified anomalies. By leveraging Python and SQL for data analysis, along with visualization tools, this project can aid in formulating more effective marketing strategies, ultimately supporting the achievement of business objectives in the future.
