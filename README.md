# SQL + Python Data Career - 30 Day Challenge

My 30-day learning journey focused on:

- PostgreSQL
- SQL
- Python
- Pandas
- Data Analysis


## Progress

-  Day 1: PostgreSQL fundamentals, database/table creation, INSERT, SELECT, VALUE, WHERE, ORDER BY, DESC.

- Day 2: SQL filtering with AND, OR, NOT, IN, BETWEEN, LIKE/ILIKE, DISTINCT, LIMIT and sorting.

- Day 3: NULL handling, COALESCE, aliases, calculated columns, DISTINCT, and Multiple column sorting.

- Day 4: SQL aggregate functions : COUNT, SUM, MIN, MAX, AVG, COUNT DISTINCT and introduction to GROUP BY.

- Day 5: GROUP BY, HAVING, WHERE vs HAVING, aggregates filtering, Gouped business summaries.

- Day 6: INNER JOIN, LEFT JOIN, one-to-many relationships, unmatched rows, grouped joins.

- Day 7: Week 1 SQL review — filtering, NULL handling, aggregates, GROUP BY/HAVING, INNER JOIN, LEFT JOIN

- Day 8: 
        3-table joins
        CROSS JOIN
        LEFT JOIN with zero-count cases
        COUNT vs SUM
        multi-column join conditions
        GROUP BY + HAVING
        self-join refresher
        LeetCode: 
                Students and Examinations
                Managers with at least 5 Direct Reports   


- Day 9: 
        UNION     → stack results + remove duplicate rows
        UNION ALL → stack results + keep duplicate rows

        Requirements:
        - same number of columns
        - compatible corresponding data types

        JOIN  → horizontal combination
        UNION → vertical combination

        ORDER BY for full UNION result → at the very end

        PostgreSQL casting:
        CAST(value AS text)
        value::text

- Day 10: 
        basic CTE syntax
        CTE + filtering
        CTE + aggregation
        CTE + LEFT JOIN
        CTE + 3-table JOIN
        multiple CTEs
        joining CTEs together
        using a CTE like a normal table
        top-N / highest-spender pattern


        Mental Concept: 
                build a result
                - give it a name
                - use it like temporary table
 
        
- Day 11: Subqueries
        - scalar subqueries, `IN` / `NOT IN`, nested subqueries, derived tables, and         aggregate comparisons

- Day 12: CASE WHEN:
        - conditional logic, categorization, conditional aggregation, grouped metrics, and CASE-based LeetCode practice

- Day 13: Date functions
         — extracting date parts, ranges, intervals, date arithmetic, recent activity filtering, daily/monthly aggregation, and MySQL DATE_FORMAT
        
- Day 14: String functions and data cleaning
        — CONCAT, UPPER, LOWER, TRIM, LENGTH, SUBSTR, SPLIT_PART, LIKE patterns, capitalization cleaning,  and string aggregation.
        - Completed LeetCode 1667, 1527, and 1484.

- Day 15: Window functions 
        — OVER, PARTITION BY, ROW_NUMBER, RANK, DENSE_RANK, running totals, LAG, LEAD, ranking with CTEs, and top-N-per-group patterns. 
        - Completed LeetCode 176 and 185.


- Day 16: EXISTS, NOT EXISTS, and correlated subqueries 
        — existence checks, anti-joins with NOT EXISTS, correlated aggregates, scalar subqueries in SELECT, comparing rows to group averages/max values, and aggregate subqueries in HAVING. 
        - Completed LeetCode 1978 and 1045.

- Day 17: Self-joins and hierarchical relationships 
        — employee/manager roles, employees earning more than managers, managers with multiple direct reports, employees sharing the same manager, multi-level manager hierarchies, and duplicate-safe employee pairing. Completed LeetCode 1731 and 570.

- Day 18 : ### Day 18 — Views & Temporary Tables
        **Topics Covered**
        - `CREATE VIEW`
        - `CREATE OR REPLACE VIEW`
        - `DROP VIEW`
        - Temporary tables with `CREATE TEMP TABLE`
        - Difference between CTEs, Views, and Temp Tables
        - Aggregations using views
        - Reusing saved query logic for analysis

        **Key Concepts**
        - **CTE:** Exists only within a single query.
        - **View:** Stores a reusable SQL query and reflects current underlying data.
        - **Temp Table:** Stores temporary rows for the current database session.
        - Views can simplify complex analytical queries and make reusable datasets easier to work with.


## SQL Phase — Completed ✅

Completed a structured SQL learning track focused on data analytics, data engineering, and interview-style problem solving.

