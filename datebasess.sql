设计一张老师表，包含以下字段：姓名、年龄、身高、体重、性别、学历、生日、身份证号

mysql> create table teachers(
    -> name varchar(20),
    -> age varchar(20),
    -> high decimal(5,2),
    -> weight int,
    -> sex varchar(1) comment '性别',
    -> grade varchar(40) comment '学历',
    -> birthday timestamp,
    -> card_id varchar(20)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> show teachers;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'teachers' at line 1
mysql> desc teachers;
+----------+--------------+------+-----+-------------------+-----------------------------+
| Field    | Type         | Null | Key | Default           | Extra                       |
+----------+--------------+------+-----+-------------------+-----------------------------+
| name     | varchar(20)  | YES  |     | NULL              |                             |
| age      | varchar(20)  | YES  |     | NULL              |                             |
| high     | decimal(5,2) | YES  |     | NULL              |                             |
| weight   | int(11)      | YES  |     | NULL              |                             |
| sex      | varchar(1)   | YES  |     | NULL              |                             |
| grade    | varchar(40)  | YES  |     | NULL              |                             |
| birthday | timestamp    | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
| card_id  | varchar(20)  | YES  |     | NULL              |                             |
+----------+--------------+------+-----+-------------------+-----------------------------+
8 rows in set (0.00 sec)

设计一张商品表，包含以下字段：商品名称、商品价格、商品库存、商品描述
mysql> drop table if  exists goods;
Query OK, 0 rows affected (0.01 sec)

mysql> create table goods(
    -> goods_id int,
    -> goods_name varchar(20),
    -> unitprice decimal(11,4),
    -> goodslibary varchar(20),
    -> introduce text
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> desc doods;
ERROR 1146 (42S02): Table 'student.doods' doesn't exist
mysql> desc goods;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| goods_id    | int(11)       | YES  |     | NULL    |       |
| goods_name  | varchar(20)   | YES  |     | NULL    |       |
| unitprice   | decimal(11,4) | YES  |     | NULL    |       |
| goodslibary | varchar(20)   | YES  |     | NULL    |       |
| introduce   | text          | YES  |     | NULL    |       |
+-------------+---------------+------+-----+---------+-------+
5 rows in set (0.00 sec)