-- Using the assignment Schema and allowing updates
create schema `assignment`;
use assignment;
SET SQL_SAFE_UPDATES = 0;
-- Checking created tables after importing from csv :Pending are everything basically
show tables;

-- Checking structure of created table
desc bajaj_auto;
desc eicher_motors;
desc hero_motocorp;
desc infosys;
desc tcs;
desc tvs_motors;
-- Checking Data stored in table
select * from bajaj_auto;
select * from eicher_motors;
select * from hero_motocorp;
select * from infosys;
select * from tcs;
select * from tvs_motors;
-- Function to get  date as number
DELIMITER $$
create function get_date(file_date varchar(20))
returns  varchar(2) deterministic
BEGIN 
declare format_date varchar(2);
if file_date='January' then
	set format_date= '1';
elseif  file_date='February' then
	set format_date= '2';
elseif file_date='March' then
	set format_date= '3';
elseif file_date='April' then
	set format_date= '4';
elseif  file_date='May' then
	set format_date= '5';
elseif file_date='June' then
	set format_date= '6';
elseif file_date='July' then
	set format_date= '7';
elseif  file_date='August' then
	set format_date= '8';
elseif file_date='September' then
	set format_date='9';
elseif file_date='October' then
	set format_date='10';
elseif  file_date='November' then
	set format_date= '11';
else
	set format_date= '12';
end if;
return format_date;
END $$

-- Function to get Month name from Date
DELIMITER $$
create function getmonth(date varchar(20))
returns varchar(20) deterministic
BEGIN
return (select SUBSTRING_INDEX(SUBSTRING_INDEX(Date,'-',2),'-',-1));
END $$
DELIMITER ;


-- Updating Values of Dates according to given format 
 update bajaj_auto
 set Date=(select replace(Date,getmonth(Date),get_date(getmonth(Date))));
 
 update eicher_motors
 set Date=(select replace(Date,getmonth(Date),get_date(getmonth(Date))));
 
 update hero_motocorp
 set Date=(select replace(Date,getmonth(Date),get_date(getmonth(Date))));
 
 update infosys
 set Date=(select replace(Date,getmonth(Date),get_date(getmonth(Date))));
 
 update tcs
 set Date=(select replace(Date,getmonth(Date),get_date(getmonth(Date))));
 
  update tvs_motors
 set Date=(select replace(Date,getmonth(Date),get_date(getmonth(Date))));
 
-- Update Values of Dates to be taken with str_to_date function and convert to date 
 
update bajaj_auto
set `Date`=  str_to_date(`Date`,'%d-%m-%Y');
alter table bajaj_auto
modify `Date` date ;

update eicher_motors
set `Date`=  str_to_date(`Date`,'%d-%m-%Y');
alter table eicher_motors
modify `Date` date ;

update hero_motocorp
set `Date`=  str_to_date(`Date`,'%d-%m-%Y');
alter table hero_motocorp
modify `Date` date ;

update infosys
set `Date`=  str_to_date(`Date`,'%d-%m-%Y');
alter table infosys
modify `Date` date ;

update tcs
set `Date`=  str_to_date(`Date`,'%d-%m-%Y');
alter table tcs
modify `Date` date ;

update tvs_motors
set `Date`=  str_to_date(`Date`,'%d-%m-%Y');
alter table tvs_motors
modify `Date` date ;

-- TASK 1 :Start
-- Create table bajaj1
create table bajaj1 as
	select `Date`,`Close Price`,
avg(`Close Price`) over(order by `Date` rows between 19 preceding and current row) as '20 Day MA',
avg(`Close Price`) over(order by `Date` rows between 49 preceding and current row) as '50 Day MA'
 from bajaj_auto;
 
 -- Create table eicher1
 create table eicher1 as
	select `Date`,`Close Price`,
avg(`Close Price`) over(order by `Date` rows between 19 preceding and current row) as '20 Day MA',
avg(`Close Price`) over(order by `Date` rows between 49 preceding and current row) as '50 Day MA'
 from eicher_motors;
 
 -- Create table hero1
 create table hero1 as
	select `Date`,`Close Price`,
