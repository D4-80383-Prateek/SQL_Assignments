--1)

SELECT SNAME, SUM(QTY) QTY_SOLD FROM SPJ,S 
WHERE S.`S#` = SPJ.`S#` 
GROUP BY SNAME;

+-------+----------+
| SNAME | QTY_SOLD |
+-------+----------+
| Smith |      900 |
| Jones |     3200 |
| Blake |      700 |
| Clark |      600 |
| Adams |     3100 |
+-------+----------+
5 rows in set (0.00 sec)

--2)

SELECT PNAME, SUM(QTY) QTY_SOLD FROM SPJ,P 
WHERE P.`P#` = SPJ.`P#` 
GROUP BY PNAME;

+-------+----------+
| PNAME | QTY_SOLD |
+-------+----------+
| Nut   |     1000 |
| Screw |     4800 |
| Cam   |     1100 |
| Cog   |     1300 |
| Bolt  |      300 |
+-------+----------+
5 rows in set (0.00 sec)

--3)

SELECT JNAME NAME, SUM(QTY) QTY_SOLD FROM SPJ,J 
WHERE J.`J#` = SPJ.`J#` 
GROUP BY JNAME;

+----------+----------+
| NAME     | QTY_SOLD |
+----------+----------+
| Sorter   |      800 |
| Console  |     3300 |
| Punch    |     1200 |
| Reader   |      500 |
| Collator |     1100 |
| Terminal |      400 |
| Tape     |     1200 |
+----------+----------+
7 rows in set (0.00 sec)

--4)

SELECT SNAME, PNAME, JNAME PROJ_NAME, SUM(QTY) QTY_SOLD FROM SPJ,S,P,J 
WHERE S.`S#` = SPJ.`S#` AND P.`P#` = SPJ.`P#` AND J.`J#` = SPJ.`J#` 
GROUP BY SNAME, PNAME,JNAME;

+-------+-------+-----------+----------+
| SNAME | PNAME | PROJ_NAME | QTY_SOLD |
+-------+-------+-----------+----------+
| Jones | Screw | Sorter    |      400 |
| Blake | Screw | Sorter    |      200 |
| Smith | Nut   | Sorter    |      200 |
| Adams | Cog   | Punch     |      200 |
| Jones | Cam   | Punch     |      100 |
| Blake | Screw | Punch     |      500 |
| Jones | Screw | Punch     |      200 |
| Adams | Bolt  | Punch     |      200 |
| Clark | Cog   | Reader    |      300 |
| Jones | Screw | Reader    |      200 |
| Adams | Cog   | Console   |      500 |
| Adams | Cam   | Console   |      400 |
| Adams | Screw | Console   |     1000 |
| Jones | Screw | Console   |      500 |
| Adams | Bolt  | Console   |      100 |
| Smith | Nut   | Console   |      700 |
| Adams | Nut   | Console   |      100 |
| Adams | Cam   | Collator  |      500 |
| Jones | Screw | Collator  |      600 |
| Jones | Screw | Terminal  |      400 |
| Clark | Cog   | Tape      |      300 |
| Adams | Cam   | Tape      |      100 |
| Jones | Screw | Tape      |      800 |
+-------+-------+-----------+----------+
23 rows in set (0.00 sec)

--5)

SELECT S.SNAME,J.JNAME PROJ_NAME, J.CITY, PNAME FROM S,P,J
WHERE S.CITY = J.CITY AND J.CITY = P.CITY;
-- GROUP BY CITY,SNAME;

+-------+-----------+--------+-------+
| SNAME | PROJ_NAME | CITY   | PNAME |
+-------+-----------+--------+-------+
| Jones | Sorter    | Paris  | Cam   |
| Blake | Sorter    | Paris  | Cam   |
| Jones | Sorter    | Paris  | Bolt  |
| Blake | Sorter    | Paris  | Bolt  |
| Smith | Collator  | London | Cog   |
| Clark | Collator  | London | Cog   |
| Smith | Collator  | London | Screw |
| Clark | Collator  | London | Screw |
| Smith | Collator  | London | Nut   |
| Clark | Collator  | London | Nut   |
| Smith | Tape      | London | Cog   |
| Clark | Tape      | London | Cog   |
| Smith | Tape      | London | Screw |
| Clark | Tape      | London | Screw |
| Smith | Tape      | London | Nut   |
| Clark | Tape      | London | Nut   |
+-------+-----------+--------+-------+
16 rows in set (0.00 sec)


--6)

SELECT PNAME, SUM(QTY) QTY_SOLD FROM SPJ,P 
WHERE SPJ.`P#` = P.`P#` AND COLOR = 'RED' 
GROUP BY PNAME;

+-------+----------+
| PNAME | QTY_SOLD |
+-------+----------+
| Nut   |     1000 |
| Screw |     1300 |
| Cog   |     1300 |
+-------+----------+
3 rows in set (0.00 sec)


--7)

SELECT STATUS, SUM(QTY) QTY_SOLD FROM SPJ,S 
WHERE SPJ.`S#` = S.`S#` AND STATUS = 20 
GROUP BY STATUS;

+--------+----------+
| STATUS | QTY_SOLD |
+--------+----------+
|     20 |     1500 |
+--------+----------+
1 row in set (0.00 sec)


--8)

SELECT PNAME, SUM(QTY) QTY_SOLD FROM SPJ,P
WHERE SPJ.`P#` = P.`P#` AND P.WEIGHT > 14
GROUP BY PNAME;

+-------+----------+
| PNAME | QTY_SOLD |
+-------+----------+
| Screw |     3500 |
| Cog   |     1300 |
| Bolt  |      300 |
+-------+----------+
3 rows in set (0.01 sec)


--9)

SELECT JNAME PROJ_NAME, CITY FROM J,SPJ
WHERE J.`J#` = SPJ.`J#`
GROUP BY JNAME,CITY
HAVING SUM(QTY) > 500;

+-----------+--------+
| PROJ_NAME | CITY   |
+-----------+--------+
| Sorter    | Paris  |
| Console   | Athens |
| Punch     | Rome   |
| Collator  | London |
| Tape      | London |
+-----------+--------+
5 rows in set (0.01 sec)

--10)

SELECT PNAME, SUM(QTY) QTY_SOLD FROM SPJ,P
WHERE P.`P#` = SPJ.`P#` AND WEIGHT < 15
GROUP BY PNAME;

+-------+----------+
| PNAME | QTY_SOLD |
+-------+----------+
| Nut   |     1000 |
| Cam   |     1100 |
| Screw |     1300 |
+-------+----------+
3 rows in set (0.00 sec)

--11)

select a.ename, b.ename manager from emp a,emp b
where a.mgr = b.empno
order by 1;

+--------+---------+
| ename  | manager |
+--------+---------+
| ADAMS  | SCOTT   |
| ALLEN  | BLAKE   |
| BLAKE  | KING    |
| CLARK  | KING    |
| FORD   | JONES   |
| JAMES  | BLAKE   |
| JONES  | KING    |
| MARTIN | BLAKE   |
| MILLER | CLARK   |
| SCOTT  | JONES   |
| SMITH  | FORD    |
| TURNER | BLAKE   |
| WARD   | BLAKE   |
+--------+---------+
13 rows in set (0.00 sec)