### Topics Covered

- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- `IN`, `BETWEEN`, `LIKE`, `NULL`, `COALESCE`
- Aggregate functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `GROUP BY` and `HAVING`
- `INNER JOIN`, `LEFT JOIN`, `CROSS JOIN`
- Self-joins and hierarchical relationships
- `UNION` and `UNION ALL`
- Subqueries and correlated subqueries
- `EXISTS` and `NOT EXISTS`
- Common Table Expressions (CTEs)
- `CASE WHEN` and conditional aggregation
- Date and time operations
- String functions and data cleaning
- Window functions:
  - `ROW_NUMBER()`
  - `RANK()`
  - `DENSE_RANK()`
  - `LAG()`
  - `LEAD()`
  - Running totals
  - Rolling windows
- First/latest-row analysis
- Views and temporary tables
- Duplicate detection and removal
- Regular expressions
- Analytical SQL problem-solving

### LeetCode SQL 50

✅ Completed all **50/50 LeetCode SQL 50 problems**

Practice included:

- Aggregations
- Multi-table joins
- Ranking problems
- Conditional aggregation
- First/latest record problems
- Running totals and moving averages
- Correlated subqueries
- Self-joins
- `EXISTS` / `NOT EXISTS`
- `UNION ALL`
- Date filtering
- Regex
- Data modification with `DELETE`

### Final SQL Assessment

**Score: 9.4 / 10**

The final assessment covered:

- Joins and aggregation
- Window functions
- `EXISTS` / `NOT EXISTS`
- Conditional aggregation
- Correlated subqueries
- Self-joins
- `UNION ALL`
- First-row logic
- `LAG()` and previous-row comparisons

### Current Status

**SQL learning phase completed.**

SQL will remain part of regular practice while the roadmap continues into:

**Python → Pandas → Data Analysis → Power BI → Data Engineering**


### Python Day 1 — Fundamentals ✅

**Topics Covered**
- Variables
- Strings, integers, floats, and booleans
- `print()` and f-strings
- Arithmetic operators
- Comparison operators
- `if / elif / else`
- Lists
- `.append()` and `len()`
- `for` loops
- Functions and `return`
- Dictionaries
- `while` loops
- `input()`
- Type conversion
- Basic `try / except` error handling

**Practice Completed**
- Created and printed variables
- Built conditional logic with score ranges
- Created and looped through lists
- Built a salary calculation function
- Created and updated dictionaries
- Used dictionary `.items()`
- Built a `while` loop
- Handled invalid numeric input with `try / except`

**Status:** ✅ Completed

### Python Day 2 — Data Structures & Functions ✅

**Topics Covered**
- List indexing and slicing
- List methods
- Tuples
- Sets
- Functions with multiple return values
- Tuple unpacking
- Lists of dictionaries
- Generator expressions
- List comprehensions
- Basic filtering and aggregation

**Practice Completed**
- Analyzed score lists
- Worked with tuples and sets
- Built a score analysis function
- Processed employee salary data
- Calculated total and average values
- Filtered sales data
- Created filtered lists using list comprehensions

**Status:** ✅ Completed

### Python Day 3 — Files & CSV ✅

**Topics Covered**
- Reading and writing text files
- `open()` with `r`, `w`, and `a`
- `csv.writer()`
- `csv.reader()`
- `csv.DictReader()`
- `csv.DictWriter()`
- Writing headers and rows
- Appending CSV data
- Converting CSV strings to integers
- Filtering CSV records
- Calculating totals, averages, counts, and maximum values

**Practice Completed**
- Created and read text files
- Created employee CSV data
- Read CSV rows using dictionaries
- Filtered employees by department
- Calculated total salary
- Calculated average salary
- Found the highest salary
- Filtered employees earning at least $80,000

**Status:** ✅ Completed

### Python Day 4 — NumPy Basics ✅

**Topics Covered**
- Creating NumPy arrays
- `dtype`, `shape`, and `size`
- Vectorized arithmetic
- `sum()`, `mean()`, `min()`, and `max()`
- Boolean filtering
- 2D arrays
- Row and column indexing
- Aggregations using `axis=0` and `axis=1`

**Practice Completed**
- Analyzed sales data using NumPy
- Increased array values using vectorized operations
- Filtered values based on conditions
- Worked with 2D sales data
- Calculated row-wise and column-wise totals, averages, and maximums

**Status:** ✅ Completed

### Python Day 5 — Pandas Basics ✅

