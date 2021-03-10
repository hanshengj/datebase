drop table if exists student; 
create table student( 
id int PRIMARY KEY AUTO_INCREMENT,
 sn int unique, 
name varchar(20) NOT NULL,
 qq_mail varchar(20) DEFAULT '110@qq.com'
 );

drop table if exists classes;
 create table classes(
 id int PRIMARY KEY AUTO_INCREMENT, 
name varchar(20),
 `desc` varchar(30)
 );
drop table if exists student;
 create table student(
 id int PRIMARY KEY AUTO_INCREMENT,
 sn int unique, 
name varchar(20) NOT NULL,
qq_mail varchar(20) DEFAULT '110@qq.com' ,
classes_id int, 
FOREIGN KEY (classes_id) REFERENCES classes(id) 
); 