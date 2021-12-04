create or replace function status()
returns trigger
language plpgsql as
$$
    begin
        update contract set payment_status = false
        where dept > 0;
        update contract set payment_status = true
        where dept = 0;

        return null;
    end;
$$;

create trigger the_status
    after insert
    on contract
    for each row
execute procedure status();


create or replace function insert_hazardous()
returns trigger
language plpgsql as
$$
    begin
        if new.type = 'hazardous' then
            insert into hazardous (product_id, name)
            values (new.package_id, new.name);
        end if;

        return null;
    end
$$;

create trigger return_hazardous
    after insert
    on order_table
    for each row
execute procedure insert_hazardous();


create or replace function insert_international()
returns trigger
language plpgsql as
$$
    begin
        if new.type = 'international' then
            insert into international_shipment
            (product_id, name, content)
            values (new.package_id, new.name,
                    'Explosives, guns, transport and etc.');
        end if;

        return null;
    end;
$$;

create trigger return_international
    after insert
    on order_table
    for each row
execute procedure insert_international();


create or replace function insert_tracking()
returns trigger
language plpgsql as
$$
    begin
        insert into tracking (package_id, current_country,
                              current_city, street,
                              remaining_time)
        values (new.package_id, new.country, new.city,
                new.street, new.datetime_of_arrival - now());
        return null;
    end
$$;

create trigger the_tracking
    after insert
    on vehicle
    for each row
execute procedure insert_tracking();


create or replace function insert_warehouse()
returns trigger
language plpgsql as
$$
    begin
        insert into warehouse (package_id, current_city)
        values (new.package_id, new.current_city);
        return null;
    end;
$$;

create trigger the_warehouse
    after insert
    on tracking
    for each row
execute procedure insert_warehouse();