**Topics Covered**
- Creating DataFrames
- Reading CSV files with `pd.read_csv()`
- Inspecting data with `.head()`, `.shape`, `.columns`, `.dtypes`, and `.info()`
- Selecting single and multiple columns
- Filtering rows with conditions
- Using `.loc` and `.iloc`
- Creating calculated columns
- Sorting with `.sort_values()`
- Counting categories with `.value_counts()`
- Grouping data with `.groupby()`
- Aggregating with `.agg()`
- Checking missing values with `.isna().sum()`
- Filling missing values with `.fillna()`
- Basic data cleaning
- Calculating summary statistics
- Finding highest-value records

**Practice Completed**
- Built employee DataFrames
- Filtered employees by salary and department
- Created bonus and total-pay columns
- Calculated departmental salary statistics
- Sorted salary data
- Cleaned missing salary and department values
- Read employee CSV data with Pandas
- Found average salary by department
- Identified the highest-paid employee

**Status:** ✅ Completed

### Python Day 6 — Pandas Data Cleaning ✅

**Topics Covered**
- Renaming columns with `.rename()`
- Cleaning text with `.str.strip()`
- Standardizing capitalization with `.str.title()`
- Cleaning numeric strings with `.str.replace()`
- Converting data types with `.astype()`
- Using `pd.to_numeric(..., errors="coerce")`
- Handling invalid values and `NaN`
- Filling missing values with `.fillna()`
- Detecting duplicates with `.duplicated()`
- Removing duplicates with `.drop_duplicates()`
- Converting date columns with `pd.to_datetime()`
- Extracting year and month from dates
- Building an end-to-end data-cleaning pipeline

**Practice Completed**
- Cleaned messy employee names and departments
- Converted salary strings such as `$70,000` into numeric values
- Converted invalid age values into missing values
- Filled missing ages using the average
- Converted hire dates to datetime format
- Extracted hire year information
- Identified and removed duplicate rows
- Filtered cleaned employee data by salary
- Calculated salary summary statistics

**Status:** ✅ Completed

### Python Day 7 — Pandas Merges, Joins & Concatenation ✅

**Topics Covered**
- Combining DataFrames with `pd.merge()`
- Inner joins
- Left joins
- Outer joins
- Joining on differently named columns with `left_on` and `right_on`
- Combining datasets vertically with `pd.concat()`
- Using `ignore_index=True`
- Grouping merged data
- Filtering merged results
- Sorting combined datasets
- Finding highest group averages with `.idxmax()` and `.max()`

**Practice Completed**
- Joined employee and department datasets
- Compared inner, left, and outer joins
- Handled unmatched rows
- Merged DataFrames with different join-key names
- Combined multiple employee datasets with `concat`
- Calculated average and total salary by department
- Identified the department with the highest average salary
- Filtered high-salary employees
- Sorted final merged datasets by salary

**Status:** ✅ Completed

### Python Day 8 — Deeper Pandas Analysis ✅

**Topics Covered**
- Creating pivot tables with `pivot_table()`
- Multi-level pivot tables
- Using `.map()` for value mapping
- Using `.apply()` with custom functions
- Creating categorical salary bands
- Using `.value_counts()`
- Calculating grouped averages
- Finding the highest group average with `.idxmax()` and `.max()`
- Filtering rows based on overall statistics
- Sorting analytical results

**Practice Completed**
- Built department salary pivot tables
- Compared mean, minimum, and maximum salaries
- Created department and location codes
- Created custom salary categories
- Counted employees by salary band
- Calculated average salary by department
- Identified the department with the highest average salary
- Filtered above-average employees
- Sorted filtered employees by salary

**Status:** ✅ Completed

### Python Day 9 — Exploratory Data Analysis (EDA) ✅

**Topics Covered**
- Inspecting datasets with `.shape`, `.columns`, `.dtypes`, and `.describe()`
- Checking missing values
- Category frequency analysis with `.value_counts()`
- Salary summary statistics
- Using `.idxmax()` and `.idxmin()` to find records
- Quartiles and IQR
- Detecting outliers using IQR boundaries
- Correlation analysis with `.corr()`
- Interpreting correlation strength and direction
- Grouped EDA with `.groupby()` and `.agg()`
- Finding departments with highest average metrics
- Handling ties in grouped analysis
- Writing business findings from data

**Practice Completed**
- Identified highest- and lowest-paid employees
- Detected salary outliers using the IQR method
- Analyzed salary vs. experience correlation
- Compared salary statistics across departments
- Calculated average experience by department
- Identified departments with highest average salary and experience
- Produced business-style findings from EDA results

**Status:** ✅ Completed