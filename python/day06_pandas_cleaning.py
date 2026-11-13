"""
Day 6 : Pandas Data Cleaning
Here we will focus on the kind of messy data, we will actually see in real datasets:
- duplicates
- bad/extra spaces
- inconsistent text
- renaming columns
- changing data types
- dates
"""

# 1. Duplicates
import pandas as pd


data = {
    "name": ["Emma", "Liam", "Emma", "Noah"],
    "salary": [70000, 85000, 70000, 90000]
}

df = pd.DataFrame(data)
print(df.duplicated().sum())
df = df.drop_duplicates()
print(df)

# 2. Renaming columns

data = {
    "Employee Name": ["Emma", "Liam"],
    "Annual Salary": [70000, 85000]
}
df = pd.DataFrame(data)
df = df.rename(columns = {
    "Employee Name": "name",
    "Annual Salary" :"salary"
})
print(df)

# 3. Cleaning strings

df = pd.DataFrame({
    "name": [" Emma ", "LIAM", "olivia "]
})
df["name"] = df["name"].str.strip() # remove extra spaces
df["name"] = df["name"].str.lower() # convert to lowercase
df["name"] = df["name"].str.title() # convert to title case
df["name"] = df["name"].str.strip().str.title() # common cleaning pattern

# 4. Changing data types
df = pd.DataFrame({
    "salary": ["70000", "85000", "90000"]
})
df["salary"]= df["salary"].astype(int)
print(df.dtypes)

# 5. Dates

df = pd.DataFrame({
    "hire_date": ["2024-01-15", "2025-06-20", "2023-11-01"]
})
df["hire_date"] = pd.to_datetime(df["hire_date"])
df["hire_year"] = df["hire_date"].dt.year
df["hire_month"] = df["hire_date"].dt.month


# Day 6 Exercise 1 ------
data = {
    "Employee Name": [" Emma ", "LIAM", "olivia ", " Emma "],
    "Salary": ["70000", "85000", "65000", "70000"],
    "Department": [" IT ", "DATA", "hr", " IT "]
}
df = pd.DataFrame(data)
df = df.rename(columns = {
    "Employee Name":"name",
    "Salary" :"salary",
    "Department":"department"
})
df["name"] = df["name"].str.strip().str.title()
df["department"] = df["department"].str.strip().str.title()
df["salary"] = df["salary"].astype(int)
print(df.duplicated().sum())
df = df.drop_duplicates()
print(df)
print(df.dtypes)


# Day 6 — Exercise 2: Dates + messy numeric data ------
data = {
    "name": ["Emma", "Liam", "Olivia", "Noah"],
    "salary": ["$70,000", "$85,000", "$65,000", "$90,000"],
    "hire_date": ["2024-01-15", "2023-06-20", "2025-03-10", "2022-11-01"]
}
df = pd.DataFrame(data)
df["salary"]= (df["salary"]
               .str.replace("$", "", regex=False)
               .str.replace(",", "", regex=False)
)
df["salary"] = df["salary"].astype(int)
df["hire_date"] = pd.to_datetime(df["hire_date"])
df["hire_year"] = df["hire_date"].dt.year
df["hire_month"] = df["hire_date"].dt.month
print(df)
print(df.dtypes)


# Day 6 — Exercise 3: Messier real-world data
data = {
    "name": [" Emma ", "LIAM", "Olivia", "Noah", "Sophia", "Emma"],
    "age": ["24", "29", "unknown", "31", "27", "24"],
    "department": ["IT", "data", "HR", "DATA", "finance", "IT"],
    "salary": ["70000", "85000", "65000", "90000", "78000", "70000"]
}

df = pd.DataFrame(data)
df["name"]=df["name"].str.strip().str.title()
df["department"] = df["department"].str.strip().str.title()
df["salary"]= df["salary"].astype(int)
df["age"]= pd.to_numeric(df["age"], errors="coerce")
print(df.isna().sum())
df["age"] = df["age"].fillna(df["age"].mean())
print(df.duplicated().sum())
df = df.drop_duplicates()
print(df)
print(df.dtypes)


# Final Exercise:
data = {
    "Name": [" Emma ", "LIAM", "Olivia", "Noah", "Sophia", "Emma"],
    "Age": ["24", "29", "unknown", "31", "27", "24"],
    "Salary": ["$70,000", "$85,000", "$65,000", "$90,000", "$78,000", "$70,000"],
    "Department": ["IT", "data", "HR", "DATA", "finance", "IT"],
    "Hire Date": ["2024-01-15", "2023-06-20", "2025-03-10", "2022-11-01", "2024-08-12", "2024-01-15"]
}
df = pd.DataFrame(data)
df = df.rename(columns= {
    "Name" : "name",
    "Age" :"age",
    "Salary":"salary",
    "Department":"department",
    "Hire Date" : "hire_date"
})
df["name"]= df["name"].str.strip().str.title()
df["department"]= df["department"].str.strip().str.title()
df["salary"]= (df["salary"]
               .str.replace("$", "", regex=False)
               .str.replace(",", "", regex=False)
)
df["salary"] = pd.to_numeric(df["salary"], errors="coerce")

df["age"] = pd.to_numeric(df["age"], errors="coerce")
df["age"]= df["age"].fillna(df["age"].mean())

df["hire_date"] = pd.to_datetime(df["hire_date"])
df["hire_year"] = df["hire_date"].dt.year
df = df.drop_duplicates()
print(df)
print(df.isna().sum())
print(df.dtypes)
print(f'Average salary:{df["salary"].mean()}')
print("\nEmployee earning more than 80000\n")
print(df[df['salary']>= 80000])