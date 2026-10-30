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