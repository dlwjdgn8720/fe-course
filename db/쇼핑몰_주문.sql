/****************************************
		쇼핑몰 주문 시스템 DB 생성
*****************************************/

-- 데이터베이스 생성
-- CREATE DATABASE IF NOT EXISTS `shoppy2026`;

show databases;
use shoppy2026;
select database();
show tables;

/*****************************************************
	Member 		- mid 		- trg_member_mid
    Order 		- orid 		- trg_order_orid
    OrderItem 	- ord_id 	- trg_orderitem_ord_id
    Product 	- pid 		- trg_product_pid
******************************************************/

delimiter $$
create trigger trg_orderitem_ord_id
before insert on orderitem
for each row
begin
declare max_code int;  --  'M0001'

-- 현재 저장된 값 중 가장 큰 값을 가져옴
SELECT IFNULL(MAX(CAST(right(orderitem_id, 4) AS UNSIGNED)), 0)
INTO max_code
FROM orderitem; 

-- 'M0001' 형식으로 아이디 생성, LPAD(값, 크기, 채워지는 문자형식) : M0001
SET NEW.orderitem_id = concat('M', LPAD((max_code+1), 4, '0'));

end $$
delimiter ;

create table member(
	member_id varchar(4) primary key,
    name varchar(10) not null,
    email varchar(20) not null,
    created_at datetime
);

-- DROP TRIGGER IF EXISTS trg_order_orid;
-- DROP TRIGGER IF EXISTS trg_product_pid;

create table ordermain(
	order_id varchar(4) primary key,
    member_id varchar(4),
    order_date date,
    constraint or_fk_mid foreign key(member_id)
		references member(member_id)
        on delete cascade
        on update cascade
);

create table product(
	product_id varchar(4) primary key,
    name varchar(10) not null,
    price int
);

create table orderitem(
	orderitem_id varchar(4) primary key,
    order_id varchar(4),
    product_id varchar(4),
    quantity int,
	unit_price int,
    constraint oi_fk_odid foreign key(order_id)
		references ordermain(order_id)
        on delete cascade
        on update cascade,
	constraint oi_fk_pid foreign key(product_id)
		references product(product_id)
        on delete cascade
        on update cascade
);

select * from information_schema.triggers
	where trigger_schema = 'shoppy2026';
	
    










