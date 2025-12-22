-- 1. 부서별로 부서명, 평균급여를 출력하세요.

select dname, avg(sal) 
from emp
join dept
using(deptno)
group by dname;

select * from emp
join dept
using(deptno);
select * from dept;

select ename, deptno
from emp
where deptno not in (select deptno from dept where loc='NEW YORK');
-- deptno not in(10);

-- JAMES이 소속된 부서의 사원중 
-- 급여가 1000에서 2000사이인 사원의 이름과 부서명을 출력하세요
select *
from emp join dept
using(deptno);

select dname, ename 
from emp join dept
using(deptno)
where sal between 1000 and 2000
and deptno = (select deptno from emp where ename='JAMES');


