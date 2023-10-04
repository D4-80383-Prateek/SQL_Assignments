--1)

    INSERT INTO multicust
    SELECT * FROM SALESPEOPLE WHERE 
    SNUM = (SELECT SNUM FROM 
    (SELECT COUNT(CNUM),SNUM FROM CUSTOMERS 
    GROUP BY SNUM 
    HAVING COUNT(SNUM)>1)ABCD);

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

D4_80383_Prateek>_SELECT * FROM multicust;
+------+--------+--------+------+
| Snum | Sname  | City   | Comm |
+------+--------+--------+------+
| 1004 | Motika | London | 0.11 |
+------+--------+--------+------+
1 row in set (0.00 sec)


--2)

DELETE FROM CUSTOMERS WHERE CNUM NOT IN(SELECT CNUM FROM ORDERS);

--3)

D4_80383_Prateek>_update SALESPEOPLE SET COMM = COMM*1.2 WHERE SNUM = (SELECT SNUM FROM ORDERS WHERE AMT > 3000);
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

D4_80383_Prateek>_SELECT * FROM SALESPEOPLE;
+------+---------+-----------+------+
| Snum | Sname   | City      | Comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.16 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
| 1100 | Blanco  | San Jose  | NULL |
+------+---------+-----------+------+
6 rows in set (0.00 sec)