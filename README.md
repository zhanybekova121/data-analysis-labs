# NumPy Lab: Sales Data Analysis

## Lab Format  
## Data Preparation for Analysis

### Objective

Use NumPy to create, inspect, filter, transform, aggregate, and reshape sales data.  
Understand how these operations are used in real data analytics.

### Format

- Individual work
- Jupyter Notebook (`.ipynb`) or Python file (`.py`)
- Explain your solution using Markdown cells, code comments, or both
- Add a short final summary at the end of the notebook

### Before Submission

Restart the kernel and run all cells to make sure your notebook works from beginning to end.

---

## Why NumPy Is Used in Data Analytics

In real data analytics, data does not always come in a perfect format. An analyst needs to:

- create or load data;
- check its structure;
- select the required rows and columns;
- find unusual values or outliers;
- calculate summary metrics;
- transform data into the required shape;
- combine data from different sources.

NumPy helps perform these tasks quickly and without complex loops.

For example, an online store may store sales data for several days. An analyst needs to answer questions such as:

- What was the total revenue for the week?
- Which day had the highest sales?
- Which days were strong and which days were weak?
- How did cumulative revenue change?
- How can data from two weeks be combined?

All these tasks can be solved using NumPy.

In this lab, you will work with sales data from an online store for two weeks.

---

## Theoretical Part

### NumPy Arrays

A NumPy array is a collection of numbers that can be worked with as a table.

A one-dimensional array is a simple list of numbers:

```text
[1200][1500][1800]
```

A two-dimensional array is a table:

```text
[[1200][1500][1800],
 [2000][1700][1600]]
```

In data analytics, a two-dimensional array often represents a table:

- rows may represent days, customers, or products;
- columns may represent metrics such as revenue, number of orders, or expenses.

### Creating an Array

```python
import numpy as np

sales = np.array([1200][1500][1800])
```

### Array Attributes

```python
sales.shape
sales.ndim
sales.size
sales.dtype
```

| Attribute | Meaning |
|---|---|
| `shape` | Shape of the array |
| `ndim` | Number of dimensions |
| `size` | Total number of elements |
| `dtype` | Data type of elements |

### Random Data

To generate random numbers, use:

```python
rng = np.random.default_rng(seed=42)
```

The `seed` parameter makes random data reproducible. If you run the code again, you will get the same numbers.

### Indexing and Slicing

Indexing allows you to access one element. Slicing allows you to access several elements.

```python
sales = np.array([1200][1500][1800][2000])

sales
sales[1:3]
```

For a two-dimensional array:

```text
matrix[row, column]
```

### Boolean Filtering

Boolean filtering helps you select only the required data.

First, create a condition:

```python
sales > 1500
```

NumPy returns a Boolean array:

```text
[False  True  True  True]
```

Then use this condition inside square brackets:

```python
sales[sales > 1500]
```

NumPy keeps only the values where the condition is `True`.

Boolean filtering is useful when you need to find:

- days with high revenue;
- products with low sales;
- customers with large orders;
- unusual values.

For several conditions, use:

- `&` — AND;
- `|` — OR;
- `~` — NOT.

Example:

```python
sales[(sales > 1000) & (sales < 1800)]
```

### Aggregation and Cumulative Sum

Aggregation helps calculate summary metrics.

```python
np.sum(sales)
np.mean(sales)
np.max(sales)
np.min(sales)
```

`np.cumsum()` calculates the cumulative sum:

```text
Day 1: 1200
Day 2: 1200 + 1500 = 2700
Day 3: 1200 + 1500 + 1800 = 4500
```

### Vectorization

Vectorization allows you to apply an operation to all elements of an array at once.

```python
sales * 1.1
```

This increases every value by 10%.

### Broadcasting

Broadcasting allows NumPy to work with arrays of different but compatible shapes.

For example, imagine that you have sales for 3 product categories:

```python
sales = np.array()[100][200][300]
```

You want to increase every category by a different percentage:

```text
Electronics: +10%
Clothing: +20%
Home: +30%
```

You can use:

```python
increase = np.array([1.10, 1.20, 1.30])

new_sales = sales * increase
```

Result:

```text
[110. 240. 390.]
```

NumPy applies:

```text
100 * 1.10 = 110
200 * 1.20 = 240
300 * 1.30 = 390
```

In data analytics, broadcasting is useful when:

- every product has a different discount;
- every day has a different inflation rate;
- every store has a different growth target;
- every category needs a different correction.

### Reshape and Stacking

`reshape()` changes the shape of an array.