avg(`Close Price`) over(order by `Date` rows between 19 preceding and current row) as '20 Day MA',
avg(`Close Price`) over(order by `Date` rows between 49 preceding and current row) as '50 Day MA'
 from hero_motocorp;
 
 -- Create table infosys1
 Create table infosys1
 select `Date`,`Close price`,
 avg(`Close price`) over(order by `Date` rows  between 19 preceding and current row) as '20 Day MA',
 avg(`Close price`) over(order by `Date` rows  between 49 preceding and current row) as '50 Day MA'
 from infosys;
 
 -- Create table tcs1
 Create table tcs1
 select `Date`,`Close price`,
 avg(`Close price`) over(order by `Date` rows  between 19 preceding and current row) as '20 Day MA',
 avg(`Close price`) over(order by `Date` rows  between 49 preceding and current row) as '50 Day MA'
 from tcs;
 
 -- Create table tvs1
 Create table tvs1
 select `Date`,`Close price`,
 avg(`Close price`) over(order by `Date` rows  between 19 preceding and current row) as '20 Day MA',
 avg(`Close price`) over(order by `Date` rows  between 49 preceding and current row) as '50 Day MA'
 from tvs_motors;
 
 -- Making first 19 rows NULL as moving average can't be calculated
 update bajaj1
 set `20 Day MA` = NULL limit 19;
 
 update eicher1
 set `20 Day MA` = NULL limit 19;
 
 update hero1
 set `20 Day MA` = NULL limit 19;
 
 update infosys1
 set `20 Day MA` = NULL limit 19;
 
 update tcs1
 set `20 Day MA` = NULL limit 19;
 
 update tvs1
 set `20 Day MA` = NULL limit 19;
 
 -- Making first 49 rows NULL as moving average can't be calculated
 update bajaj1
 set `50 Day MA` = NULL limit 49;
 
 update eicher1
 set `50 Day MA` = NULL limit 49;
 
 update hero1
 set `50 Day MA` = NULL limit 49;
    
 update infosys1
 set `50 Day MA` = NULL limit 49;
 
 update tcs1
 set `50 Day MA` = NULL limit 49;
 
 update tvs1
 set `50 Day MA` = NULL limit 49;
 
 -- Checking Data
 select * from bajaj1;
 select * from eicher1;
 select * from hero1;
 select * from infosys1;
 select * from tcs1;
 select * from tvs1;
 
 -- Task 1 :End
 
 
 -- Task 2 :Start
 -- Create master_stock_info table
 
 create table master_stock_info
 select tcs.`Date`,b.`Close price` as 'Bajaj',
 tcs.`Close price` as 'TCS' ,tvs.`Close price` as 'TVS',
 i.`Close price` as 'Infosys',e.`Close price` as 'Eicher',
 h.`Close price` as 'Hero'
 from tcs  inner join eicher_motors e on e.`Date`=tcs.`Date`
 inner join  tvs_motors tvs on tvs.`Date`= tcs.`Date`
 inner join  hero_motocorp h on h.`Date` = tcs.`Date`
 inner join  bajaj_auto b on b.`Date`=tcs.`Date`
 inner join  infosys i on i.`Date`=tcs.`Date` order by tcs.`Date`;
 
 -- Display data from master_stock_info
 select * from master_stock_info;
 -- Task 2 :End 
 
 -- Task 3 : Start
 
 -- create table bajaj2
