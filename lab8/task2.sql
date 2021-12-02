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