```python
np.arange(1, 7).reshape(2, 3)
```

Result:

```text
[[1 2 3]
 [4 5 6]]
```

`vstack()` combines arrays vertically:

```python
np.vstack([week1, week2])
```

`hstack()` combines arrays horizontally.

---

## Formulas

Use the following formulas when needed.

### Average Sales

$$
\text{Average Sales} = \frac{\text{Total Sales}}{\text{Number of Days}}
$$

### Cumulative Sales

$$
\text{Cumulative Sales}(n) = \text{Sales}(1) + \text{Sales}(2) + \dots + \text{Sales}(n)
$$

### Price Increase

$$
\text{New Value} = \text{Old Value} \times 1.12
$$

### Percentage Share

$$
\text{Share of Category} = \frac{\text{Category Sales}}{\text{Total Sales}} \times 100
$$

### Weekly Difference

$$
\text{Weekly Difference} = \text{Week 2 Total} - \text{Week 1 Total}
$$

### Percentage Change

$$
\text{Change \%} = \frac{\text{Week 2 Total} - \text{Week 1 Total}}{\text{Week 1 Total}} \times 100
$$

---

## Initial Data

Create the following data in the first code cell.

```python
import numpy as np

rng = np.random.default_rng(seed=2026)

# Sales for Week 1: 7 days, 3 product categories
week1 = rng.integers(low=500, high=2000, size=(7, 3))

# Sales for Week 2: 7 days, 3 product categories
week2 = rng.integers(low=500, high=2000, size=(7, 3))

# Product categories
categories = np.array(["Electronics", "Clothing", "Home"])

print("Week 1 sales:")
print(week1)

print("Week 2 sales:")
print(week2)

print("Categories:")
print(categories)
```

### Data Description

- Each row represents one day.
- Each column represents one product category.
- Week 1 contains the first 7 days.
- Week 2 contains the next 7 days.
- Values represent daily revenue in tenge.

---

# Block 1 — Create and Inspect Data

### Task 1.1 — Generate Sales Data

1. Create a random number generator with `seed=2026`.
2. Generate `week1` with shape `(7, 3)`.
3. Generate `week2` with shape `(7, 3)`.
4. Display both arrays.
5. Check `shape`, `ndim`, `size`, and `dtype`.

### Task 1.2 — Understand the Data

Answer in Markdown or comments:

- What does each row represent?
- What does each column represent?
- Why is it important to fix the `seed`?

---

# Block 2 — Select and Filter Data

### Task 2.1 — Indexing and Slicing

Using `week1`:

1. Display sales for the first day.
2. Display sales for the last day.
3. Display sales for the `Electronics` category for the whole week.
4. Display sales for the `Clothing` category for the first 3 days.
5. Display sales for days 3 to 5 inclusive.

### Task 2.2 — Boolean Filtering

Using `week1`:

1. Find all revenue values greater than 1500.
2. Find all revenue values less than 800.
3. Find values from 1000 to 1500 inclusive.
4. Count the number of days when `Electronics` sales were higher than 1200.
5. Explain which conditions you used.

**Questions:**

- Why are `&` and `|` used instead of `and` and `or`?
- What business problem can Boolean filtering help solve?

---

# Block 3 — Summarize Sales

### Task 3.1 — Aggregation

Using `week1`:

1. Find the total revenue for the week.
2. Find the average daily revenue.
3. Find the maximum and minimum revenue.
4. Find the total revenue for each product category.
5. Find the average revenue for each day.

### Task 3.2 — Cumulative Sales

Use the formula:

$$
\text{Cumulative Sales}(n) = \text{Sales}(1) + \text{Sales}(2) + \dots + \text{Sales}(n)
$$

1. Find the total revenue for each day.
2. Calculate the cumulative revenue by day.
3. Display the cumulative revenue.
4. Explain what the last value shows.
5. Determine after which day the cumulative revenue exceeded half of the weekly revenue.

---

# Block 4 — Transform Sales

### Task 4.1 — Vectorized Price Increase

Use the formula:

$$
\text{New Value} = \text{Old Value} \times 1.12
$$

1. Create a copy of `week1`.
2. Increase every value by 12%.
3. Display the original and new arrays.
4. Round the new values to integers.
5. Explain why you do not need a `for` loop.

### Task 4.2 — Categorize Sales

Using `week1`:

1. Create a Boolean mask for values greater than 1500.
2. Use `np.where()` to label values:
   - `"High"` if revenue is greater than 1500;
   - `"Low"` if revenue is 1500 or less.
3. Display the original array.
4. Display the array with categories.
5. Explain how `np.where()` works.

