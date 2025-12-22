select * from A;
select * from B;

-- 합집합
select * from A
union
select * from B;

select * from A
union all
select * from B;

-- 교집합
-- select * from A
-- intersect
-- select * from B;

select * from A
inner join B
using(id)
where A.name = B.name;

-- select * from A
-- minus
-- select * from B;

select * from A
where not exists(
	select 1 from B where A.id = B.id);

select * from A
where not exists(
	select 1 from B where B.id = A.id);
    
select * from A; -- 10 11 12 13 15
select * from B; -- 10 11 12 13 14




