/*
-- Task 1
How can we store large-object types?
    We can store it in binary large object or blob and in character large object or clob
    blob: binary large object - object is a large collection of
          uninterpreted binary data (whose interpretation is left to
          an application outside of the database system)
    clob: character large object
          object is a large collection of character data
-- Task 2
What is the difference between privilege, role and user?
    Privileges control the ability to run SQL statements.
    A role is a group of privileges.
    The grantor of the privilege must already hold the privilege
        on the specified item (or be the database administrator).
    A role is a way to distinguish among various users as far
        as what these users can access/update in the database.
 */
 
 create role accountant;
create role administrator;
create role support;

grant select on transactions to accountant;
grant select, update (balance) on accounts to accountant;
grant all privileges on accounts, customers, transactions to administrator;
grant select on accounts, customers, transactions to support;

create user JasFace;
create user qqHomie;
create user Praque;

grant accountant to JasFace;
grant administrator to qqHomie;
grant support to Praque;

revoke update on accounts from accountant;

-- Task 3

select * from transactions;
alter table transactions alter column date set not null;
alter table transactions alter column src_account set not null;
alter table transactions alter column dst_account set not null;
alter table transactions alter column amount set not null;
alter table transactions alter column status set not null;

-- Task 5
create index src on transactions(src_account);
create index dst on transactions(dst_account);