---

# Block 5 — Reshape and Combine

### Task 5.1 — Reshape Sales Data

Using `week1`:

1. Convert it into a one-dimensional array.
2. Display the result.
3. Check the number of elements.
4. Convert the array back into shape `(7, 3)`.
5. Explain why the number of elements did not change.

### Task 5.2 — Use -1 in Reshape

Using `week1`:

1. Reshape it into shape `(7, -1)`.
2. Reshape it into shape `(-1, 3)`.
3. Display both matrices.
4. Display their shapes.
5. Explain how NumPy calculated the missing dimension.

### Task 5.3 — Understand Non-Even Reshaping

Create an array with 20 elements:

```python
demo = np.arange(1, 21)
```

Try the following reshapes:

1. Reshape `demo` into shape `(4, 5)`.
2. Reshape `demo` into shape `(5, 4)`.
3. Reshape `demo` into shape `(2, 10)`.
4. Try to reshape `demo` into shape `(3, 7)`.
5. Explain why some reshapes work and others do not.

**Important rule:**

$$
\text{Rows} \times \text{Columns} = \text{Total Number of Elements}
$$

### Task 5.4 — Combine Two Weeks

1. Combine `week1` and `week2` vertically using `vstack()`.
2. Save the result as `all_sales`.
3. Display `all_sales`.
4. Check the shape of the new array.
5. Explain why the result has 14 rows.

---

# Block 6 — Business Analysis

### Task 6.1 — Analyze Product Categories

Use the formulas:

$$
\text{Average Sales} = \frac{\text{Total Sales}}{\text{Number of Days}}
$$

$$
\text{Share of Category} = \frac{\text{Category Sales}}{\text{Total Sales}} \times 100
$$

Using `all_sales`:

1. Find the total revenue for each category over two weeks.
2. Find the average revenue for each category.
3. Calculate the percentage share of each category.
4. Identify the category with the highest total revenue.
5. Write a short conclusion for the manager.

### Task 6.2 — Find Best and Worst Days

Use the formula:

$$
\text{Daily Total Sales} = \text{Electronics} + \text{Clothing} + \text{Home}
$$

Using `all_sales`:

1. Find the total revenue for each day.
2. Find the day with the highest revenue.
3. Find the day with the lowest revenue.
4. Display these days and their revenue.
5. Explain how this information can be used in business.

### Task 6.3 — Compare Weeks

Use the formulas:

$$
\text{Weekly Difference} = \text{Week 2 Total} - \text{Week 1 Total}
$$

$$
\text{Change \%} = \frac{\text{Week 2 Total} - \text{Week 1 Total}}{\text{Week 1 Total}} \times 100
$$

1. Find the total revenue for each week.
2. Find the average revenue for each week.
3. Calculate the difference between the two weeks.
4. Calculate the percentage change.
5. Identify the more successful week.

### Task 6.4 — Final Analysis

Use the formula:

$$
\text{Days Below Average} = \text{Days where Daily Sales} < \text{Average Daily Sales}
$$

1. Identify the best-selling product category.
2. Identify the best sales day.
3. Identify the week with the higher average revenue.
4. Find the days when revenue was below the average.
5. Write a short analytical conclusion for the manager.

---

## Self-Check Questions

1. Why is NumPy useful in data analytics?
2. What do `axis=0` and `axis=1` mean?
3. How is Boolean filtering different from regular indexing?
4. Why is cumulative sum useful?
5. What is the difference between `vstack()` and `hstack()`?
6. Why is vectorization more convenient than loops?
7. How does broadcasting help in data analytics?
8. How does reshape help prepare data for analysis?

---

## Grading Criteria

| Block | Points |
|---|---:|
| Block 1 — Create and Inspect Data | 15 |
| Block 2 — Select and Filter Data | 15 |
| Block 3 — Summarize Sales | 15 |
| Block 4 — Transform Sales | 15 |
| Block 5 — Reshape and Combine | 20 |
| Block 6 — Business Analysis | 20 |
| **Total** | **100** |

You will be graded on:

- correctness of the code;
- correctness of the results;
- understanding of the operations;
- correct use of parameters;
- quality of explanations;
- independent completion of the work.

---

## Submission Recommendations

- Complete the lab in one Jupyter Notebook or Python file.
- Explain your solutions using Markdown cells, code comments, or both.
- Do not change `seed=2026`.
- Before submission, restart the kernel and run all cells.
- Make sure there are no errors.
- At the end of the notebook, add a short final summary in a Markdown cell, including a short conclusion for the manager.
