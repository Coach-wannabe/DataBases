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
