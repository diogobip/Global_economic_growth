# End-to-End Economic Data Analytics Project
**Dataset:** Maddison Project Economic Historical Data (1760–1914)  
**Tech Stack:** SQL Server (SSMS) & Power BI Desktop  
**Project Goal:** Showcase competency in SQL data transformation (window functions) and Power BI visual storytelling.

---

## 1. Accomplishments to Date

### Phase 1: Data Architecture & SQL Engineering (SSMS)
- **Historical Trajectory Tracking:** Applied the `LAG()` window function partitioned by `countrycode` and ordered by `year` to bring prior-year GDP per capita (`previous_gdppc`) onto the same row as current-year GDP per capita.
- **Cross-Country Leaderboard:** Implemented the `RANK()` window function partitioned by `year` and ordered by `gdppc DESC` to calculate country economic standings dynamically.
- **Data Hygiene:** Applied explicit filtering (`WHERE gdppc IS NOT NULL`) to ensure missing historical records do not distort rankings or metrics.
- **Production Layer Hardening:** Combined data transformation logic into an optimized virtual analytical layer (`vw_economic_analisys`) using proper SQL Server batch control (`ALTER VIEW` + `GO` statements).

### Phase 2: Power BI Connection & Visual Exploration
- Established a direct connection from Power BI Desktop to SQL Server using **Import Mode** to load `vw_economic_analisys`.
- **Base Visualizations Created:**
  1. **Macro Trend Line Chart:** Plotted `gdppc` against `year` across countries to show absolute divergence during the Industrial Revolution.
  2. **Dynamic Leaderboard (Clustered Bar Chart):** Constructed a bar chart sorted descending by `gdppc` to reflect country ranks.
  3. **Global Year Slicer:** Plotted a time slicer (`1760` to `1914`) to control cross-visual filtering.
  4. **DAX Growth Measure:** Created `YoY_Growth_Pct` measure using `DIVIDE()` to calculate annual percentage changes in GDP per capita.

---

## 2. Next Steps for Completion

### Step 1: Canvas Layout & UI Structuring
- Organize the report canvas into an executive 3-zone layout:
  - **Top Banner:** Title Header (`Historical Economic Trajectories 1760–1914`) + Global Year Slicer widget.
  - **Middle KPI Cards:** 2–3 Summary Cards (Top Economy, Max GDP per Capita, Avg European GDP).
  - **Main Body:** Dual visual split (Absolute Trajectory Line Chart + Dynamic Leaderboard Bar Chart).

### Step 2: Visual & Metric Refinements
- **Leaderboard Aggregation:** Ensure the Bar Chart is correctly configured for single-year selection (preventing sum aggregation across 150 years).
- **Growth Curve Smoothing:** Apply a 5-year rolling average in DAX to smooth out high-frequency year-over-year spikes on the growth acceleration chart.
- **Styling & Formatting:** 
  - Switch canvas background to neutral `#F3F4F6`.
  - Enable subtle visual container borders/shadows.
  - Turn on explicit data labels for top leaderboard positions.

### Step 3: Portfolio Presentation & Documentation
- Save final SQL view scripts to a clean `.sql` file with inline comments.
- Export high-resolution dashboard screenshots showing different historical years (e.g., 1760 vs. 1850 vs. 1900).
- Write a short GitHub `README.md` detailing the pipeline architecture (`Source Data -> SQL View Transformation -> DAX Presentation Layer`).