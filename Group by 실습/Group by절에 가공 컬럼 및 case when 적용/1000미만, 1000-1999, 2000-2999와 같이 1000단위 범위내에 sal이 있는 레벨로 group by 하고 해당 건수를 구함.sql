select floor(sal/1000)*1000, count(*) from hr.emp
group by floor(sal/1000)*1000;

select *, floor(sal/1000)*1000 as bin_range --, sal/1000, floor(sal/1000)
from hr.emp; 
