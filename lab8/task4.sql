-- Task 4
create table employees(
    id integer primary key,
    name varchar,
    date_of_birth date,
    age integer,
    salary integer,
    workexperience integer,
    discout integer
);

-- a and b
create or replace procedure funca()
language plpgsql as
$$
    begin
        update employees set
        salary = salary + (salary *
                (salary * 1.5))
        where age >= 40;

        update employees set
        salary = salary + (salary *
                ((workexperience / 2) * 0.1));

        update employees set
        discout = discout + 10 * (workexperience / 2);

        update employees set
        discout = discout + 1 where workexperience >= 7;

--         update employees set
--         salary = salary + (salary * (salary * 1.5))
--         where workexperience > 8;
        update employees set
        discout = discout + 20 where workexperience > 8;
    end;
$$;

call funca();

select * from employees;

drop procedure funca();
drop table employees;
