# Quantitative Economic History: Industrial Revolution (1760–1914)

## 📌 Research Question

> **"Did early industrial adopters experience a more gradual, sustained climb in GDP per capita, whereas second-wave adopters experienced a compressed, steeper 'catch-up' curve between 1760 and 1914?"** 

This project explores the economic divergence of key global economies during the Industrial Revolution using historical benchmark data from the **Maddison Project Database (MPD 2023)**.

---

## 💡 Key Analytical Findings

1. **Early Industrial Baseline (1760):** The Netherlands (`NLD`) held the highest GDP per capita (~$3.96K 2011 Int$ PPP), followed closely by Great Britain (`GBR`).
2. **Growth Acceleration (1820–1870):** Early adopters displayed steady, continuous output gains as industrial processes matured.
3. **The Catch-Up Curve (1870–1914):** Late adopters (such as Germany and the United States) demonstrated significantly steeper growth curves during the Second Industrial Revolution, compressing decades of growth into shorter timeframes.

---

## 🛠️ End-to-End Workflow 
    
    `+-----------------------------------+  
    |  1. Excel Data Prep & Cleaning    |  
    |  - Maddison Project Data (2023)   |  
    |  - Filtered: GBR, NLD, DEU, FRA,  |  
    |    USA, PRT, JPN (1760–1914)      |  
    +-----------------------------------+  
    │  
    ▼  
    +-----------------------------------+  
    |  2. SQL Server Engineering        |  
    |  - Schema design & data import    |  
    |  - View: \`vw_economic_analisys\`   |  
    |  - Window Functions: LAG(), RANK()|  
    +-----------------------------------+  
    │  
    ▼  
    +-----------------------------------+  
    |  3. Power BI Analytics Dashboard  |  
    |  - Dual-zone executive dashboard  |  
    |  - Fixed timeline vs. dynamic     |  
    |    single-year interaction        |  
    +-----------------------------------+  
    `

### 1\. Excel (Data Preprocessing)

* Extracted historical benchmark data from the Maddison Project Database.
* Isolated key target economies: **Great Britain (`GBR`)**, **Netherlands (`NLD`)**, **Germany (`DEU`)**, **France (`FRA`)**, **United States (`USA`)**, **Portugal (`PRT`)**, and **Japan (`JPN`)**.
* Constrained the temporal range to **1760–1914** to capture the full scope of the First and Second Industrial Revolutions.

### 2\. SQL Server (Data Engineering & Transformation)

* Imported raw benchmark data into SQL Server (`SSMS`).
* Created an analytical staging view (`vw_economic_analisys`) to calculate year-over-year changes and dynamic cross-country rankings using SQL window functions:
  * Used `LAG()` to calculate prior-period GDP per capita (`previous_gdppc`) and annual growth rates (`YoY_Growth_Pct`).
  * Applied `RANK() OVER (PARTITION BY [year] ORDER BY gdppc DESC)` to dynamically evaluate dynamic economic standings for any given year.

### 3\. Power BI (Data Visualization & Interaction Architecture)

Built an interactive executive dashboard displaying metrics in **2011 International Dollars (PPP)**:

* **Historical Trajectory Line Charts (Left Zone):** Visualized long-term trend lines (1760–1914) and year-over-year growth percentage fluctuations across all target economies.
* **Dynamic Single-Year Slice (Right Zone):** Configured a Year Slicer tied to a single-year leaderboard bar chart and a **Top GDP per Capita KPI Card**.
* **Advanced Interaction Design:** Modified visual interaction rules (`Edit Interactions`) to lock line charts on the full multi-century timeline while allowing the leaderboard and KPI card to update dynamically based on the selected year.

---

## 📊 Dataset & Metric Definitions

* **Source:** Maddison Project Database (MPD 2023)
* **Primary Metric (`gdppc`):** Real GDP per capita measured in **2011 International Dollars ($)** adjusted for **Purchasing Power Parity (PPP)**.
* **Why this metric matters:** Using 2011 Int$ PPP allows for consistent cross-country comparison across 150+ years of economic history by controlling for inflation and purchasing power differences.
