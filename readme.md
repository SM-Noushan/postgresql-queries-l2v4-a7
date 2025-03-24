### 1\. What is PostgreSQL?

**PostgreSQL** একটি open-source **Relational Database Management System (RDBMS)**, যা SQL ভাষা ব্যবহার করে structured data সংরক্ষণ ও ব্যবস্থাপনার জন্য ব্যবহৃত হয়।

### 2\. What is the purpose of a database schema in PostgreSQL?

**DATABASE schema** হলো DATABASE-এর logical কাঠামো যা TABLE, COLUMN, DATA TYPE এবং RELATIONSHIP সংজ্ঞায়িত করে। এটি DATA-র সংগঠন এবং ব্যবস্থাপনার নিয়ম নির্ধারণ করে।

### 3\. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

- **Primary Key:** TABLE-এ একটি COLUMN বা COLUMN-এর সেট যা প্রতিটি ROW-কে uniquely identify করে। এটি NULL হতে পারে না।
- **Foreign Key:** একটি TABLE-এর COLUMN যা অন্য TABLE-এর PRIMARY KEY-এর সাথে সম্পর্ক স্থাপন করে।

### 4\. What is the difference between the VARCHAR and CHAR data types?

- **VARCHAR:** variable length character type; নির্ধারিত দৈর্ঘ্যের চেয়ে ছোট DATA-তে কম জায়গা নেয়।
- **CHAR:** fixed length character type; নির্ধারিত দৈর্ঘ্যের চেয়ে ছোট হলেও সম্পূর্ণ দৈর্ঘ্য পর্যন্ত জায়গা নেয়।

### 5\. Explain the purpose of the WHERE clause in a SELECT statement.

**WHERE** clause নির্দিষ্ট শর্ত অনুযায়ী TABLE থেকে DATA filter করতে SELECT statement-এ ব্যবহৃত হয়।

### 6\. What are the LIMIT and OFFSET clauses used for?

- **LIMIT:** SELECT statement থেকে কতটি ROW দেখাবে তা নির্ধারণ করে।
- **OFFSET:** নির্দিষ্ট সংখ্যক ROW skip করার জন্য ব্যবহৃত হয়।

### 7\. How can you modify data using UPDATE statements?

**UPDATE** statement TABLE-এর DATA পরিবর্তন করতে ব্যবহৃত হয়। যেমন:

```sql
UPDATE table_name
SET column_name = new_value
WHERE condition;
```

### 8\. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

**JOIN** operation একাধিক TABLE-এর মধ্যে সম্পর্কযুক্ত DATA combine করার জন্য ব্যবহৃত হয়। এটি সাধারণত PRIMARY KEY এবং FOREIGN KEY-র মাধ্যমে TABLE গুলোর মধ্যে সম্পর্ক স্থাপন করে।

### 9\. Explain the GROUP BY clause and its role in aggregation operations.

**GROUP BY** এক বা একাধিক COLUMN-এর ভিত্তিতে DATA group করে এবং aggregation function (যেমন COUNT, SUM, AVG) প্রয়োগ করতে সহায়তা করে।

### 10\. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

Aggregate functions নির্দিষ্ট COLUMN বা GROUP-এর DATA-তে summary বের করতে ব্যবহৃত হয়। উদাহরণ:

```sql
SELECT COUNT(column_name), SUM(column_name), AVG(column_name)
FROM table_name
WHERE condition
GROUP BY column_name;
```
