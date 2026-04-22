show databases;
use myshop2019;
select database();
show tables;

-- Q20) 주문연도별, 주문월별 전체금액 합과 평균을 조회하고, rollup 함수를 이용하여 소계와 총계를 출력해주세요.
	select 
		case 
        when grouping(year) = 1 then '전체 총합계'
		else year
		end as '주문연도',
        case 
        when grouping(year) = 0 and grouping(month) = 1 then '연도별 소계'
        when grouping(year) = 1 and grouping(month) = 1 then '-'
		else month
		end as '주문월',
        sum(total_due) as '합계',
		floor(avg(total_due)) as '평균'
    from (select  year(order_date) as year,
				  month(order_date) as month,
                  total_due
                  from order_header) T
    group by year, month with rollup;
	

/**
	테이블 조인 : 기본 SQL 방식, ANSI SQL
*/
-- Q01) 전체금액이 8,500,000 이상인 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 전체금액을 조회하세요.
	select 
		o.order_id,
        c.customer_id,
        o.employee_id,
        o.order_date,
        o.total_due
	from customer c, order_header o
	where c.customer_id = o.customer_id
	and total_due > 8500000;
        
-- Q02) 위에서 작성한 쿼리문을 복사해 붙여 넣은 후 고객이름도 같이 조회되게 수정하세요.
	select 
		o.order_id,
        c.customer_id,
        c.customer_name,
        o.employee_id,
        o.order_date,
        o.total_due
	from customer c, order_header o
	where c.customer_id = o.customer_id
	and total_due > 8500000;

-- Q03) Q01 쿼리를 복사해 붙여 넣은 후 직원이름도 같이 조회되게 수정하세요.
	select 
		o.order_id,
        c.customer_id,
        o.employee_id,
        e.employee_name,
        o.order_date,
        o.total_due
	from customer c, order_header o, employee e
	where c.customer_id = o.customer_id
	and o.employee_id = e.employee_id
	and total_due > 8500000;
        
-- Q04) 위에서 작성한 쿼리문을 복사해 붙여 넣은 후 고객이름, 직원이름도 같이 조회되게 수정하세요.
	select 
		o.order_id,
        c.customer_id,
        c.customer_name,
        o.employee_id,
        e.employee_name,
        o.order_date,
        o.total_due
	from customer c, order_header o, employee e
	where c.customer_id = o.customer_id
	and o.employee_id = e.employee_id
	and total_due > 8500000;
        
-- Q05) 위에서 작성한 쿼리문을 복사해 붙여 넣은 후 전체금액이 8,500,000 이상인 '서울' 지역 고객만 조회되게 수정하세요.
	select 
		o.order_id,
        c.customer_id,
        c.customer_name,
        c.city,
        o.employee_id,
        e.employee_name,
        o.order_date,
        o.total_due
	from customer c, order_header o, employee e
	where c.customer_id = o.customer_id
	and o.employee_id = e.employee_id
	and total_due > 8500000
	and c.city = '서울';
        
        
-- Q06) 위에서 작성한 쿼리문을 복사해 붙여 넣은 후 전체금액이 8,500,000 이상인 '서울' 지역 '남자' 고객만 조회되게 수정하세요.
	select 
		o.order_id,
        c.customer_id,
        c.customer_name,
        c.city,
        o.employee_id,
        e.employee_name,
        o.order_date,
        o.total_due
	from customer c, order_header o, employee e
	where c.customer_id = o.customer_id
	and o.employee_id = e.employee_id
	and total_due > 8500000
	and c.city = '서울'
    and c.gender = 'M';
    
-- Q07) 주문수량이 30개 이상인 주문의 주문번호, 상품코드, 주문수량, 단가, 지불금액을 조회하세요.
	select 
			od.order_id,
            od.product_id,
            od.order_qty,
            od.unit_price,
            od.line_total
	from order_detail od, product p
	where od.product_id = p.product_id
    and od.order_qty > 30;
    
-- Q08) 위에서 작성한 쿼리문을 복사해서 붙여 넣은 후 상품이름도 같이 조회되도록 수정하세요.
	select 
			od.order_id,
            od.order_qty,
            od.unit_price,
            od.line_total,
            p.product_id,
            p.product_name
	from order_detail od, product p
	where od.product_id = p.product_id
    and od.order_qty > 30;
    
-- Q09) 상품코드, 상품이름, 소분류아이디를 조회하세요.
	select 
			p.product_id,
            p.product_name,
            sc.sub_category_id
    from product p, sub_category sc
    where p.sub_category_id = sc.sub_category_id;
-- Q10) 위에서 작성한 쿼리문을 복사해서 붙여 넣은 후 소분류이름, 대분류아이디가 조회되게 수정하세요.
	select 
			p.product_id,
            p.product_name,
            sc.sub_category_id,
            sc.sub_category_name,
            c.category_id
    from product p, sub_category sc, category c
    where p.sub_category_id = sc.sub_category_id
    and sc.category_id = c.category_id;
    
-- Q11) 다정한 사원이 2019년에 주문한 상품명을 모두 출력해주세요.
	select oh.order_date, p.product_name 
		from employee e, 
			 order_header oh, 
             order_detail od, 
             product p
		where e.employee_id = oh.employee_id
		and oh.order_id = od.order_id
		and od.product_id = p.product_id
		and e.employee_name = '다정한'
		and year(oh.order_date) = '2019';
    
-- Q12) 청소기를 구입한 고객아이디, 사원번호, 주문번호, 주문일시를 조회하세요.

/**
	서브쿼리
*/
-- Q13) 'mtkim', 'odoh', 'soyoukim', 'winterkim' 고객 주문의 주문번호, 고객아이디, 주문일시, 전체금액을 조회하세요.
		select 
			 order_id,
             customer_id,
             order_date,
             total_due
		from order_header oh
        where customer_id in(
				select customer_id 
				from customer 
				where customer_id in ('mtkim', 'odoh', 'soyoukim', 'winterkim'));
                 
-- Q14) '전주' 지역 고객의 아이디를 조회하세요.
		select * from customer where city = '전주';
        
-- Q15) 위 두 쿼리문을 조합해서 하위 쿼리를 사용해 '전주' 지역 고객 주문의 주문번호, 고객아이디, 주문일시, 전체금액을 조회하세요.
		select 
			 order_id,
             customer_id,
             order_date,
             total_due
		from order_header oh
        where customer_id in(
				 select customer_id 
				 from customer 
                 where customer_id in ('mtkim', 'odoh', 'soyoukim', 'winterkim')
                 and city = '전주');
        
-- Q16) 고객의 포인트 최댓값을 조회하세요.
-- Q17) 하위 쿼리를 사용해 가장 포인트가 많은 고객의 이름, 아이디, 등록일, 포인트를 조회하세요.
-- Q18) 하위 쿼리를 사용해 홍길동(gdhong) 고객보다 포인트가 많은 고객 이름, 아이디, 등록일, 포인트를 조회하세요.
-- Q19) 하위 쿼리를 사용해 홍길동(gdhong) 고객과 같은 지역의 고객 이름, 아이디, 지역, 등록일, 포인트를 조회하세요.
--      단, 고객 이름을 기준으로 오름차순 정렬해서 조회하세요.
-- Q20) 하위 쿼리를 사용해 홍길동(gdhong) 고객보다 포인트가 많은 고객 이름, 아이디, 등록일, 포인트를 조회하고, 행번호를 추가하여 출력하세요.


