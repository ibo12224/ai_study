-- emp 와 동일한 복사본 테이블생성
create table emp01 as
select * from emp;

select * from emp01;

-- 데이터 제외 dept 테이블의 스키마 복사
create table dept01 like dept;

insert into dept01
select * from dept;

select * from dept01;

create table myseq(
	id int auto_increment primary key,
    name varchar(50),
    addr varchar(100)
);

insert into myseq( name, addr) values('홍길동','서울시');
insert into myseq( name, addr) values('이순신','부산시');
select * from myseq;

SET SQL_SAFE_UPDATES = 0;

update emp01 set deptno=21, job='test1' where deptno=20;

-- 모든 직원들의 급여를 10% 인상해라..
update emp01 set sal = sal*1.1;
-- 2분 퀴즈 1981년에 입사한 사원의 입사일을 오늘로 수정하시요
update emp01 set hiredate = date( now() )
where year(hiredate)=1981;

-- 2 분퀴즈: 사원 중 급여가 4000 이상인 사원들의 급여만 500씩 삭감
update emp01 set sal=sal-500 where sal>=4000;

select loc from dept01 where deptno=30;
-- dept01에서 20번 부서의 지역명을 30번 부서의 지역명으로 변경하시요..
update dept01
set loc= ( select loc from (select loc from dept01 where deptno=30 ) as my)
where deptno=20;

-- dept01의 10번 부서의 부서명과 지역명을 40번 부서의 부서명, 지역명으로 변경하시요.
update dept01
set dname=( select dname from (select dname from dept01 where deptno=40 ) as my),
loc= ( select loc from (select loc from dept01 where deptno=40 ) as my)
where deptno = 10;

select * from dept01;
select * from emp01;

-- new york(dept) 에 위치한 부서 소속 사원들의 급여를 1000 인상하시오 (emp01)
update emp01
set sal= sal+1000
where deptno = (select deptno from dept where loc='NEW YORK');

select * from emp01;






