create table offers
(
    id         bigserial    not null,
    offer_name varchar(255) not null,
    primary key (id)
)
/
create table products
(
    id            bigserial      not null,
    offer_id      bigserial      not null,
    product_name  varchar(255)   not null,
    product_price numeric(19, 2) not null,
    primary key (id)
)
/

alter table if exists products
    add constraint products_offer_id_fk foreign key (offer_id) references offers
/
