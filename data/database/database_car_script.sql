create database carshopping;
use carshopping;
ALTER DATABASE carshopping CHARACTER SET utf8 COLLATE utf8_general_ci;
create table person(
		id 	int  primary key auto_increment,
        first_name varchar(15),
        last_name varchar(10),
        gender char(1),
        date_of_birth date,
        phone_number bigint unique,
        address varchar(50)
        );
create table person_account(
		id char(8) references person(id),
        user_name char(15) unique,
        pass_word char(15) unique,
        balance int 
        );
create table car(
		id char(8) primary key,
        name_car varchar(20),
        price int ,
        name_brand varchar(15),
        country varchar(15),
        amount smallint
        );

create table Orders(
		id_order char(10) primary key,
        id_customer char(8) references person(id),
        id_car char(8) references car(id),
        buying_time date,
        amount smallint
        );
create table denomination(
	id_denomi char(2) primary key,
    money int default 0
);
create table moneycard(
	id_car int auto_increment primary key,
	carcode varchar(10) unique,
    id_denomi char(2) references denomination(id_denomi),
    amount smallint
);
insert into person values(1,'hoanglinh','nguyen','kien giang',123),(2,'thuy lieu','bui','kien giang',124);
insert into person_account values(1,'linh','linh123'),(2,'lieu','lieu123');
insert into brand values('m1','mercides','unknown');
show  fields from person ;
alter table person add date_of_birth date after last_name;
alter table person add gender char(1) after last_name;
alter table person modify gender char(1) default 'M';
alter table person modify id int auto_increment;
alter table Orders modify id_order int  auto_increment;
#edit table car
alter table car add name_brand varchar(15) after amount ;
alter table car add country varchar(15) after name_brand;
alter table car drop id_brand;
# edit table person account
alter table person_account modify id int auto_increment primary key;
insert into person_account values(12,'hoanglinh','linh123');
#a
delimiter &&
create function getIdAccount(username char(15))
returns int
DETERMINISTIC
begin 
declare x int;
set x = (select id from person_account where username = person_account.user_name);
return x;
end&&
drop function getIdAccount;
select getIdAccount('linh');
#modify car
select *  from car;
insert into car(name_car,price,amount,name_brand,country) values('2 series',36895,10,'bmw','germany');
insert into car(name_car,price,amount,name_brand,country) values('i8',148495,20,'bmw','germany'),('a3',34295,10,'audi','germany');
/*
e-tron,66994,5,audi,germany
blazer,29995,10,chevrolet,america
corvette,59995,16,chevrolet,america
488,33750,3,ferrari,Italia
sf90 Stradale,628750,2,ferrari,Italia
corolla hatchpack,21560,50,toyota,Japan
avalon,36870,25,toyota,Japan
*/
insert into car(name_car,price,amount,name_brand,country) values('e-tron',66994,5,'audi','germany'),('blazer',29995,10,'chevrolet','america'),
('corvette',59995,16,'chevrolet','america'),('488',33750,3,'ferrari','Italia'),('sf90 Stradale',628750,2,'ferrari','Italia'),('corolla hatchpack',21560,50,'toyota','Japan'),
('avalon',36870,25,'toyota','Japan');

#create find car
delimiter &&
create procedure findCar(namecar varchar(20))
begin
	declare regex varchar(22);
    set regex =  concat("%",namecar,"%");
	select * from car where name_car like regex;
end&&
drop procedure findCar;
call findCar("seri");
#add total column to orders table
alter table orders add total int after amount;

# add default balance of account table
ALTER TABLE `carshopping`.`person_account` 
CHANGE COLUMN `balance` `balance` INT(11) NULL DEFAULT 0 ;

#create valid Login 
delimiter ??
create function isValidAccount(uN char(15),pW char(15))
returns boolean
DETERMINISTIC
begin 
	declare countAccount int ;
	set countAccount = (select count(*) from person_account where user_name = uN and pW = pass_Word );
	if(countAccount =1 )
		then 
        return true;
        else 
        return false;
	end if;

