--1)

D4_80383_Prateek>_SELECT SALESPEOPLE.SNAME, SALESPEOPLE.SNUM FROM ORDERS,SALESPEOPLE
    -> UNION
    -> SELECT CUSTOMERS.CNAME, CUSTOMERS.CNUM FROM ORDERS,CUSTOMERS
    -> ORDER BY 1;
+----------+------+
| SNAME    | SNUM |
+----------+------+
| Axelrod  | 1003 |
| Cisneros | 2008 |
| Clemens  | 2006 |
| Giovanni | 2002 |
| Grass    | 2004 |
| Hoffman  | 2001 |
| Liu      | 2003 |
| Motika   | 1004 |
| Peel     | 1001 |
| Pereira  | 2007 |
| Rifkin   | 1007 |
| Serres   | 1002 |
+----------+------+
12 rows in set (0.01 sec)


--2)

D4_80383_Prateek>_SELECT SALESPEOPLE.SNAME, SALESPEOPLE.SNUM FROM ORDERS,SALESPEOPLE
    -> WHERE SALESPEOPLE.SNUM = ORDERS.SNUM
    -> GROUP BY SALESPEOPLE.SNAME, SALESPEOPLE.SNUM
    -> HAVING COUNT(SALESPEOPLE.SNUM) > 1
    -> UNION
    -> SELECT CUSTOMERS.CNAME, CUSTOMERS.CNUM FROM ORDERS,CUSTOMERS
    -> WHERE CUSTOMERS.CNUM = CUSTOMERS.CNUM
    -> GROUP BY CUSTOMERS.CNAME, CUSTOMERS.CNUM
    -> HAVING COUNT(CUSTOMERS.CNUM) > 1;
+----------+------+
| SNAME    | SNUM |
+----------+------+
| Rifkin   | 1007 |
| Peel     | 1001 |
| Serres   | 1002 |
| Pereira  | 2007 |
| Cisneros | 2008 |
| Clemens  | 2006 |
| Grass    | 2004 |
| Liu      | 2003 |
| Giovanni | 2002 |
| Hoffman  | 2001 |
+----------+------+
10 rows in set (0.00 sec)


--3)


D4_80383_Prateek>_SELECT SNUM NUM FROM SALESPEOPLE
    -> WHERE CITY = 'SAN JOSE'
    -> UNION
    -> SELECT CNUM FROM CUSTOMERS
    -> WHERE CITY = 'SAN JOSE'
    -> UNION ALL
    -> SELECT ONUM FROM ORDERS WHERE ODATE = '1990-10-03';
+------+
| NUM  |
+------+
| 1002 |
| 2003 |
| 2008 |
| 3001 |
| 3003 |
| 3002 |
| 3005 |
| 3006 |
+------+
8 rows in set (0.00 sec)
