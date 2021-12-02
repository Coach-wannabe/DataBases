-- Task 1
-- a
create or replace function increment(value integer)
returns integer
language plpgsql as
$$
begin
    return value + 1;
end;
$$;

-- b
create or replace function sum(a integer, b integer)
returns integer
language plpgsql as
$$
begin
    return a + b;
end;
$$;
select sum(10, 15);

-- c
create or replace function check_function(value integer)
returns boolean
language plpgsql as
$$
begin
    if value % 2 = 0 then
        return true;
    else return false;
    end if;
end;
$$;

-- d
create or replace function check_password(t text)
returns boolean
language plpgsql as
$$
begin
    if length(t) > 12 then
        return true;
    else return false;
    end if;
end;
$$;

-- e
create or replace function two_outputs(in value int, out n1 int, out n2 int)
language plpgsql as
$$
begin
    n1 = value + 1;
    n2 = value - 1;
end;
$$;

create or replace function two_outputs2(value int)
returns void
language plpgsql as
$$
    begin
        raise notice 'n1: %', value + 1;
        raise notice 'n2: %', value - 1;
    end;
$$;
select two_outputs2(10);

select two_outputs(10);
