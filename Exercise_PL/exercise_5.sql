--1)

delimiter //
create procedure Comp_intr( p int , r float  ,  y int )
begin
declare i int default 1;
declare total int default 1; 
set i =p*(pow((1+r),y))-p;
set total =p*pow((1+r),y);
insert into temp values(i,total);
end; // 
delimiter ;

create table temp (interest int, total_amount int);  

call Comp_intr(100,0.03,1);
call Comp_intr(100,0.03,2);

select * from temp;
+----------+--------------+
| interest | total_amount |
+----------+--------------+
|        3 |          103 |
|        6 |          106 |
+----------+--------------+
2 rows in set (0.00 sec)


--2)

delimiter //
create function abcd(bdate date)
returns int 
deterministic
begin 
declare x int ;
set x =(datediff (sysdate(),bdate)/365);
return x ;
end; //
delimiter ;


select abcd('2001-01-01');