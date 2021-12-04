-- Assume truck 1721 is destroyed in a crash --
-- Find all customers who had a package on that
-- truck at the time of the crash
select customer_id
from order_table join vehicle v on order_table.package_id = v.package_id
where vehicle_id = 1721;

-- Find the customer who has shipped the most packages in
-- the past year
create view a as
select customer_id, count(customer_id) from order_table
where ordering_date < '2021-01-01' and ordering_date > '2019-12-31'
group by customer_id
order by count(customer_id) desc limit 1;
select * from a;

drop view a;

-- Find the customer who has spent the most money on
-- shipping in the past year
create view b as
select customer_id, sum(price) from order_table
where ordering_date < '2021-01-01' and ordering_date > '2019-12-31'
group by customer_id
order by sum(price) desc limit 1;
select * from b;

drop view b;

-- Find the street with the most customers
insert into customer (customer_id, first_name, last_name, email, phone, age) values (101, 'Darrel', 'Keirle', 'dkeirle0@tinypic.com', '383-316-6634', 2);
insert into customer (customer_id, first_name, last_name, email, phone, age) values (102, 'Morgana', 'Pyford', 'mpyford1@mozilla.com', '232-729-7677', 98);
insert into customer (customer_id, first_name, last_name, email, phone, age) values (103, 'Bunny', 'Bann', 'bbann2@vkontakte.ru', '504-497-2101', 43);
insert into customer (customer_id, first_name, last_name, email, phone, age) values (104, 'Netti', 'Simco', 'nsimco3@purevolume.com', '215-440-2318', 74);
insert into customer (customer_id, first_name, last_name, email, phone, age) values (105, 'Christel', 'de Clerc', 'cdeclerc4@ft.com', '943-944-1578', 89);
insert into customer (customer_id, first_name, last_name, email, phone, age) values (106, 'Patrick', 'Doey', 'pdoey5@domainmarket.com', '961-691-9516', 23);
insert into customer (customer_id, first_name, last_name, email, phone, age) values (107, 'Estella', 'Cropp', 'ecropp6@deliciousdays.com', '714-763-7618', 81);
insert into customer (customer_id, first_name, last_name, email, phone, age) values (108, 'Bald', 'Bellin', 'bbellin7@springer.com', '850-838-6192', 78);
insert into customer (customer_id, first_name, last_name, email, phone, age) values (109, 'Robbie', 'Deeny', 'rdeeny8@dedecms.com', '195-851-1988', 18);
insert into customer (customer_id, first_name, last_name, email, phone, age) values (110, 'Benton', 'Satterthwaite', 'bsatterthwaite9@gmpg.org', '159-855-1393', 56);

insert into customer_addres (client_id, country, city, street, home_number) values (101, 'Finland', 'Joutseno', 'Street1', '9');
insert into customer_addres (client_id, country, city, street, home_number) values (102, 'Indonesia', 'Kabir', 'Street1', '7');
insert into customer_addres (client_id, country, city, street, home_number) values (103, 'Philippines', 'Dinahican', 'Street1', '33983');
insert into customer_addres (client_id, country, city, street, home_number) values (104, 'China', 'Kalpin', 'Street2', '87724');
insert into customer_addres (client_id, country, city, street, home_number) values (105, 'China', 'Xian’an', 'Street2', '414');
insert into customer_addres (client_id, country, city, street, home_number) values (106, 'Indonesia', 'Street1', 'School', '6');
insert into customer_addres (client_id, country, city, street, home_number) values (107, 'Russia', 'L', 'Street2', '552');
insert into customer_addres (client_id, country, city, street, home_number) values (108, 'Comoros', 'Itsandz', 'Street3', '559');
insert into customer_addres (client_id, country, city, street, home_number) values (109, 'Philippines', 'Pagangan', 'Graceland', '354');
insert into customer_addres (client_id, country, city, street, home_number) values (110, 'Sweden', 'Tumba', 'Service', '515');

create view c as
select street, count(client_id) from customer_addres
group by street order by count(client_id) desc limit 1;
select * from c;
