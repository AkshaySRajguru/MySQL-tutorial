select firstName from employees order by firstName limit 5;
/*
Andy
Anthony
Barry
Diane
Foon Yue
*/
select firstName from employees order by firstName desc limit 5;
/*
Yoshimi
William
Tom
Steve
Peter
*/
select t.firstName from (select firstName from employees order by firstName limit 5) as t order by firstName desc;
/* 
Foon Yue
Diane
Barry
Anthony
Andy
*/
