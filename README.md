# Patient Profile & Diagnosis Trends 🏥

I worked on this project as part of my data analyst learning journey. The idea was simple — a clinic has a ton of patient data sitting in a database and nobody's really looked at it properly. My job was to dig into that data and answer some basic but important questions: who are these patients, what are they coming in for, and are there any patterns worth paying attention to?

---

## What I Was Trying to Solve

Doctors see patients one at a time. But when you look at the data as a whole, you start seeing patterns that no single doctor would ever notice on their own. That's what this project is about — stepping back and looking at the big picture.

The clinic wanted to know things like:
- What does our patient population actually look like by age?
- What conditions are we treating the most?
- Are there patients who keep coming back again and again?
- Which procedures are we performing the most often?

---

## Tools I Used

I used **MySQL Workbench** to write all my SQL queries and do the analysis, and **Tableau Public** to build the final dashboard. The dataset is synthetic (fake but realistic) healthcare data with patient demographics and diagnosis history.

---

## How I Approached It

**Starting with the basics** — I first just explored the raw data to understand what I was working with. The date of birth column was stored as text so I had to use `STR_TO_DATE` to convert it before I could calculate ages. Small thing but it would have broken everything if I'd missed it.

**Age bands** — Once I had ages calculated I grouped patients into four bands: Under 18, 18-39, 40-64, and 65+. The 40-64 group turned out to be the largest chunk of the patient population which makes sense for a general clinic.

**Diagnoses** — I looked at which ICD codes showed up the most across all visits. Hypertension (I10) came out on top by a pretty wide margin. I also broke this down by sex and age group to see if certain conditions were more common in specific groups.

**Visit patterns** — I counted how many times each patient visited and calculated the average across all patients. I also flagged "high utilizers" — patients with 4 or more visits — because these are the people the clinic might want to pay closer attention to from a care coordination perspective.

**Procedures** — Finally I ranked all the CPT codes by how often they were performed to give the clinic a sense of what procedures are driving the most volume.

---

## The Dashboard

Everything came together in a Tableau dashboard with 6 views — the age band distribution, top diagnoses, diagnoses broken down by sex and age, the high utilizers table, and the top CPT codes. The goal was to make it something a doctor or clinic manager could actually look at and get value from without needing to understand SQL.

🔗 https://public.tableau.com/views/PatientProfileDiagnosisTrends_17748040679190/PatientProfileDiagnosisTrends?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link 

---

## What I Learned

This project taught me a lot about working with real-world messy data. Dates stored as text, column naming inconsistencies, figuring out when to use `HAVING` vs `WHERE` — these are the kinds of things you don't really learn until you're actually doing it. I also got much more comfortable with subqueries and window functions through this project.

---

## Files in This Repo

- `healthcare.sql` — all my SQL queries organized by section with comments explaining what each one does
- `patient_visits.csv` — the raw dataset
- `dashboard.png` — screenshot of the final Tableau dashboard
- `README.md` — you're reading it!
