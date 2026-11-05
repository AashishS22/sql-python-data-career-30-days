# Day 4 : NumPy Basics


import numpy as np

print(np.__version__)   

# Part 1: ndarrays
# 1. NumPy arrays
numbers = [10, 20, 30, 40]
numbers = np.array([10, 20, 30, 40])
print(numbers)
print(type(numbers))
print(numbers.dtype)
print(numbers.shape)
print(numbers.size)

# Random num generation 
ar1 = np.random.rand(2, 3)
ar2 = np.random.randn(2,3)
ar3 = np.random.randint(1,10, size = (2,3))
print(ar1)
print(ar2)
print(ar3)

#2. Use: Vectorized computation
numbers = [ 20, 30, 40, 50]
numbers = np.array([20, 30, 40 , 50])

print(numbers * 2)
print(numbers - 5)
print(numbers + 10)
print(numbers / 2)
print(numbers ** 2)


#3.  Useful calculations 
scores = np.array([80, 90, 95, 88, 75, 100])
print(np.sum(scores))
print(np.mean(scores))
print(np.min(scores))
print(np.max(scores))
print(np.median(scores))
print(np.std(scores))



# 4: Filtering 
scores = np.array([82, 91, 75, 88, 96, 69])
print(scores[scores >= 80])
print(scores[(scores > 10)& (scores< 85)])

# Exercise 
sales = np.array([1200, 850, 1600, 950, 2100, 1750])

print(sales)
print(sales.dtype)
print(sales.shape)
print(sales.size)

print("Total sales:", np.sum(sales))
print("Average sales:",np.mean(sales))
print("Minimum sales:",np.min(sales))
print("Maximum sales:",np.max(sales))

print("Sales over 1000:",sales[sales > 1000])

increased_sales = sales * 1.10
print("Increased sales : ",increased_sales)

# Part 2: 2D Arrays
sales = np.array([
    [1200, 850, 1600],
    [950, 2100, 1750]
])

print(sales[0, 1]) # Think: array[row, column]
print(sales[1,1])
print(sales[0])
print(sales[:, 0]) # all rows, column 0

# Exercise

sales = np.array([
    [1200, 850, 1600],
    [950, 2100, 1750],
    [1300, 1450, 1100]
])

print(sales)
print("Shape:",sales.shape)
print(sales[1,1])
print("The entire first row:",sales[0])
print(sales[:, 1])
print("Total:", np.sum(sales))
print("Average:", np.mean(sales))
print(sales[sales > 1500])

# Row-wise vs Column-wise calculations
sales = np.array([
    [1200, 850, 1600],
    [950, 2100, 1750],
    [1300, 1450, 1100]
])
print(np.sum(sales, axis=0)) # axis=0 -> Calculate down the rows -> result per colum
print(np.sum(sales, axis=1)) # axis=1 -> Calculate across columns -> result per row

print(np.mean(sales, axis=1)) # average per row
print(np.mean(sales, axis=0)) # average per column
print(np.max(sales, axis=1)) # maximum per row
print(np.max(sales, axis=0)) # maximum per column