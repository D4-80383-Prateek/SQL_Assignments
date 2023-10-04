--1)



drop procedure ques1_3;
delimiter //
create procedure ques1_3()
begin
    declare I int default 1;
    drop table if exists ans1_3;
    create table ans1_3(Val int);
    while I <= 1000 do 
    if mod(I,100) = 0 then
    insert into ans1_3 values(I);
    end if;
    set I = I + 1;
    end while;
end; //
delimiter ;

call ques1_3;
seelct * from ans1_3;



--2)
drop table if exists input;
create table input(radius float);
insert into input values(2),(4),(6),(7),(14),(19),(25);

drop procedure ques2_3;
delimiter //
create procedure ques2_3()
begin
    declare low float;
    declare high float;
    declare x float;
    declare circumference float;
    declare area float;
    declare volume float;


    drop table if exists ans2_3;
    create table ans2_3(radius float, Circumference float, Area float, Volume float);
    select min(radius), max(radius) into low,high from input;
    set x = low;

    while x <= high do

    set circumference = 4*3.14*x;
    set area = 4*3.14*x*x;
    set volume = 4*3.14*x*x*x/3;
    insert into ans2_3 values (x,circumference,area,volume);
    set x = x+1;
    end while;

end; //
delimiter ;

call ques2_3;
select * from ans2_3;


--3)

drop table if exists input;
create table input(words char(15));
insert into input values('seres'), ('momom'), ('nitin'), ('radar'), ('input');

drop procedure ques3_3;
delimiter //
create procedure ques3_3()
begin
    declare word char(15);
    declare x int default 0;
    declare count int;
    select count(words) into count from input;
    declare c cursor for select words from input;
    open c;
    while x < count do
    fetch c into word;
    if((substr(word,1,1) = substr(word,5,1)) and substr(word,2,1) = substr(word,4,1))
    insert

