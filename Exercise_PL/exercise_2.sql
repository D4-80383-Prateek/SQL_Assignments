--1)


create table input(val int);
insert into input values(5);

create table ans1_2(_range char(25));

delimiter //
create procedure ques1_2(low int, high int)
begin
    declare x int;
    select val into x from input;
    if x>=low and x<=high then
    insert into ans1_2 values('In the Range');
    else 
    insert into ans1_2 values('Not in the Range');
    end if;
end; //
delimiter ;

call ques1_2(1,10);
select * from ans1_2;


--2)


delimiter //
create procedure ques2_2()
begin
    declare a int;
    declare b int;
    declare c int;

    drop table if exists input;
    create table input(x int, y int, z int);
    insert into input values(12,4,6);

    drop table if exists ans2_2;
    create table ans2_2(Triangle_validation char(50));

  
    select x,y,z into a,b,c from input;
    if a+b>c and b+c>a and c+a>b then
    insert into ans2_2 values('Given values can form a triangle.');
    else
    insert into ans2_2 values('Given values can not form a triangle.');
    end if;
end; //
delimiter ;

call ques2_2;
select * from ans2_2;


--3)
drop table if exists input;
create table input(dt date);
insert into input values('1954-2-4');

drop table if exists ans3_2;
create table ans3_2(d date,Detail char(25));

delimiter //
create procedure ques3_2()
begin
    declare dte date;
    declare yr int;
    select dt into dte from input;
    set yr = YEAR(dte);
    if (mod(yr,4) = 0 and mod(yr,100) != 0) or (mod(yr,4) = 0 and mod(yr,400) = 0) then
    insert into ans3_2 values(dte,'is leap year');
    else
    insert into ans3_2 values(dte,'is not leap year');
    end if;
end; //
delimiter ;

call ques3_2();
select * from ans3_2;