create table bajaj2
 select `Date`,`Close price`,
 case 
 when `50 Day MA` is NULL then 'NA'
 when `20 Day MA`>`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))<(lag(`50 Day MA`,1) over(order by `Date`))) then 'BUY'
 when `20 Day MA`<`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))>(lag(`50 Day MA`,1) over(order by `Date`))) then 'SELL'
 else 'HOLD' 
 end as `Signal`
 from bajaj1 ;
 
 -- create table eicher2 
 create table eicher2
 select `Date`,`Close price`,
 case 
 when `50 Day MA` is NULL then 'NA'
 when `20 Day MA`>`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))<(lag(`50 Day MA`,1) over(order by `Date`))) then 'BUY'
 when `20 Day MA`<`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))>(lag(`50 Day MA`,1) over(order by `Date`))) then 'SELL'
 else 'HOLD' 
 end as `Signal`
 from eicher1;
 
 -- create table tcs2
 create table tcs2
 select `Date`,`Close price`,
 case 
 when `50 Day MA` is NULL then 'NA'
 when `20 Day MA`>`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))<(lag(`50 Day MA`,1) over(order by `Date`))) then 'BUY'
 when `20 Day MA`<`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))>(lag(`50 Day MA`,1) over(order by `Date`))) then 'SELL'
 else 'HOLD' 
 end as `Signal`
 from tcs1 ;
 
 -- create table tvs2
 create table tvs2
 select `Date`,`Close price`,
 case 
 when `50 Day MA` is NULL then 'NA'
 when `20 Day MA`>`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))<(lag(`50 Day MA`,1) over(order by `Date`))) then 'BUY'
 when `20 Day MA`<`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))>(lag(`50 Day MA`,1) over(order by `Date`))) then 'SELL'
 else 'HOLD' 
 end as `Signal`
 from tvs1 ;
 
 -- create table hero2
 create table hero2
 select `Date`,`Close price`,
 case 
 when `50 Day MA` is NULL then 'NA'
 when `20 Day MA`>`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))<(lag(`50 Day MA`,1) over(order by `Date`))) then 'BUY'
 when `20 Day MA`<`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))>(lag(`50 Day MA`,1) over(order by `Date`))) then 'SELL'
 else 'HOLD' 
 end as `Signal`
 from hero1 ;
 
 -- create  table infosys2
 create table infosys2
 select `Date`,`Close price`,
 case 
 when `50 Day MA` is NULL then 'NA'
 when `20 Day MA`>`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))<(lag(`50 Day MA`,1) over(order by `Date`))) then 'BUY'
 when `20 Day MA`<`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))>(lag(`50 Day MA`,1) over(order by `Date`))) then 'SELL'
 else 'HOLD' 
 end as `Signal`
 from infosys1 ;
 
 -- Checking Data
 
 select * from bajaj2;
 select * from eicher2;
 select * from hero2;
 select * from infosys2;
 select * from tcs2;
 select * from tvs2;
 
 -- Task 3 :End
 
 
 -- Task 4 Start
 DELIMITER $$
 create function get_signal(signal_date date)
 returns varchar(20) deterministic
 BEGIN
 return (select `Signal` from bajaj2 where bajaj2.`Date` = signal_date);
 END $$
 
 -- testing of function 
  DELIMITER ;
 select get_signal(`Date`),`Date` as 'Signal' from bajaj_auto;
 select get_signal('2018-06-21');
 -- Expected output  BUY , actual output BUY ->Pass 
 select get_signal('2018-05-29');
 -- Expected output SELL, actual output SELL ->Pass
 select get_signal('2018-05-30');
 -- Expected output HOLD, actual output HOLD ->Pass
 select get_signal('2015-01-01');
 -- Expected output NA, actual output NA ->Pass
 
 -- Task 4 End 
 
 -- Task 5 analysis
 -- Getting the number of times bought and sold
 
 select count(*) from bajaj2 where `Signal`='SELL';
 select count(*) from bajaj2 where `Signal`='BUY';
 
 select * from bajaj2 where `Signal`='BUY' or `Signal`='SELL';
 
 select * from tcs2 where `Signal`='BUY' or `Signal`='SELL';
 select count(*) from tcs2 where `Signal`='SELL';
 
 select * from eicher2 where `Signal`='BUY' or `Signal`='SELL';
 select count(*) from eicher2 where `Signal`='SELL';
  select count(*) from eicher2 where `Signal`='BUY';
  
   select * from tvs2 where `Signal`='BUY' or `Signal`='SELL';
 select count(*) from tvs2 where `Signal`='SELL';
  select count(*) from tvs2 where `Signal`='BUY';
  
     select * from hero2 where `Signal`='BUY' or `Signal`='SELL';
 select count(*) from hero2 where `Signal`='SELL';
  select count(*) from hero2 where `Signal`='BUY';
  
    select * from infosys2 where `Signal`='BUY' or `Signal`='SELL';
 select count(*) from infosys2 where `Signal`='SELL';
  select count(*) from infosys2 where `Signal`='BUY';
 
 -- Getting the trend
 select (select `Close price` from bajaj_auto  order by `Date` desc limit 1) - (select `Close price` from bajaj_auto  order by `Date`  limit 1) as 'Trend';
 
 select (select `Close price` from tcs  order by `Date` desc limit 1) - (select `Close price` from tcs  order by `Date`  limit 1) as 'Trend';
 
 select (select `Close price` from eicher_motors  order by `Date` desc limit 1) - (select `Close price` from eicher_motors  order by `Date`  limit 1) as 'Trend';
 
 select (select `Close price` from tvs_motors  order by `Date` desc limit 1) - (select `Close price` from tvs_motors  order by `Date`  limit 1) as 'Trend';
 
 select (select `Close price` from infosys  order by `Date` desc limit 1) - (select `Close price` from infosys  order by `Date`  limit 1) as 'Trend';
 
 
 