with
temp_01 as (
select a.*
	  , to_char(hiredate, 'yyyy-mm-dd') as hiredate_str
from hr.emp a
)
select empno, ename, hiredate, hiredate_str
	, to_date(hiredate_str, 'yyyy-mm-dd') as hiredate_01
	, to_timestamp(hiredate_str, 'yyyy-mm-dd') as hiretime_01
	--, to_timestamp(hiredate_str, 'yyyy-mm-dd hh24:mi:ss') as hiretime_02
	, to_char(hiredate, 'yyyymmdd hh24:mi:ss') as hiredate_str_01
	, to_char(hiredate, 'month dd yyyy') as hiredate_str_02
	, to_char(hiredate, 'MONTH dd yyyy') as hiredate_str_03
	, to_char(hiredate, 'yyyy month') as hiredate_str_04
	-- w 는 해당 달의 week, d는 일요일(1) 부터 토요일(7)
	, to_char(hiredate, 'MONTH w d') as hiredate_str_05
	-- day는 요일을 문자열로 나타냄. 
	, to_char(hiredate, 'Month, Day') as hiredate_str_06
from temp_01;

--2번째 코드
with
temp_01 as (
select a.*
	  , to_char(hiredate, 'yyyy-mm-dd') as hire_date_str
	  , hiredate::timestamp as hiretime
from hr.emp a
)
select empno, ename, hiredate, hire_date_str, hiretime
	, to_char(hiretime, 'yyyy/mm/dd hh24:mi:ss') as hiretime_01
	, to_char(hiretime, 'yyyy/mm/dd PM hh12:mi:ss') as hiretime_02
	, to_timestamp('2022-03-04 22:10:15', 'yyyy-mm-dd hh24:mi:ss') as timestamp_01
	, to_char(to_timestamp('2022-03-04 22:10:15', 'yyyy-mm-dd hh24:mi:ss'), 'yyyy/mm/dd AM hh12:mi:ss') as timestr_01
from temp_01;  
