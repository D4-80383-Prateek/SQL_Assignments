--1)


create table tempp ( side1 int, side2 int ,side3 int , validOrNot varchar(30) );

delimiter //
create function fun( side1 int, side2 int, side3 int)
returns boolean 
deterministic
begin 
    if(((side1+side2)>side3) && ((side1+side3)>side2) && ((side2+side3)>side1))
        then return TRUE; 
    else  return FALSE;  
    end if;  
end;//
delimiter ;

delimiter //
create procedure ab(x int,y int ,z int)
begin 
if fun(x,y,z) then
    insert into tempp  values(x,y,z,'its a valid triangle');
else 
    insert into tempp  values(x,y,z,' not a valid triangle');
end if;
end; //
delimiter ; 

call ab(3,4,5);
select * from tempp;

+-------+-------+-------+-----------------------+
| side1 | side2 | side3 | validOrNot            |
+-------+-------+-------+-----------------------+
|     3 |     4 |     5 | its a valid triangle  |
|     6 |     5 |     2 | its a valid triangle  |
|    16 |     5 |     2 |  not a valid triangle |
+-------+-------+-------+-----------------------+
3 rows in set (0.00 sec)

--2)

delimiter //
create function abc()
returns int
deterministic
begin
return second(now()%10);
end;//
delimiter ;


delimiter //
create procedure pre()
begin
insert into temp values(abc());
end;//
delimiter ;

select * from temp;
+------+
| val  |
+------+
|    3 |
|    2 |
|    7 |
+------+
3 rows in set (0.00 sec)


--3)


delimiter //
create function ab(input varchar(20))
returns varchar(20) 
deterministic
begin
declare x int default 0;
declare y int default length(input);
declare ename varchar(20) default '' ;
while (x<length(input)) do
    set ename=(concat(ename,substr(input,y,1)));
    set x=x+1;
    set y=y-1;
end while;
insert into temp values(ename);
return ename;
end; //
delimiter ;