"""
Day 8 : Deeper Pandas Analysis
   - pivot_table()
   - map()
   - apply()
   - more realistic grouped analysis
   - preparing for EDA and visualization

"""

# 1. Pivot Tables : summarize data by groups.

import pandas as pd

"""
data = {
    "name": ["Emma", "Liam", "Olivia", "Noah", "Sophia", "Ethan"],
    "department": ["IT", "Data", "HR", "Data", "Finance", "IT"],
    "salary": [70000, 85000, 65000, 90000, 78000, 82000]
}

df = pd.DataFrame(data)

print(
    df.pivot_table(
        values = "salary",
        index = "department",
        aggfunc="mean"
    )
)
print(
    df.pivot_table(
        values="salary",
        index = "department",
        aggfunc=["mean", "min", "max"]
    )
)

# 2. map() : map() is useful when you want to transform values in a single Series.

df["department_code"]= df["department"].map({
    "IT":"TECH",
    "Data":"DATA",
    "Finance":"FIN",
    "R":"PEOPLE"
    
})
print(df)

# 3. apply() : apply() lets you run a function on value.
def salary_level(salary):
    if salary >= 85000:
        return "High"
    elif salary >= 70000:
        return "Medium"
    else:
        return "Low"

df["salary_level"] = df["salary"].apply(salary_level)
print(df)

# map()   → usually map one value to another
# apply() → run custom logic/function

# Exercise 1
data = {
    "name": ["Emma", "Liam", "Olivia", "Noah", "Sophia", "Ethan"],
    "department": ["IT", "Data", "HR", "Data", "Finance", "IT"],
    "salary": [70000, 85000, 65000, 90000, 78000, 82000]
}

df = pd.DataFrame(data)
pivot_table1 = df.pivot_table(
    values = "salary",
    index = "department",
    aggfunc="mean"
)
print(pivot_table1)
pivot_table2 = df.pivot_table(
    values = "salary",
    index = "department",
    aggfunc=["mean","min","max"]
)
print(pivot_table2)

df["department_code"]=df["department"].map({
    "IT":"TECHNOLOGY",
    "Data":"DATA",
    "HR":"PEOPLE",
    "Finance" : "FIN"
}
)
print(df)

def salary_level(salary):
    if salary >= 85000:
        return "High"
    elif salary >= 70000:
        return "Medium"
    else:
        return "Low"
df["salary_level"]= df["salary"].apply(salary_level)
print(df)


# Exercise 2
data = {
    "name": ["Emma", "Liam", "Olivia", "Noah", "Sophia", "Ethan", "Mia", "Lucas"],
    "department": ["IT", "Data", "HR", "Data", "Finance", "IT", "Finance", "HR"],
    "location": ["Dallas", "Dallas", "Austin", "Austin", "Dallas", "Austin", "Austin", "Dallas"],
    "salary": [70000, 85000, 65000, 90000, 78000, 82000, 88000, 72000]
}

df = pd.DataFrame(data)
pivot_table1 = df.pivot_table(
    values = "salary",
    index=["department", "location"],
    aggfunc="mean"
)
print(pivot_table1)
pivot_table2 = df.pivot_table(
    values = "salary",
    index="department",
    aggfunc=["mean","max"]
)
print(pivot_table2)
def salary_band(salary):
    if salary >= 85000:
        return "High"
    elif salary >= 75000:
        return "Medium"
    else:
        return "Low"
df["salary_band"]= df["salary"].apply(salary_band)
df["location_code"]= df["location"].map({
        "Dallas":"DAL",
        "Austin":"AUS"
})
print(df)
print(df["salary_band"].value_counts())
"""

# Final Exercise  

data = {
    "name": ["Emma", "Liam", "Olivia", "Noah", "Sophia", "Ethan", "Mia", "Lucas"],
    "department": ["IT", "Data", "HR", "Data", "Finance", "IT", "Finance", "HR"],
    "location": ["Dallas", "Dallas", "Austin", "Austin", "Dallas", "Austin", "Austin", "Dallas"],
    "salary": [70000, 85000, 65000, 90000, 78000, 82000, 88000, 72000]
}
df = pd.DataFrame(data)

def salary_band(salary):
    if salary >= 85000:
        return "High"
    elif salary >= 75000:
        return "Medium"
    else:
        return "Low"
    
df["salary_band"] = df["salary"].apply(salary_band)

df["location_code"] = df["location"].map({
        "Dallas": "DAL",
        "Austin": "AUS"
})
avg_sal = df.groupby("department")["salary"].mean()
print("The Department with the Highest average", 
        avg_sal.idxmax(), avg_sal.max()
)
pivot_table1= df.pivot_table(
    values="salary",
    index=["department", "location"],
    aggfunc="mean"
)
print(pivot_table1)
overall_sal = df["salary"].mean()
above_avg = df[df["salary"] > overall_sal]
print(df)
above_avg= above_avg .sort_values("salary", ascending=False)
print(df[["name", "department", "location", "salary", "salary_band"]])
