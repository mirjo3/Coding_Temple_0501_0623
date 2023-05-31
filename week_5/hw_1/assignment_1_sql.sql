-- Creating a table on SQL for titanic data
CREATE TABLE titanic (
Survived int,
Pclass int,
Name text,
Sex text,
Age float,
SiblingsSpousesAboard int,
ParentsChildrenAboard int,
Fare float
)
;

--Question 1 Count how many rows you have.
SELECT COUNT(*) FROM titanic

--Question 2 How many people survived?
SELECT COUNT(survived)
FROM titanic
WHERE survived = 1

--Question 3 What passenger class has the largest population?
SELECT pclass, COUNT(pclass) AS CountPclass
FROM titanic
GROUP BY pclass
ORDER BY CountPclass DESC
