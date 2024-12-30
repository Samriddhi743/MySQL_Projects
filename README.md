# Olympics Data Analysis Using SQL

## Overview
This project analyzes historical Olympics data using SQL to derive insights into top-performing teams, athletes, and trends in sports. The dataset is queried to answer analytical questions such as ranking countries by medal counts, identifying top athletes, and evaluating host country performance.

## Features
- Identify the top-performing countries based on gold, silver, and bronze medals.
- Analyze medal trends across different sports, events, and years.
- Evaluate athlete performance by gender, age, and sports categories.
- Explore host country advantages and regional influences on medal counts.

## Dataset
The dataset contains information on:
- Athletes
- Countries
- Sports and events
- Medals (Gold, Silver, Bronze)
- Olympics history (year, season, and host country)

### Example Queries
1. **Top 10 Countries by Total Medals**  
   ```sql
   SELECT country, SUM(medals) as total_medals
   FROM olympics_data
   GROUP BY country
   ORDER BY total_medals DESC
   LIMIT 10;


### I have also build a student registration form integrating the SQL database using Flask and HTML.
### Second folder is about the student registration form integrating the SQL database using Flask and HTML.