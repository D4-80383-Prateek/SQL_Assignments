--1)

D4_80383_Prateek>_insert into SALESPEOPLE(CITY, SNAME, COMM, SNUM) VALUES ('San Jose', 'Blanco',NULL,'1100');
Query OK, 1 row affected (0.01 sec)

D4_80383_Prateek>_select * from SALESPEOPLE;
+------+---------+-----------+------+
| Snum | Sname   | City      | Comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
| 1100 | Blanco  | San Jose  | NULL |
+------+---------+-----------+------+
6 rows in set (0.00 sec)


--2)

D4_80383_Prateek>_DELETE FROM ORDERS WHERE CNUM = (SELECT CNUM FROM CUSTOMERS WHERE CNAME = 'Clemens');
Query OK, 2 rows affected (0.00 sec)

D4_80383_Prateek>_SELECT * FROM ORDERS;
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
+------+---------+------------+------+------+
8 rows in set (0.00 sec)

--3)

D4_80383_Prateek>_UPDATE CUSTOMERS SET RATING = RATING + 100
    -> WHERE CITY = 'ROME';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

D4_80383_Prateek>_SELECT * FROM CUSTOMERS;
+------+----------+----------+--------+------+
| Cnum | Cname    | City     | Rating | Snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    300 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2006 | Clemens  | London   |    100 | 1001 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
| 2007 | Pereira  | Rome     |    200 | 1004 |
+------+----------+----------+--------+------+
7 rows in set (0.00 sec)


--4)

UPDATE CUSTOMERS SET SNUM = (SELECT SNUM FROM SALESPEOPLE WHERE SNAME = 'Motika') 
WHERE SNUM = (SELECT SNUM FROM SALESPEOPLE WHERE SNAME = 'Serres');D4_80383_Prateek>_UPDATE CUSTOMERS SET SNUM = (SELECT SNUM FROM SALESPEOPLE WHERE SNAME = 'Motika') 
    -> WHERE SNUM = (SELECT SNUM FROM SALESPEOPLE WHERE SNAME = 'Serres');
Query OK, 3 rows affected (0.00 sec)
Rows matched: 3  Changed: 3  Warnings: 0

D4_80383_Prateek>_select * from CUSTOMERS;
+------+----------+----------+--------+------+
| Cnum | Cname    | City     | Rating | Snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    300 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1004 |
| 2004 | Grass    | Berlin   |    300 | 1004 |
| 2006 | Clemens  | London   |    100 | 1001 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
| 2007 | Pereira  | Rome     |    200 | 1004 |
+------+----------+----------+--------+------+
7 rows in set (0.01 sec)
