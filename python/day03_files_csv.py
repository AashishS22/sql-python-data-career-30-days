"""
Day 3 — Files, CSV, and Real Data
    - Python can be used to perform operations on a file : read data, write data, store data permanently from files
    - (read.write.append.real_work usage)

"""

with open("python/skills.txt", "w") as file:
    file.write("hello from python")

with open("python/skills.txt", "w") as file:
    file.writelines(["SQL\n","Python\n","Pandas\n"])

with open("python/skills.txt", "r") as file:
    content = file.read()
print(content)
    

# CSV Files : (CSV means: Comma-Separated Values)
    # CSV is much more important for data analysis.

# Writing CSV
import csv

with open("python/students.csv", "w", newline="") as file:
    writer = csv.writer(file)

    writer.writerow(["name", "age", "major"])
    writer.writerow(["Aashish", 24, "Computer Science"])
    writer.writerow(["Emma", 22, "Data Science"])

# Reading CSV
import csv

with open("python/students.csv", "r") as file:
    reader = csv.reader(file)

    for row in reader:
        print(row)

# Exercise
import csv

with open("python/employees.csv","w", newline="") as file:
    writer = csv.writer(file)

    writer.writerow(["name","salary","department"])
    writer.writerow(["Emma",70000,"IT"])
    writer.writerow(["Liam",85000,"Data"])
    writer.writerow(["Olivia",65000,"HR"])
    writer.writerow(["Noah",90000,"Data"])

with open("python/employees.csv","r") as file:
    result = csv.reader(file)

    for row in result:
        print(",".join(row))


# csv.DictReader
import csv
with open("python/employees.csv","r")as file:
    reader = csv.DictReader(file)

    for employee in reader:
        print(employee["name"], employee["salary"])



import csv
total_salary = 0
with open("python/employees.csv","r")as file:
    reader = csv.DictReader(file)

    for employee in reader:
        total_salary += int(employee["salary"])

        if employee["department"] == "Data":
            print(f'{employee["name"]} earns ${employee["salary"]}')
         
print("Total salary:",total_salary)


#csv.DictWriter()

import csv
fieldnames = ["name","salary","department"]
employees = [
    {"name": "Emma", "salary": 70000, "department": "IT"},
    {"name": "Liam", "salary": 85000, "department": "Data"},
    {"name": "Olivia", "salary": 65000, "department": "HR"}
]
with open("python/employees.csv","w", newline="") as file:
    writer = csv.DictWriter(file, fieldnames=fieldnames)

    writer.writeheader()
    writer.writerows(employees)

# Exercise
with open("python/employees.csv","a", newline ="") as file:
    writer = csv.writer(file)

    writer.writerow(["Sophia", 78000, "Finance"])

import csv
total_num = 0
total_sal = 0 
avg_sal = 0
highest_sal = 0 
with open ("python/employees.csv", "r") as file:
    reader = csv.DictReader(file)

    for row in reader:
        total_num += 1
        total_sal += int(row["salary"])
        salary= int(row["salary"])

        if salary > highest_sal:
            highest_sal = salary

        if int(row["salary"]) >= 80000:
            print(f'{row["name"]} earns ${row["salary"]}')

    avg_sal = total_sal/total_num

print("Employees:",total_num)
print("Total Salary:", total_sal)
print("Average Salary:", avg_sal)
print("Highest Salary:", highest_sal)



