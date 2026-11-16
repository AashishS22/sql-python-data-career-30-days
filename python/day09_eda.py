"""
Day : Exploratory Data Analysis (EDA)
    - inspect the data
    - summary statistics
    - missing values
    - distributions
    - correlations
    - spotting possible outliers

"""
import pandas as pd

data = {
    "name": ["Emma", "Liam", "Olivia", "Noah", "Sophia", "Ethan", "Mia", "Lucas"],
    "age": [24, 29, 26, 31, 27, 35, 28, 30],
    "salary": [70000, 85000, 65000, 90000, 78000, 120000, 88000, 72000],
    "experience": [2, 5, 3, 7, 4, 10, 6, 5],
    "department": ["IT", "Data", "HR", "Data", "Finance", "IT", "Finance", "HR"]
}
df = pd.DataFrame(data)
"""
print(df.head())
print(df.shape)
print(df.columns)
print(df.dtypes)
print(df.info()) 
print(df.describe()) # (It gives numeric summaries like: count, mean, std, min, 25%, 50%, 75%, max)

# check missing values
print(df.isna().sum()) 

# check category counts
print(df["department"].value_counts()) 

# For correlation between numeric columns
print(
    df[["age", "salary", "experience"]].corr()
)
#    +1  → strong positive relationship
#    0  → little/no linear relationship
#    -1  → strong negative relationship

# Exercise
print(df.head())
print(df.shape)
print(df.dtypes)
print(df.describe())
print(df.isna().sum())
print(df["department"].value_counts())
print(
    df[["age", "salary", "experience"]].corr()
)
print(f'Average Salary : {df["salary"].mean()}')
print(f'Median salary: {df["salary"].median()}')
print(f'Standard deviation of salary :{df["salary"].std()}')

print(f'Highest salary: {df["salary"].max()}')

print(f'Lowest salary: {df["salary"].min()}')
print(df.sort_values("salary", ascending=False))

highest_indx = df["salary"].idxmax()
print(df.loc[highest_indx, ["name", "salary"]])
min_idx = df["salary"].idxmin()
print(df.loc[min_idx, ["name","salary"]])

## Part 2: Quartiles, IQR, and outlier detection.
    # This is how we move from “that value looks unusual” to a more systematic check.
q1 = df["salary"].quantile(0.25)
q3 = df["salary"].quantile(0.75)

print("Q1:", q1)
print("Q3:", q3)

iqr = q3-q1
print("IQR;",iqr)

# calculate the outlier boundaries:
lower_bound = q1-1.5 * iqr
upper_bound = q3+1.5 * iqr

outliers = df[
    (df["salary"] < lower_bound)| 
    (df["salary"] > upper_bound)
]
print(outliers)

## Exercise 2
q1 = df["salary"].quantile(0.25)
q3 = df["salary"].quantile(0.75)

iqr = q3-q1

lower_bound = q1-1.5 * iqr
upper_bound = q3+1.5 * iqr

outliers = df[
    (df["salary"] < lower_bound)| (df["salary"] > upper_bound)
]
print(outliers)

print("Q1:", q1)
print("Q3:", q3)
print("IQR:", iqr)
print("Lower bound:", lower_bound)
print("Upper bound:", upper_bound)

print(outliers[["name", "salary"]])

## Part 3: Correlation interpretation + grouped EDA.
print(
    df[[ "age","salary","experience"]].corr()
)

# Useful summaries:
print(
    df.groupby("department")["salary"].agg(
        ["count", "mean", "median", "min", "max", "std"]
    )
)
print(
    df.groupby("department")["experience"].mean()
)
print(
    df.groupby("department")[["salary", "experience"]].mean()
)


## Exercise 3
print(
    df[["age", "salary", "experience"]].corr()
)
print(
    df[["salary", "experience"]].corr()
)
print(
    df.groupby("department")["salary"].agg(
        ["count", "mean", "median", "min", "max"]
    )
)
avg_exp = df.groupby("department")["experience"].mean()
print("Average Experience :",avg_exp)
avg_sal = df.groupby("department")["salary"].mean()
print("Department with highest average salary:",avg_sal.idxmax(),avg_sal.max())
print("Department with highest average experience is:", avg_exp.idxmax(),avg_exp.max())

"""

# Final EDA Challenge

# PART A - Basic EDA
print(df.shape)
print(df.columns)
print(df.dtypes)
print(df.describe())
print("Missing Value counts:\n",df.isna().sum())
print("No of employees in each department:\n",df["department"].value_counts())

# PART B - Salary Analysis
print("Salary Summary:\n",df["salary"].agg(
    ["mean","median","std","min","max"]
))
highest_idx = df["salary"].idxmax()
print("Highest-paid employee:\n",df.loc[highest_idx, ["name", "salary"]])
lowest_idx= df["salary"].idxmin()
print("Lowest-paid employee:\n",df.loc[lowest_idx,["name", "salary"]])

# PART c - Outlier Detection
q1 = df["salary"].quantile(0.25)
q3 = df["salary"].quantile(0.75)
iqr = q3-q1
lower_bound = q1 - 1.5 * iqr
upper_bound = q3 + 1.5 * iqr

outliers = df[
    (df["salary"] < lower_bound ) | (df["salary"] > upper_bound)
]
print(outliers[["name", "salary"]])

# PART D - Correlation
print(df[["age", "salary", "experience"]].corr())
print(df[["salary", "experience"]].corr())

# In this dataset,  salary and experience has very strong correlation, meaning employee with more experience tends to have more salary.

## PART E - Department Analysis
print(
    df.groupby("department")["salary"].agg(
        ["count", "mean", "median", "min", "max"]
    )
)

dept_avg_sal = df.groupby("department")["salary"].mean()
print("department with highest average salary:\n",dept_avg_sal.idxmax(), dept_avg_sal.max())

dep_avg_exp = df.groupby("department")["experience"].mean()
max_exp = dep_avg_exp.max()
print(max_exp)
print("department with highest average experience:\n", dep_avg_exp[dep_avg_exp == max_exp])

# PART F - Business Findings

    # 1. IT has the highest average salary.

    # 2. Salary and experience have a very strong positive correlation, meaning employees with more experience tend to earn higher salaries in this dataset.

    # 3. Ethan's $120,000 salary is identified as an outlier using the IQR method.

