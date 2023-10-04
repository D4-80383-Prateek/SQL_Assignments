--1)


drop procedure ques1;
delimiter //
create procedure ques1(l int, w int)
begin
    drop table if exists ans1;
    create table ans1(area int, perimeter int);
    create or replace table ans1 (area int, perimeter int);
    insert into ans1 values(l*w, 2*(l+w));
end; //
delimiter ;

call ques1(4,5);

--2)



drop procedure ques2;
delimiter //
create procedure ques2(f float, c float)
begin
    drop table if exists ans2;
    create table ans2
    (
        F_fahrenheit float,
        C_celcius float,
        F_to_C float,
        C_to_F float
    );
    declare f_c float;
    declare c_f float;
    set f_c = (f-32)*5/9;
    set c_f = 9*c/5+32;
    insert into ans2 values(f,c,f_c,c_f);
    end; //
    delimiter ;

    call ques2(2.3,4.5);
    select * from ans2;


--3)



delimiter //
create procedure ques3(x int)
begin
    drop table if exists ans3;
    create table ans3(num int, divisibility char(20));
    if mod(x,5) = 0 then
    insert into ans3 values(x, 'Divisible by 5');
    else
    insert into ans3 values(x, 'Not Divisible by 5');
    end if;
end; //
delimiter ;

call ques3(20);
select * from ans3;