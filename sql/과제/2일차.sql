SELECT * FROM test.births;
-- 1.ALLEN과 부서가 같은 사원들의 사원명, 입사일을 출력하되 높은 급여순으로 출력하세요.
select ename,hiredate
from emp
where DEPTNO=(
select deptno
from emp
where ename='ALLEN')
order by sal desc;

-- 2.가장 높은 급여를 받는 사원보다 입사일이 늦은 사원의 이름, 입사일을 출력하세요.
select ename, hiredate
from emp
where hiredate>
(select hiredate
from emp
where sal=(
select max(sal)
from emp));


-- 3.FORD 보다 입사일이 늦은 사원 중 급여가 가장 높은 사원의 이름과 급여를 출력하세요.
SELECT ename, sal
FROM emp
WHERE hiredate > (
    SELECT hiredate 
    FROM emp
    WHERE ename = 'FORD'
)
ORDER BY sal DESC
LIMIT 1;
/*
select e.emp,e.sal
from emp e
join emp f on e.hiredate>f.hiredate
where f.ename='FORD'
ORDER BY e.sal DESC
LIMIT 1;
*/


-- 4.이름에 "T"자가 들어가는 사원들의 급여의 합을 구하세요.
select sum(sal)
from emp
where ename like '%T%';

-- 5.이름에 "S" 자가 들어가는 사원들 중 급여가 가장 높은 사원의 이름,급여를 출력하세요.
select ename, sal
from emp
where ename like '%S%'
order by sal desc
limit 1;

-- 6.모든 사원의 평균급여를 구하세요.
select avg(sal)
from emp;

-- 7. 20번 부서의 최고 급여보다 많은 사원의 사원번호,사원명,급여를 출력하세요.
select empno,ename,sal
from emp
where sal>(
select max(sal)
from emp
where deptno=20);

-- 8. SALES(영업부) 부서에서 근무하는 모든 사원의 이름과 급여를 출력하시오.
select ename,sal
from emp
where deptno=(
select deptno
from dept
where dname='SALES');

-- 9.직속상관이 KING인 사원의 이름과 급여를 출력하시오. 
select ename, sal
from emp
where mgr=(
select empno
from emp
where ename='KING');

-- 10.상반기(1월~ 6월) 입사한 사원의 이름 과 입사일을 구하시요.
select ename,hiredate
from emp
where month(hiredate)<7;

-- 11. 홀수 년도에 입사한 사원의 이름 과 입사일을 구하시요.
select ename,hiredate
from emp
where year(HIREDATE)%2=1;

-- --------------------births. sql 을 이용한 문제
-- 12. 2000년대 이후 출생한 남아수, 여아수를 출력하시요
select boys 남아수,girls 여아수
from births
where year>=2000;

-- 13.  2000년대 이후 출생한 남아수, 여아수, 남아율(%) 을 출력하시요		
select boys 남아수,girls 여아수,boys/(boys+girls) 남아율
from births
where year>=2000;

-- 14. 남아수가 가장많은 년도, 남아수를 구하시요.
select year 년도,boys 남아수
from births
order by boys desc
limit 1;

-- 15. 2000 년대이후 남아수가 50000 이상이면 '많음' '적음' 으로 정도 컬럼을 표시하시요
select year,
	case 
		when boys>50000 then '많음'
        else '적음'
	end as '남아수'
from births
where year>=2000;