create table customer(
    customer_id integer unique not null,
    first_name varchar(40) not null,
    last_name varchar(40) not null,
    email varchar(100) not null,
    phone varchar(100),
    age integer,

    primary key (customer_id)
);

create table customer_addres(
    client_id integer unique not null,
    country varchar(50) not null,
    city varchar(50) not null,
    street varchar(50),
    home_number integer,

    foreign key (client_id) references customer (customer_id)
);

create table account(
    customer_id integer unique,
    login varchar(100) not null,
    password varchar(40) not null,
    paying_method varchar(15) not null,

    primary key (customer_id),
    foreign key (customer_id) references customer (customer_id)
);

create table infrequent(
    account_id integer unique,
    card_number varchar(40) not null,
    foreign key (account_id) references account (customer_id)
);

create table prepaid(
    account_id integer unique,
    receipt_number varchar(20) not null,
    foreign key (account_id) references account (customer_id)
);

create table contract(
    account_id integer unique,
    monthly_charges float not null,
    dept float,
    payment_status boolean,
    foreign key (account_id) references account (customer_id)
);

create table order_table(
    customer_id integer not null,
    package_id integer unique not null,
    name varchar(100),
    price float not null,
    weight float not null,
    type varchar(50) not null,
    ordering_date date not null default current_date,
    delievery_date date not null default current_date + interval '7 day',
    country varchar(50) not null,
    city varchar(50) not null,
    street varchar(50) not null,
    home_number integer,
    primary key (package_id),
    foreign key (customer_id) references customer (customer_id)
);

create table vehicle(
    vehicle_id integer not null unique,
    country varchar(50),
    city varchar(50),
    street varchar(50),
    datetime_of_dispatch timestamp not null default now() + interval '1 hour',
    datetime_of_arrival timestamp not null default now() + interval '10 day',
    cost float,
    package_id integer unique,
    primary key (vehicle_id, package_id),
    foreign key (package_id) references order_table (package_id)
);

create table hazardous(
    product_id integer unique,
    name varchar(100) not null,
    foreign key (product_id) references order_table (package_id)
);

create table international_shipment(
    product_id integer unique,
    name varchar(100) not null,
    content varchar(200) not null,
    foreign key (product_id) references order_table (package_id)
);

create table tracking(
    package_id integer unique,
    current_country varchar(50) not null,
    current_city varchar(50) not null,
    street varchar(50) not null,
    remaining_time varchar(200) not null,
    foreign key (package_id)
    references vehicle (package_id),
    primary key (current_city)
);

create table warehouse(
    package_id int not null,
    current_city varchar(50) not null,
    foreign key (current_city) references tracking (current_city)
);
