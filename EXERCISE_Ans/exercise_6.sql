--1)

SELECT SNAME FROM S
WHERE STATUS = (SELECT STATUS FROM S WHERE SNAME = 'CLARK');

+-------+
| SNAME |
+-------+
| Smith |
| Clark |
+-------+
2 rows in set (0.00 sec)


--2)

SELECT ename FROM emp
WHERE deptno = (SELECT deptno from emp where ename = 'MILLER');

+--------+
| ename  |
+--------+
| CLARK  |
| KING   |
| MILLER |
+--------+
3 rows in set (0.00 sec)

--3)

SELECT PNAME FROM P WHERE WEIGHT > ALL(SELECT WEIGHT FROM P WHERE COLOR = 'RED');

--4)

SELECT JNAME FROM J WHERE CITY IN(SELECT CITY FROM J WHERE JNAME = 'TAPE');

+----------+
| JNAME    |
+----------+
| Collator |
| Tape     |
+----------+
2 rows in set (0.01 sec)


--5)


SELECT PNAME FROM P WHERE WEIGHT < ANY(SELECT WEIGHT FROM P WHERE COLOR = 'GREEN');

+-------+
| PNAME |
+-------+
| Nut   |
| Screw |
| Cam   |
+-------+
3 rows in set (0.00 sec)


--6)

SELECT SNAME FROM S WHERE `S#` = ANY(SELECT `S#` FROM SPJ WHERE QTY = (SELECT MAX(QTY) FROM SPJ));

+-------+
| SNAME |
+-------+
| Jones |
| Adams |
+-------+
2 rows in set (0.00 sec)

--7)


--8)

SELECT SNAME FROM S 
WHERE `S#`=  
(SELECT `S#` FROM SPJ 
GROUP BY `S#` 
HAVING SUM(QTY) IN 
(SELECT MAX(SUM_QTY) FROM 
(SELECT SUM(QTY) SUM
_QTY FROM SPJ 
GROUP BY `S#`)ABC));

+-------+
| SNAME |
+-------+
| Jones |
+-------+
1 row in set (0.00 sec)

--9)

