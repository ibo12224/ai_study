select * from testA;
select * from testB;

-- cross join(mysql, oracle):표준 X
select * from testA a, testB b order by a.name;

-- cross join(의미있는 X): 표준
select * from testA
cross join testB
order by testA.name;

-- equi join(공통컬럼기준 = ):
-- 표준아님
select * from testA a, testB b where a.name = b.name;
-- 표준

select * from testA inner join testB
on testA.name = testB.name;

select * from testA inner join testB
using(name);

select * from testA natural join testB;

select * from testA  join testB
using (name);

select * from testA left join testB
using (name);

select * from testA right join testB
using (name);


-- join 이용
-- 뉴욕에서 근무하는 사원의 이름과 급여를 출력하시오.
select * from testA inner join testB
using(name)
where myid<=2;


select ename, sal from emp inner join dept
using( deptno )
where loc='NEW YORK';

select * from emp;
select * from dept;
select * from emp inner join dept
using( deptno );

select * from emp right join dept
using( deptno );

select * from emp join dept
using( deptno );

-- 퀴즈 ACCOUNTING 부서 소속 사원의 이름과 입사일을 출력하시오
select ename, hiredate from emp join dept
using( deptno )
where dname='ACCOUNTING';

-- sub query로
select ename, hiredate from emp
where deptno = (select deptno from dept where dname='ACCOUNTING');

-- non equi join
select * from salgrade;

select * from emp e
join salgrade s
on e.sal >=s.low_salary
and e.sal <= s.high_salary;

select ename, sal, grade from emp e
join salgrade s
on e.sal >=s.low_salary
and e.sal <= s.high_salary;

select ename, sal, grade from emp e
join salgrade s
on e.sal between s.low_salary and s.high_salary;

-- self join
select * from emp;

select e1.ename 상관, e2.ename 직원 from emp e1
join emp e2
on e1.empno = e2.mgr;

select e1.ename 직원, e2.ename 상관 from emp e1
join emp e2
on e1.mgr = e2.empno
and e2.ename = 'KING';
-- 매니저가 KING인 사원들의 이름과 직급을 출력하시오.

