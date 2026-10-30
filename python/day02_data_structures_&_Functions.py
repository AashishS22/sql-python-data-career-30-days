"""
Day 2:
Focusing on the data structures we’ll use constantly before Pandas:
- list indexing and slicing
- list methods
- tuples
- sets
- dictionaries a bit deeper
- functions with multiple parameters
- short practice

"""
## 1. List indexing and slicing
skills = ["SQL", "Python", "Excel", "Pandas", "Power BI"]

# indexing
# mental model [starts: stops]
print(skills[0])
print(skills[1])
print(skills[-1])
print(skills[:3])
print(skills[::-1])
print(skills[3:])

## 2. Useful list methods
numbers = [30, 40, 50, 60, 70, 45]

numbers.append(69)
numbers.remove(30)
numbers.sort()
print(numbers)

numbers.sort(reverse=True)
numbers.reverse()
numbers.pop()

numbers = [30, 40, 50, 60, 70, 45]
numbers.insert(4,99)
print(numbers.count(30))
print(numbers.index(50))
print(min(numbers))
print(len(numbers))


## Tuples
    #List  → mutable
    #Tuple → immutable
    #Tuples are useful for values that should stay fixed.
student = ("Aashish", "Computer Science", 2027)
print(student[2])

## Sets
    # stores unique values. Each element in set must be unique and immutable.

skills = {"SQL", "Python", "SQL", "Excel"}
skills.add("Pandas")
skills.remove("SQL")
print(skills)


## 5. Functions with multiple parameters and multiple return values
def calculate_profit(revenue, cost):
    profit = revenue - cost
    margin = profit/revenue * 100
    return profit, margin

profit, margin = calculate_profit(10000,5000)
print(profit)
print(margin)

# Day 2 Exercise 1
scores = [82, 91, 75, 88, 96, 69]
print(scores[0])
print(scores[-1])
print(scores[:3])
print(scores[-2:])
print(max(scores))
print(min(scores))
print(sum(scores))
print(len(scores))

sorted_scores = sorted(scores)
print(sorted_scores)

skills = ["SQL", "Python", "SQL", "Excel", "Python", "Pandas"]
skills_set = set(skills)

##Day 2 — Exercise 2: tuples + functions.

def analyze_scores(scores):
    highest = max(scores)
    lowest = min(scores)
    average = sum(scores)/len(scores)
    return highest, lowest, average

scores = [82, 91, 75, 88, 96, 69]
highest, lowest, average = analyze_scores(scores)
print(highest)
print(lowest)
print(average)

student = ("Aashish Shah", "Computer Science", 2027)
print(student[0])
print(student[1])
print(student[2])

### Day 2 — Part 3: Dictionaries + Lists Together
employees = [
    {"name": "Emma", "salary": 70000},
    {"name": "Liam", "salary": 85000},
    {"name": "Olivia", "salary": 65000},
    {"name": "Noah", "salary": 90000}
]

for employee in employees:
    if employee["salary"] >= 80000:
        print(f'{employee["name"]} earns ${employee["salary"]}')

total_salary = sum(employee["salary"] for employee in employees)
average_salary = total_salary/len(employees)

print("Total Salary:", total_salary)
print("Average Salary:", average_salary)


## Day 2 — Final Exercise
sales = [1200, 850, 1600, 950, 2100, 1750]

for sale in sales:
    print(sale)

print("Sales greater than 1000:")
for sale in sales:
    if sale > 1000:
        print(sale)

total_sale = sum(sales)
average_sales = total_sale / len(sales)

print("Total sale is:", total_sale)
print("Average sale is :",round(average_sales,2))

high_sales = [ sale for sale in sales if sale > 1000] # for each sale in sales → keep it only if sale > 1000
print(high_sales)