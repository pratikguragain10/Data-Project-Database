# IPL SQL Data Project

This project loads IPL match data into a PostgreSQL database and solves multiple data analysis problems using SQL.

---

## Requirements

- PostgreSQL (Version 12+)
- psql CLI
- macOS / Linux / Windows supported

---

## How to Run the Project

### **1. Open Terminal and login to PostgreSQL**

```bash

psql -U <your_superuser> -d postgres

2. Run create.sql

- Creates DB, user, and all required tables.

create.sql

3. Load CSV data

- Make sure CSV files are inside the data/ folder.

load.sql

4. Run the IPL Analysis Queries

ipl_queries.sql

- Each query will output SQL result sets.

5. Cleanup 

- Drops database + user:

cleanup.sql

---

- Notes for Mentor:

    - All scripts are self-contained.

    - No GUI tools required — everything is runnable from psql CLI.

    - CSV files provided under /data/.

---
