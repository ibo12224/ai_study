-- 형변환 함수
select cast( '1' as signed );
select cast( 220 as char(3) );
select cast( '2020-11-12' as date );

select ename, sal from emp;
select ename, cast( sal as char(4) ) from emp;

select ename, sal 
from emp
where cast( sal as char(4) ) like '2%';

-- over 함수
select ename, avg(sal) from emp;
select ename, avg(sal) over() from emp;
select distinct deptno from emp;
select  ename, avg(sal) over( partition by deptno) from emp;
select sal from emp;
select sum(sal) over( order by sal) from emp;
select sum(sal) over( ORDER BY sal ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) from emp;
select sum(sal) over( ORDER BY sal ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) from emp;






