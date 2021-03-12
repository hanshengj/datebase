学校食堂管理系统，包含食堂表，食堂仓口表，仓口收费记录表
drop table if exists canteen;
create table canteen(
id int primary key auto_increment,
name varchar(20)comment '饭堂名'
);
insert into canteen (id,name) values (1,'学生餐厅一'),(2,'学生餐厅二');

drop table if exists canteenofentrance;
create table canteenofentrance(
id int primary key auto_increment,
name varchar(20)comment '窗口名',
canteen_id int,
foreign key (canteen_id) references canteen (id)
);

insert into canteenofentrance (name ,canteen_id) values ('新疆大盘鸡',1),('老杨麻辣烫',1),('山西刀削面',2);

drop table if exists entrancerecord;
create table entrancerecord(
id int primary key auto_increment,
datanime timestamp,
records decimal,
canteenofentrance_id int,
foreign key (canteenofentrance_id) references canteenofentrance (id)
);
 insert into entrancerecord (datanime,records,canteenofentrance_id) values ('2020-10-11 11:40;00',1111,1);
 insert into entrancerecord values (1,'2020-10-11',1111,1);
 
 
 
 车辆违章系统，包含用户表，车辆表，违章信息表。违章信息表中包含用户和车辆的违章信息
 
 drop table if exists cur;
 create table cur(
 id int primary key auto_increment,
 des text comment '描述'
 );
 insert into cur values(8888,'黑色霸道');
 insert into cur (des) values("白色雪佛兰"),("白色凯迪拉克");
 --一个属性时也一定要加括号
 
drop table if exists user;
create table user(
id int primary key auto_increment,
name varchar(20) unique,
car_id int,
foreign key (car_id) references cur (id)
);



insert into user (name,car_id) values ('张三',8888),('李四',8889);
insert into user values ( 1,'张三',1);
--错误的，外键约束
drop table if exists inftable;
create table inftable(
timed timestamp,
----dess text default '超载' comment '违章原因',
--不允许BLOB,TEXT GEOMETRY 或者JSON字段设置默认值
dess text comment '违章原因',
user_id int ,
foreign key (user_id) references cur(id)
);


学校宿舍管理系统，要求包含宿舍信息，学生信息，每日的宿舍查房记录。

drop table if exists schoolcontrol;
create table schoolcontrol(
id int primary key auto_increment,
name varchar(12)
);

drop table if exists dormitory;
create table dormitory(
id int primary key auto_increment,
schoolcontrol_id int,
foreign key (schoolcontrol_id) references schoolcontrol(id)
);

drop table if exists student;
create table student(
id int,
name varchar(10),
dormitory_id int ,
foreign key (dormitory_id) references dormitory(id)
);

考勤系统，包含员工表，考勤记录表
drop table if exists worker;
create table worker(
id int primary key auto_increment,
name varchar(12)unique,
workstart timestamp not null,
salary decimal,
dowork text
);


drop table if exists workrecord;
create table workrecord(
worker_id int,
moring char(1),
check  (moring='Y' or moring='N'),
evening char(1),
check  (evening='Y' or evening='N'),
workday timestamp,
foreign key (worker_id) references worker(id)
);

