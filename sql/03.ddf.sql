select * from emp where comm in(300,500,1400);
select * from emp where sal not between 2000 and 3000;

select ename, mgr from emp where mgr is null;
select ename, sal from emp order by ename;

select ename, sal from emp order by HIREDATE desc;

select ename, hiredate, sal, deptno from emp
order by deptno desc, ename desc;

select ename, hiredate, deptno from emp
order by DEPTNO, HIREDATE;

select ename, sal 
from emp
where sal>=3000
order by ename;

select ename, sal, comm from emp;

select count(*)from emp;

select dname from dept
where deptno =(select deptno from emp where ename='JAMES');

select ename, sal from emp 
where sal>(select sal from emp where ename='JAMES');

select ename from emp
where deptno = (select deptno from emp where ename='JAMES') and ename<>'JAMES';

select ename,sal from emp
where sal=(select max(sal) from emp);

select ename,sal from emp
where sal>(select avg(sal)from emp);

-- ward가 속한 부서의 평균연봉보다 큰 연봉을 가진 직원들의 명단alter

select ename,sal from emp 
where sal>( select avg(sal) from emp where deptno = 
(select deptno from emp where ename='WARD'));

select ename from emp where ename rlike '^S[A-Z]+H$';

select count(*) from emp
where deptno = 
(select deptno from emp where sal=
(select min(sal) from emp)
);

select * from dept;

select sum(sal),avg(sal) from emp
where deptno=(select deptno from dept where loc='DALLAS');

select ename,sal,comm,sal+comm '총액'
from emp
where comm is not null
order by sal desc;

select ename, sal,
case
	when sal<=1000 then 'LOW'
	when sal<=2000 then 'MIDDLE'
    else 'HIGH'
end as 정도
from emp;

select * from(
select ename, sal,
case
	when sal<=1000 then 'LOW'
	when sal<=2000 then 'MIDDLE'
    else 'HIGH'
end as 정도
from emp) as MY
where 정도='HIGH';

select deptno,avg(sal)
from emp
group by deptno;

select job,avg(sal)
from emp
group by job;

select deptno,job,avg(sal) from emp group by deptno,job;


select job,avg(sal),sum(sal)
from emp
group by job with rollup;

select job,avg(sal),sum(sal)
from emp
group by job with rollup;

select * from emp limit 2;
select mod(10,3);

select ename, empno
from emp
where empno%2=1;

select ename 
from emp
where length(ename)<5;

select regexp_substr('welcome to mysql','^[a-zA-z]{2}');

select ename,
regexp_substr(hiredate,'[1-9]{4}') 사원명,
substr(hiredate,6,2) 입사월 from emp;

select rpad('mysql',20,'#');

select lpad(ename,10,' ') from emp;
select rtrim('     mysql');

select replace('i like mysql','like','love');

select format(123456789,2);

select left('sql tutorial',3);

select ename, concat('\\',format(sal,0)) 월급
from emp;

select now();
select sysdate();

select year('1988-01-12');
select dayofweek(now());

select ename,
case dayofweek(hiledate)
	when 1 then '일요일'
    when 2 then '월요일'
    when 3 then '화요일'
    when 4 then '수요일'
    when 5 then '목요일'
    when 6 then '금요일'
    when 7 then '토요일'
end as '입사 요일'
from emp;