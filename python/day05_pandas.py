# Day 5: Pandas
# Pandas is used to work with tabular data — basically rows and columns like Excel or SQL tables.

import pandas as pd

# Create your first DataFrame
data = {
    "name": ["Emma", "Liam", "Olivia", "Noah", "Jack"],
    "salary": [70000, 85000, 65000, 90000, 93000],
    "department": ["IT", "Data", "HR", "Data", "IT"]
}

df = pd.DataFrame(data)

print(df)

# Inspecting a DataFrame

print(df.head()) # shows the first 5 rows of the data
print(df.info()) # Displays information about the DataFrame, including column, names, data types, non-null counts, and memory usage.
print(df.shape) # Shows the (rows, columns)
print(df.columns) # shows column names
print(df.dtypes) # shows data types
print(df.isnull().sum()) # isnull(): search for missing values; return boolean. .sum() counts the total missing values for column
df = df.fillna(0) # fill those missing values with 0


# Selecting columns
print(df["name"]) # one column; returns a series
print(df[["name"]]) # returns a DataFrame
print(df[["name", "salary"]]) # Multiple columns


# Filtering 
print(df[df["salary"] >= 80000])
print(df[df["department"]== 'IT'])

# combined conditions
print(
    df[
        (df["department"] == 'IT') &
        (df["salary"] >= 80000)
    ]
)

# Exercise
import pandas as pd
data = {
    "name" : ["Emma", "Liam", "Olivia", "Noah", "Sophia"],
    "salary": [70000, 85000, 65000, 90000, 78000],
    "department": ["IT", "Data", "HR", "Data", "Finance"]
}

df = pd.DataFrame(data)

print(df)
print(df.shape)
print(df.columns)

print(df["name"])
print(df[["name", "salary"]])

print(df[df["salary"]>= 80000])

print(df[df["department"] == "Data"])

print(
    df[
        (df["department"] == "Data") &
        (df["salary"] >= 85000)
    ]
)


# Part : 2 Slicing 
# Using .loc[] : Use labels/conditions , With loc[] we can extract a range of rows by their labels instead of integer positions.
print(df.loc[df["salary"] >= 80000])
print(
    df.loc[
        df["salary"] >= 80000,
        ["name", "salary"]
    ]                       
)   # mental model: .loc[rows, columns]                        


# Slicing Using .iloc[] : Use numeric positions
    # Allows us to extract specific rows and columns based on their integer positions starting from 0.
    # Each number represents a position in the DataFrame not the actual label of the row or column.

print(df.iloc[0])
print(df.iloc[0:3])
print(df.iloc[0:3, 0:2]) # [rows 0 through 2 ,  # column 0 through 1]

# Adding a new column
# suppose we want to add a bonus column
df["bonus"] = df["salary"] * 0.10
df["total_compensation"] = df["salary"] + df["bonus"]
print(df)

# Sorting
print(df.sort_values("salary", ascending=False )) # Highest first
print(df.sort_values("salary")) # Lowest first

# sort by multiple columns:
print(
    df.sort_values(
        ["department", "salary"],
        ascending= [True, False]
    )
)

# Exercise 2
print(
    df.loc[
        df["salary"] >= 78000,
        ["name", "salary"]

    ]
)

print(df.iloc[0:3])
print(df.iloc[0:3, 0:2])

df["bonus"] = df["salary"] * 0.10

df["total_pay"] = df["salary"] + df["bonus"]

sorted_df = (df.sort_values("salary", ascending=False))  # sort_values() returns a sorted DataFrame, 
                                                         # but does not automatically overwrite the original df
print(sorted_df[["name","salary","bonus","total_pay"]])

# Grouping and basic summary analysis

data = {
    "name": ["Emma", "Liam", "Olivia", "Noah", "Sophia", "Ethan"],
    "salary": [70000, 85000, 65000, 90000, 78000, 82000],
    "department": ["IT", "Data", "HR", "Data", "Finance", "IT"]
}
df = pd.DataFrame(data)


# value_counts()
print(df["department"].value_counts())

# groupby()
print(
    df.groupby("department")["salary"].mean()
)

print(
    df.groupby("department")["salary"].sum()
)

print(
    df.groupby("department")["salary"].agg(
        ["count", "mean", "min", "max", "sum"]
    )
)


# Exercise 
print(df["department"].value_counts())
print(
     df.groupby("department")["salary"].mean()
)
print(
    df.groupby("department")["salary"].sum()
)
print(
    df.groupby("department")["salary"].min()
)
print(
    df.groupby('department')["salary"].max()
)
print(
    df.groupby("department")["salary"].agg(
        ["count","mean", "min", "max"] 
    )
)

print(
    df.groupby("department")["salary"].mean().sort_values(ascending=False)
)

OR 
average_sal = df.groupby("department")["salary"].mean()
average_sal = average_sal.sort_values(ascending=False)
print(average_sal)


# Read a csv with Pandas

df = pd.read_csv("python/employees.csv")
print(df)

# Inspect data
print(df.head())
print(df.shape)
print(df.size)
print(df.columns)
print(df.dtypes)
print(df.info()) # summary including missing values


# Missing Values
data = {
    "name": ["Emma", "Liam", "Olivia", "Noah"],
    "salary": [70000, 85000, None, 90000],
    "department": ["IT", "Data", "HR", None]
}

df = pd.DataFrame(data)

print(df.isna()) # check missing values
print(df.isna().sum()) # count missing values per colum

# Fill the missing values
df["salary"] = df["salary"].fillna(df["salary"].mean()) # For numerical missing value : fill with mean/median
df["department"] = df["department"].fillna("Unknown") # For categorial missing value : fill with "Unknown"


# Drop missing values
df = df.dropna() # Remove the missing values


# Exercise 4
data = {
    "name": ["Emma", "Liam", "Olivia", "Noah", "Sophia"],
    "salary": [70000, 85000, None, 90000, 78000],
    "department": ["IT", "Data", "HR", None, "Finance"]
}

df = pd.DataFrame(data)

print(df)
print(df.isna().sum())

df["salary"] = df["salary"].fillna(df["salary"].mean())
df["department"] = df["department"].fillna("Unknown")

print(df)

print(df[df["salary"]>= 80000])
print("Average Salary:", df["salary"].mean())


# Exercise 5 : csv with Pandas
"""
    Print the first 5 rows using .head()
    Print the DataFrame shape
    Print the data types
    Check missing values
    Print employees earning >= 80000
    Calculate the average salary
    Calculate average salary by department
    Sort all employees highest → lowest salary
    Print the employee with the highest salary
"""

df = pd.read_csv("python/employees.csv")

print(df.head())
print(df.shape)
print(df.dtypes)

print(df.isna().sum())

print(df[df["salary"] >= 80000])
print("Avg_sal: ",df["salary"].mean())

print(
    df.groupby("department")["salary"].mean()
)
print(df.sort_values("salary", ascending=False))

# For 9
print(df[df["salary"] == df["salary"].max()]) # gets all employee tied to highest salary

# OR 
sorted_df = df.sort_values("salary", ascending=False)
print(sorted_df.iloc[0]) # returns only first-highest paid employee