"""
Day 1 : Python Basics
    - variables and data types
    - arithmetic
    - strings
    - input()
    - type conversion
    - comparison operators
    - if / elif / else
"""
"""

# 1. Vartiables + types

name = "Aashish Shah"
age = 24
gpa = 3.7
is_student = True

print(name)
print(age)
print(gpa)
print(is_student)

#2. Arithematic
a = 10
b = 3

print(a + b)
print(a - b)
print(a * b)
print(a / b)
print(a // b)
print(a % b)
print(a ** b)

#3. Strings and f-strings
name = 'Aashish Shah'
major = 'Data'
print(name, "is studying", major)

    # use of f-strings
print(f'{name} is studying {major}')


# 4. Input
name = input("Enter your name: ")
print(f"Hello! {name}, my love")

age = int(input("Enter your age: "))
print(age)


# 5. Comparisons
age = 24

print(age > 18)
print(age >= 21)
print(age == 24)
print(age != 30)

# 6. Conditional statements ( if / elif / else )

age = 24
if age >= 21: 
    print("21 or older")
else:
    print("Under 21 ")

# Exerise - 1
name = 'Aashish Shah'
major = 'Computer Science'
graduation_year = 2027
sql_completed = True
leetcode_sql_completed = 50
python_score = 75

print(f"{name} is studying {major}.")
print(graduation_year)
print(sql_completed)
print(leetcode_sql_completed)

if python_score >= 90:
    print("Excellent")
elif python_score >= 80:
    print("Very Good")
elif python_score >= 70:
    print("Good")
else:
    print("Needs Practice")




# Part 2: Lists + Loops


skills = [ "SQL","Python","Excel","Power BI"]
skills.append("Pandas")
print(skills)

print(len(skills))

for skill in skills:
    print(skill)


scores = [75,85,89,80,99,95,51]

for score in scores:
    if score >= 80:
        print(f"{score} passed the requirement")
    else:
        print(f"{score} doesn't passed the requiement")


## Function 
def greet(name):
    print(f"Hello, {name}")
greet("Aashish")


def calculate_total(price, quantity):
    total = price * quantity
    return total

result = calculate_total(45, 90)
print(result)

## Exercise-2
skills = ["SQL","Python","Excel","PostgreSQL"]
skills.append("Pandas")
print(len(skills))
for skill in skills:
    print(f"Learning {skill}")

def calculate_salary(monthly_salary):
    return monthly_salary*12

result = calculate_salary(5000)
print(result)


## Part 3: Dictionaries

student = {
    "name":"Aashish",
    "major":"Computer Science",
    "graduation_year":"2027"
}
print(student["name"])
print(student["major"])

student["sql_completed"] = True
print(student["sql_completed"])

student["graduation_year"] = 2028

for key, value in student.items():
    print(key, value)


# While Loops
count = 1

while count <= 6:
    print(count)
    count += 1

# Basic Error Handling
try:
    age = int(input("Enter your age: "))
    print(f"Your age is {age}")
except ValueError:
    print("Please enter valid number.")

# Day 1 final exercise: 

s1 = {
    "name":"Aashish Shah",
    "major":"Computer Science",
    "skills_completed":50,
    "python_day":1
}
print(s1["name"])
print(s1["major"])
print(s1["python_day"])
print(s1["skills_completed"])

s1["current_skill"] = "python"

for key, value in s1.items():
    print(key,value)

day = 1
while day <= 3:
    print(f"Python practice day {day}")
    day += 1

try:
    num = int(input("Enter a number "))
    print(num**2)
except ValueError:
    print("Please enter a valid number")

    """