end??
select getIdAccount isValidAccount('linh','linh123') as 'isvalid';
insert into person_account(user_name,pass_word) values('linh','linh123');
insert into person values(1,'Hoang Linh','Nguyen','M','2000/01/01',03547,'Giong Rieng, Kien Giang');	
select getIdAccount('linh');
select * from person inner join person_account on person.id = person_account.id;
select * from person;
#create updateAmout 
DELIMITER $$
CREATE PROCEDURE `updateAmountCar` ( id int ,minusAmount smallint)
BEGIN
	declare x int ;
    set x = (select amount from car where car.id_car = id);
    set x  = x - minusAmount;
    update car set amount = x where car.id_car = id;
END$$
drop procedure updateAmountCar;
call updateAmountCar(1,5);
#
delimiter $$
create procedure showHistoryBuyingCustomer(id_customer int )
begin 
	if(id_customer = -1)
    then
		select id_order,car.id_car,car.name_car,person.id,person.first_name,orders.buying_time,person.last_name,orders.amount,orders.total 
		from ((orders inner join car on orders.id_car = car.id_car)  
		inner join person on orders.id_customer =  person.id);
    else 
		select id_order,car.id_car,car.name_car,person.id,person.first_name,person.last_name,orders.buying_time,orders.amount,orders.total 
		from ((orders inner join car on orders.id_car = car.id_car)  
		inner join person on orders.id_customer =  person.id)
		where orders.id_customer = id_customer;
    end if;
end$$
drop procedure showHistoryBuyingCustomer;
call showHistoryBuyingCustomer(-1);
# add function isHasProfile : person contains information from person_account
delimiter $$
create function isHasProfile(id_customer int)
returns boolean
deterministic
begin
	declare isHas int;
    set isHas = (select count(*) from person inner join person_account on person.id = person_account.id where person_account.id = id_customer) ;
    if(isHas > 0)
		then
			return true;
	else 
		return false;
    end if;
end $$
select isHasProfile(5) as has;
#create minusmoney
delimiter $$
create procedure minusMoney(id_customer int,money int)
begin 
	declare  currentMoney int ;
    set currentMoney = (select balance from person_account where person_account.id= id_customer);
    set currentMoney = currentMoney - money;
    update person_account set balance = currentMoney where id = id_customer;
end$$
call minusMoney(3,2000);
#test currentMoney greater than minusmoney
delimiter $$
CREATE FUNCTION `isHaveEnoughMoney` ( id_customer int, minusMoney int)
RETURNS boolean
deterministic
BEGIN
	declare currentMoney int ;
    set currentMoney = (select balance from person_account where person_account.id= id_customer);
    if(currentMoney >= minusMoney)
		then 
        return true;
        else 
        return false;
	end if;
END$$
select isHaveEnoughMoney(3,2000) as isEnough;
update person_account set balance = 3000;
##
delimiter $$
CREATE FUNCTION `getBalanceAccount` (username char(15))
RETURNS int
deterministic
BEGIN
	declare balance  int ;
    set balance = (select balance from person_account where person_account.user_name in(username));
RETURN  balance;
END$$
select getBalanceAccount('linh') as balance;
drop function getBalanceAccount;
###########################
delimiter $$
CREATE PROCEDURE `addMoney` (id_account int , carcode varchar(10))
BEGIN
	declare price int ;
    declare currentAmount int;
    set price = (select denomination.money from 
						denomination inner join moneycard 
                        on denomination.id_denomi = moneycard.id_denomi
                        where 
                        moneycard.carcode = carcode
                );
	if(price is null)
    then 
		set price = 0;
	end if;
    set currentAmount = (select amount from moneycard where carcode = moneycard.carcode);
    if(currentAmount = 0)
		then
        select "amout do not enough Please add amount to money car " as 'error';
        else 
        begin
			update person_account set balance = (person_account.balance + price) where id = id_account ;
			update moneycard set amount = amount -1 where carcode = moneycard.carcode;
		end;
        end if;
END$$
call addMoney(7,'Card123');moneycard
drop procedure addMoney;
update person set role = 'a' where id = 4;
############################
delimiter $$
CREATE FUNCTION `getAmountMoneyCard` (cardCode varchar(10))
RETURNS int
deterministic
BEGIN
return (select amount from moneycard where carcode = cardCode);
END$$
select getAmountMoneyCard('Card345');
drop function getAmoutMoneyCard;