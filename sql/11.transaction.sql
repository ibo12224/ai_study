create table emp02 as
select * from emp;

create table dept02 as
select * from dept;

-- insert, delete, update 구문 실행 자동확정
-- 확정
-- commit; 
-- 취소
-- rollback
SHOW VARIABLES LIKE 'autocommit';
-- autocommit 옵션 off
set AUTOCOMMIT=0;
set AUTOCOMMIT=1;

delete from dept02;
rollback;

insert into dept02 values(50,'AAA','BBB');
commit;
rollback;
select * from dept02;

delete from dept02 where deptno=40;
savepoint C1;
delete from dept02 where deptno=30;
savepoint C2;
delete from dept02 where deptno=20;
savepoint C3;

rollback TO C1;

select * from dept02;










