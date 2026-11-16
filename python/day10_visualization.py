"""
Day 10: Pandas Visualization + Communicating Insights

"""

import pandas as pd
import matplotlib.pyplot as plt 

data = {
    "name": ["Emma", "Liam", "Olivia", "Noah", "Sophia", "Ethan", "Mia", "Lucas"],
    "department": ["IT", "Data", "HR", "Data", "Finance", "IT", "Finance", "HR"],
    "salary": [70000, 85000, 65000, 90000, 78000, 120000, 88000, 72000],
    "experience": [2, 5, 3, 7, 4, 10, 6, 5]
}
df = pd.DataFrame(data)   

# 1. Bar Chart
    # Suppose we want to compare average salary by departmment
"""
Mental model:
group data
   ↓
calculate metric
   ↓
plot result
"""
avg_salary = df.groupby("department")["salary"].mean()
print(avg_salary)

# Plot it
avg_salary.plot(kind="bar")

plt.title("Average salary by Department")
plt.xlabel("Department")
plt.ylabel("Average Salary")
plt.show()

# 2. Histogram : understand numeric distribution
    # A Histogram helps you understand the distribution of a numeric variable, & how frequently values fall within different ranges.

df["salary"].plot(kind="hist", bins=5)

plt.title("Salary Distribution")
plt.xlabel("Salary")
plt.show()

# 3. Scatter plot
    # We can visually inspect and understand relationship betweem two numerical variables.
    # It helps us see whether two vairables are related and how they change together

df.plot(
    kind = "scatter",
    x = "experience",
    y = "salary"
)
plt.title("Experience vs salary")
plt.xlabel("Years of experience")
plt.ylabel("Salary")
plt.show()

# Exercise 1
"""
Using the same DataFrame, create these three charts yourself:
1. Bar chart
   - average salary by department
   - title: Average Salary by Department
2. Histogram
   - salary distribution
   - use bins=5
   - title: Salary Distribution
3. Scatter plot
   - x = experience
   - y = salary
   - title: Experience vs Salary
For every chart, also add meaningful: x, y label
"""

avg_sal = df.groupby("department")["salary"].mean()

avg_sal.plot(kind="bar")

plt.title("Average Salary by Department")
plt.xlabel("Department")
plt.ylabel("Average Salary")
plt.show()


df["salary"].plot(kind="hist", bins=5)

plt.title("Salary Distribution")
plt.xlabel("Salary")
plt.ylabel("Frequency")
plt.show()

df.plot(
    kind="scatter",
    x="experience",
    y="salary"
)
plt.title("Experience vs Salary")
plt.xlabel("Years of Experience")
plt.ylabel("Salary")
plt.show()


## PART 2 : Choosing the Right Chart + Making It Business-Ready.    
    # What question am I trying to answer?.

# 1. Sort your Bar Chart
avg_sal = ( df.groupby("department")["salary"]
    .mean()
    .sort_values(ascending=False)
)
avg_sal.plot(kind="bar")

plt.title("Average Salary by Department")
plt.xlabel("Department")
plt.ylabel("Average Salary")
plt.tight_layout()
plt.show()

# 2. Horizontal bar chart
    # For category names, horizontal bars can often be easier to read:
avg_sal.plot(kind="barh")

plt.title("Average Salary by Department")
plt.xlabel("Department")
plt.ylabel("Average Salary")
plt.tight_layout()
plt.show()

# 3. Box plot
    # Gives a visual way to inspect spread and possible Outliers.
df["salary"].plot(kind="box")

plt.title("Salary Distribution and possible outliers")
plt.xlabel("Salary")
plt.ylabel("Frequency")
plt.tight_layout()
plt.show()


## Exercise 2
"""
Calculate average salary by department.
Sort it from highest to lowest.
Create a horizontal bar chart showing those averages.
Give it:- title: Average Salary by Department
- x-axis: Average Salary
- y-axis: Department

Add plt.tight_layout().
Create a box plot of salary.
Title it:
Salary Distribution and Possible Outliers
Look at the box plot and tell me which employee's salary you expect to appear as the outlier.
"""
avg_sal = df.groupby("department")["salary"].mean().sort_values(ascending=False)

avg_sal.plot(kind="barh")

plt.title("Average Salary by Department")
plt.xlabel("Average Salary")
plt.ylabel("Department")
plt.tight_layout()
plt.show()


df["salary"].plot(kind="box")

plt.title("Salary Distribution and Possible Outliers")
plt.ylabel("Salary")
plt.tight_layout()
plt.show()

# Day 10 Final Challenge
"""
Using your employee dataset plus the small monthly revenue dataset above, create these 5 charts:
1. Bar chart
   - average salary by department
   - sort highest to lowest
2. Histogram
   - salary distribution
   - bins=5
3. Scatter plot
   - x = experience
   - y = salary
4. Box plot
   - salary distribution / outliers
5. Line chart
   - monthly revenue trend
   - x = month
   - y = revenue
   - use marker="o"
"""

avg_sal = df.groupby("department")["salary"].mean().sort_values(ascending=False)

avg_sal.plot(kind="bar")

plt.title("Average Salary by Department")
plt.xlabel("Department")
plt.ylabel("Average Salary")
plt.tight_layout()
plt.show()


df["salary"].plot(kind="hist", bins=5)

plt.title("Salary Distribution")
plt.xlabel("Salary")
plt.ylabel("Frequency")
plt.tight_layout()
plt.show()



df.plot(
    kind="scatter",
    x="experience",
    y="salary"
)
plt.title("Experience vs Salary")
plt.xlabel("Experience")
plt.ylabel("Salary")
plt.tight_layout()
plt.show()



df["salary"].plot(kind="box")

plt.title("Salary Distribution and possible outliers")
plt.ylabel("Salary")
plt.tight_layout()
plt.show()

# line chart
months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
revenue = [50000, 54000, 52000, 61000, 67000, 72000]

trend_df = pd.DataFrame({
    "month": months,
    "revenue": revenue
})

trend_df.plot(
    kind="line",
    x="month",
    y="revenue",
    marker="o"
)
plt.title("Monthly revenue trend")
plt.xlabel("Month")
plt.ylabel("Revenue")
plt.tight_layout()
plt.show()


# IT department has the highest average salary.
# Yes experience and salary are positively strongly related.
# Yes there is an oulier ; which is 120000. 