-- Task 2
-- a
create table t1(
    id integer,
    first_name varchar(40) not null,
    last_name varchar(40)
);

create table t2(
    name varchar(40) not null,
    time timestamp
);

create or replace function the_time()
    returns trigger
    language plpgsql as
$$
    begin
        insert into t2(name, time) values (new.first_name, now());

        return new;
    end;
$$;

create trigger return_timestamp
    after insert
    on t1
    for each row
execute procedure the_time();

insert into t1 (id, first_name, last_name)
VALUES (1, 'John', 'Brown');
insert into t1 (id, first_name, last_name)
values (2, 'Adilet', 'Bolarbekov');

select * from t1;
select * from t2;

-- b
create table t3(
    first_name varchar(20),
    last_name varchar(20),
    date_of_birth date
);

create table t4(
    age varchar(100)
);

create or replace function the_age()
    returns trigger
    language plpgsql as
$$
    begin
        insert into t4(age)
        values (age(now(), new.date_of_birth));

        return new;
    end;
$$;

create trigger return_age
    after insert
    on t3
    for each row
execute procedure the_age();

insert into t3(first_name, last_name, date_of_birth)
VALUES ('Adilet', 'Bolatbekov', '2002-12-08'),
       ('Steven', 'Stevenson', '1963-12-21');

select * from t3;
select * from t4;

-- c
create table t5(
    name varchar(50),
    price int,
    price_tax numeric
);

create or replace function tax_add()
returns trigger
language plpgsql as
$$
    declare tax integer;
    begin
        new.price_tax = new.price + (new.price * 0.12);

        return new;
    end;
$$;

create trigger the_tax
    before insert
    on t5
    for each row
execute procedure tax_add();

insert into t5 (name, price)
values ('iPhone', 500),
       ('Galaxy', 150);

select * from t5;

-- d
-- e
create table t6(
    n1 integer,
    n2 varchar(20),
    n3 boolean
);

create or replace function call_func()
returns trigger
language plpgsql as
$$
    begin
        new.n3 = check_password(new.n2);
        perform (select (two_outputs2(new.n1)));

        return new;
    end;
$$;

create trigger two_func
    after insert
    on t6
    for each row
execute procedure call_func();

insert into t6 (n1, n2)
values (10, 'helloWorldabc');

select * from t6;

-- Task 3
/*
1.The procedure allows SELECT as well as
DML(INSERT/UPDATE/DELETE) statement in it
whereas Function allows only SELECT statement in it.
2.Procedures cannot be utilized in a SELECT statement
whereas Function can be embedded in a SELECT statement.
*/
