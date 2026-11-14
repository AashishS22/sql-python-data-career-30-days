"""
Day 7: Pandas Merge & Joins
   - pd.merge()
   - inner joins
   - left joins
   - joining on differently named columns
   - pd.concat()
   - combining datasets vertically
"""
# 1. Basic Merge
import pandas as pd


employees = pd.DataFrame({
    "employee_id": [1, 2, 3, 4],
    "name": ["Emma", "Liam", "Olivia", "Noah"],
    "department_id": [10, 20, 30, 20]
})
department = pd.DataFrame({
    "department_id": [10, 20, 30],
    "department": ["IT", "Data", "HR"]
})

#2. inner.join
result = pd.merge(
    employees,
    department,
    on ="department_id",
    how = "inner"
)
print(result)

#3. Different column names

employees = pd.DataFrame({
    "employee_id": [1, 2, 3],
    "dept_id": [10, 20, 30]
})

department = pd.DataFrame({
    "department_id": [10, 20, 30],
    "department": ["IT", "Data", "HR"]
})

result = pd.merge(
    employees,
    department,
    left_on = "dept_id",      # left_on  → column from left DataFrame
    right_on = "department_id"   # right_on → column from right DataFrame
)
print(result)


# 4. Concatenation
employees_1 = pd.DataFrame({
    "name": ["Emma", "Liam"],
    "salary": [70000, 85000]
})

employees_2 = pd.DataFrame({
    "name": ["Olivia", "Noah"],
    "salary": [65000, 90000]
})

all_employees = pd.concat(
    [employees_1,employees_2],
    ignore_index=True
)
print(all_employees)

# Exercise 1
employees = pd.DataFrame({
    "employee_id": [1, 2, 3, 4, 5],
    "name": ["Emma", "Liam", "Olivia", "Noah", "Sophia"],
    "department_id": [10, 20, 30, 20, 40]
})

departments = pd.DataFrame({
    "department_id": [10, 20, 30],
    "department": ["IT", "Data", "HR"]
})

result1 = pd.merge(
    employees,
    departments,
    on = "department_id",
    how="inner"
)
print("inner join rows:",len(result1))
result2 = pd.merge(
    employees,
    departments,
    on = "department_id",
    how="left"
)

print("Left join rows:",len(result2))

print(result1[["name", "department"]])
print(result2[["name", "department"]])


# Excercise 2

employees = pd.DataFrame({
    "employee_id": [1, 2, 3, 4],
    "name": ["Emma", "Liam", "Olivia", "Noah"],
    "dept_id": [10, 20, 30, 40]
})
departments = pd.DataFrame({
    "department_id": [10, 20, 30, 50],
    "department": ["IT", "Data", "HR", "Finance"]
})
result1 = pd.merge(
    employees,
    departments,
    left_on="dept_id",
    right_on = "department_id",
    how = "inner"
)
print(result1)
result2 = pd.merge(
    employees,
    departments,
    left_on="dept_id",
    right_on = "department_id",
    how = "outer"
)
print(result2)
print(result1[["name", "department"]])
print(result2[["name", "department"]])


employees_1 = pd.DataFrame({
    "name": ["Emma", "Liam"],
    "salary": [70000, 85000]
})

employees_2 = pd.DataFrame({
    "name": ["Olivia", "Noah"],
    "salary": [65000, 90000]
})

all_employee = pd.concat(
    [employees_1, employees_2],
    ignore_index=True
)
print(all_employee)

# Excercise 3
employees = pd.DataFrame({
    "employee_id": [1, 2, 3, 4, 5],
    "name": ["Emma", "Liam", "Olivia", "Noah", "Sophia"],
    "department_id": [10, 20, 30, 20, 10],
    "salary": [70000, 85000, 65000, 90000, 78000]
})

departments = pd.DataFrame({
    "department_id": [10, 20, 30],
    "department": ["IT", "Data", "HR"]
})

result = pd.merge(
    employees,
    departments,
    on = "department_id",
    how="inner"
)
print(result)
average_sal = result.groupby("department")["salary"].mean()
print('Average Salary by:', average_sal)
print(f'Total Salary by:{result.groupby("department")["salary"].sum()}')

print("The department with highest Average salary is:",
      average_sal.idxmax(), # .idxmax() → Which row/index has the highest value?
      average_sal.max())    # .max()    → What is the highest value?

result = result.sort_values("salary", ascending=False)
print(result[["name","department", "salary"]])

# Exercise 4:
employees_a = pd.DataFrame({
    "employee_id": [1, 2, 3],
    "name": ["Emma", "Liam", "Olivia"],
    "department_id": [10, 20, 30],
    "salary": [70000, 85000, 65000]
})

employees_b = pd.DataFrame({
    "employee_id": [4, 5],
    "name": ["Noah", "Sophia"],
    "department_id": [20, 10],
    "salary": [90000, 78000]
})

departments = pd.DataFrame({
    "department_id": [10, 20, 30],
    "department": ["IT", "Data", "HR"]
})

all_employee = pd.concat(
    [employees_a, employees_b],
    ignore_index=True
)
result = pd.merge(
    all_employee,
    departments,
    on="department_id",
    how="left"
)
print(result)
print(result[result["salary"] >= 80000])
avg_sal = result.groupby("department")["salary"].mean()
print("The average salary is:", avg_sal)
print("The department with highest average salary is:",
      avg_sal.idxmax(),avg_sal.max())
print("Total salary by department:",
      result.groupby("department")["salary"].sum())
result = result.sort_values("salary", ascending=False)
print(result[["name", "department", "salary"]])