# Diwali Interrogation: A Mini SQL Project

A light hearted SQL storytelling project inspired by the career related
questions relatives ask during Diwali.

I turned five questions into a small PostgreSQL database and explored
how often they came up, which topics appeared most, and how much
pressure each question carried. The project also compares two responses:
what I wanted to say versus what I actually said.

## Tools and concepts

-   **Database:** PostgreSQL
-   **SQL concepts:** `CREATE TABLE`, `INSERT`, `SELECT`, `WHERE`,
    `COUNT()`, `SUM()`, `AVG()`, `GROUP BY`, and `ORDER BY`

## Database structure

The table is named `relatives_questions`.

  Column                   Description
  ------------------------ ----------------------------------------
  `question_id`            Unique ID generated automatically
  `question`               The question asked
  `asked_by`               Relative who asked it
  `category`               Topic of the question
  `frequency`              Number of times the question was asked
  `pressure_level`         Self-assigned pressure score
  `what_i_wanted_to_say`   The unfiltered response
  `what_i_said_irl`        The diplomatic response

The pressure score uses a 1-5 scale. Frequency and pressure values are
personal estimates for this mini project, not survey data.

## Investigation findings

Based on the five records:

-   **5 distinct questions** were recorded.
-   **13 total occurrences** were recorded by adding the frequency
    values.
-   **Career** was the most represented category by number of distinct
    questions (2).
-   The average pressure level was **3.2/5**.
-   **"Have you decided what you want to become?"** had the highest
    frequency (4) and the highest pressure score (5/5).
-   Aunt and Uncle each accounted for **6 occurrences**.

## Example queries

### Count the distinct questions recorded

``` sql
SELECT COUNT(*) AS total_questions
FROM relatives_questions;
```

### Find career-related questions

``` sql
SELECT question, asked_by
FROM relatives_questions
WHERE category = 'Career';
```

### Calculate the average pressure level

``` sql
SELECT AVG(pressure_level) AS average_pressure
FROM relatives_questions;
```

### Count questions in each category

``` sql
SELECT category, COUNT(*) AS total_questions
FROM relatives_questions
GROUP BY category;
```

### Find the highest-pressure questions

``` sql
SELECT question, pressure_level
FROM relatives_questions
ORDER BY pressure_level DESC;
```

### Compare the inner voice with the diplomatic response

``` sql
SELECT
    question,
    what_i_wanted_to_say AS inner_voice,
    what_i_said_irl AS diplomatic_response
FROM relatives_questions;
```

### Calculate average pressure by category

``` sql
SELECT
    category,
    AVG(pressure_level) AS average_pressure
FROM relatives_questions
GROUP BY category;
```

### Find the most frequently asked question

``` sql
SELECT question, frequency
FROM relatives_questions
ORDER BY frequency DESC
LIMIT 1;
```

### Calculate how often each relative asked questions

``` sql
SELECT
    asked_by,
    SUM(frequency) AS total_occurrences
FROM relatives_questions
GROUP BY asked_by;
```

## How to run

1.  Open PostgreSQL using pgAdmin, DBeaver, or `psql`.
2.  Create or select a database for the project.
3.  Run the SQL script containing the `CREATE TABLE` and `INSERT`
    statements.
4.  Run the analysis queries individually.

Create and populate the table before running the analysis queries.

## What I learned

This mini project gave me practice creating a table, inserting multiple
records, filtering data, grouping results, and using aggregate
functions. It also showed me how an everyday, relatable situation can
become a small data storytelling exercise.

## Case status

**Case temporarily closed.** Further evidence may be collected next
Diwali. 🕵️

------------------------------------------------------------------------

*Personal learning project. Frequency and pressure scores are subjective
estimates used in the example dataset.*
