import numpy as np

# Element-wise Multiplication with Broadcasting
def elementwise_multiplication(a, b):
    return a * b

a = np.random.rand(2, 3, 4)
b = np.random.rand(3, 4)
result_multiplication = elementwise_multiplication(a, b)
print("Element-wise multiplication result:\n", result_multiplication)

# Element-wise Operations with Broadcasting
def broadcast_operations(c, d):
    try:
        addition = c + d
        subtraction = c - d
        multiplication = c * d
        division = c / d
        return addition, subtraction, multiplication, division
    except ValueError as e:
        return str(e)

c = np.random.rand(3, 4)
d = np.random.rand(3, 1)
results_operations = broadcast_operations(c, d)
print("Broadcast operations results:\n", results_operations)

# Outer Product Using Broadcasting
def outer_product(e, f):
    return e[:, np.newaxis, :] * f[:, np.newaxis]

e = np.random.rand(5, 3)
f = np.random.rand(5)
outer_result = outer_product(e, f)
print("Outer product result:\n", outer_result)

# Extract Elements with Slicing
def extract_elements(g):
    return g[::2, ::2, :]

g = np.random.rand(4, 3, 2)
extracted_elements = extract_elements(g)
print("Extracted elements:\n", extracted_elements)

# Sum Along Diagonal
def sum_diagonal_elements(h, i, j):
    return np.array([h[i[m], j[n]] for m in range(len(i)) for n in range(len(j))]).reshape(len(i), len(j))

h = np.random.rand(4, 4)
i = np.array([0, 1, 2])
j = np.array([1, 2, 3])
k = sum_diagonal_elements(h, i, j)
print("Sum along diagonal:\n", k)

# Product of Row and Column Means
def row_column_means_product(l):
    row_means = l.mean(axis=1, keepdims=True)
    col_means = l.mean(axis=0, keepdims=True)
    return row_means * col_means

l = np.random.rand(4, 5)
m = row_column_means_product(l)
print("Product of row and column means:\n", m)

# Reshape and Flatten
def reshape_and_flatten(n):
    reshaped = n.reshape(2, 2, 6)
    flattened = reshaped.reshape(4, 6)
    return flattened

n = np.random.rand(4, 6)
reshaped_flattened = reshape_and_flatten(n)
print("Reshaped and flattened array:\n", reshaped_flattened)

# Roll Along Axis
def roll_array(o, positions):
    return np.roll(o, positions, axis=0)

o = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
rolled = roll_array(o, 1)
print("Rolled array:\n", rolled)

# Replace with Mean of Neighbors
def replace_with_mean(p, x):
    p = p.copy()
    rows, cols = p.shape
    for i in range(rows):
        for j in range(cols):
            if p[i, j] == x:
                neighbors = []
                if i > 0: neighbors.append(p[i-1, j])
                if i < rows - 1: neighbors.append(p[i+1, j])
                if j > 0: neighbors.append(p[i, j-1])
                if j < cols - 1: neighbors.append(p[i, j+1])
                if neighbors:
                    p[i, j] = np.mean(neighbors)
    return p

p = np.array([[1, 2, 3], [4, 0, 6], [7, 8, 0]])
x = 0
replaced = replace_with_mean(p, x)
print("Array with replaced values:\n", replaced)
