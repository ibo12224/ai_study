-- https://dev.mysql.com/doc/refman/8.4/en/numeric-functions.html

select 10%3;
select mod(10,3);
select empno, mod(empno,2) from emp;
-- 사번이 홀수인 사원이름과 사번을 보여주시요.
select ename,empno from emp where empno%2=1;
select ename,empno from emp where empno%2!=0;
select ename,empno from emp where mod(empno,2)=1;

select * from 
(select empno, mod(empno,2) 사번 from emp) as MY
where 사번=1;

select -10, abs(-10);
select 34.5678, floor( 34.5678 );
select 34.5678, ceil( 34.5678 );
select 34.5678, round( 34.5678 );
select 34.5678, round( 34.5678 ,2 );
select 34.5678, round( 34.5678 ,-1 );
select 34.5678, truncate( 34.5678 ,2 );
select pow( 3,2 );

-- https://dev.mysql.com/doc/refman/8.4/en/string-functions.html
select 'MySql', upper('MySql');
select 'MySql', lower('MySql');

select ename, lower(ename) from emp;

-- C:\ProgramData\MySQL\MySQL Server 8.0
-- my.ini  
-- lower_case_table_names=0
-- 대소문자 구분한다.
select ename from emp where ename='smith';
-- 표준
select ename from emp where ename= upper('smith');
select 'MySql', length('MySql');

-- 사원이름 글자수가 4글자 이하인 직원을 검색하시요.
select ename from emp where length(ename)<=4;
-- substr(문자열,위치,갯수)
-- substr(문자열,위치)
-- substring(문자열,위치)
select substr( 'welcome to mysql', 4,3);
select substr( 'welcome to mysql', 4,4);
select substr( 'welcome to mysql', -3,2);
select substr( 'welcome to mysql', 2);
select substring( 'welcome to mysql', 2);
-- 사원이름의 앞 두글자를 출력하시요.
select substr( ename, 1,2) from emp;

select regexp_substr('welcome to mysql', '^[a-zA-Z]{2}');
select regexp_substr('welcome to mysql', '^[a-z]{2}');
select regexp_substr('welcome to mysql', '^[a-z]{2}');
select regexp_substr('welcome to mysql', 'c[a-z]+');
-- 퀴즈 사원들의 입사 년도 와 월 출력하시요.(사원명, 입사년도,입사월)
select 
ename, substr(hiredate,1,4) 입사년도,substr(hiredate,6,2) 월 
from emp;


# instr('문자열', '찾을문자열') 2번인자 문자열의 위치값
# locate('찻을문자열''문자열',시작위치 ) 2번인자 문자열의 위치값
select instr( 'welcome to mysql', 'm');
select instr( 'welcome to mysql', 'my');
select locate( 'm', 'welcome to mysql');
select locate( 'm', 'welcome to mysql', 7);
## lpad('문자열', 칸의수, '채울문자열')
select lpad('mysql', 20, '#');
select rpad('mysql', 20, '#');
select lpad(ename, 10,' ') from emp;
select ltrim('    mysql');
select rtrim('mysql    ');
select trim('              mysql                    ');
select trim( '-' from '-------mysql---------------');
select ename, trim(ename) from emp;

select replace('i like mysql' , 'like', 'love');

select regexp_replace( '33aa22bb', '[0-9]', '');
select regexp_replace( '##my--sql__33', '[0-9#_-]', '');
select regexp_replace('i like program like phone','phone|program','hi');
select regexp_replace('i like program like phone','p[a-z]+','hi');

select left('sql tutorial', 3);
select right('sql tutorial', 3);

select format(123456789, 0);
select format(123456789, 2);
-- 사원이름과 급여를 천단위 표시 로 출력하시요
select ename, format( sal,0) from emp;
select ename, concat( '\\', format( sal,0) ) from emp;

-- 날짜관련함수
-- https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html
select now();
select sysdate();
select year( '1988-01-12' );
select ename, 
	year( hiredate), month(hiredate),day(hiredate) 
from emp;
select year( now() );
select hour( now() ), minute( now() ), second( now());
-- 1=sunday, 2=monday, ... 7=saturday
select dayofweek(now());
-- 사원이름과  입사 요일(월화,...)을 구하시요

select ename, 
case dayofweek(hiredate)
	when 1 then '일'
    when 2 then '월'
    when 3 then '화'
    when 4 then '수'
    when 5 then '목'
    when 6 then '금'
    when 7 then '토'
end as 입사요일
from emp;


