给定下表，请完成操作

DROP TABLE IF EXISTS exam_result2; 
CREATE TABLE exam_result2 ( 
id INT, 
name VARCHAR(20),
 chinese DECIMAL(3,1),
 math DECIMAL(3,1), 
english DECIMAL(3,1),
 qq_mail varchar(20)
 );
INSERT INTO exam_result2 (id,name, chinese, math, english,qq_mail) VALUES (1,'唐三藏', 67, 98, 56,'1231@qq.com'),
 (2,'孙悟空', 87.5, 78, 77,'1232@qq.com'), 
(3,'猪悟能', 88, 98, 90,'1233@qq.com'), 
(4,'曹孟德', 82, 84, 67,NULL), 
(5,'刘玄德', 55.5, 85, 45,'1234@qq.com'),
 (6,'孙权', 70, 73, 78.5,'12345@qq.com'), 
(7,'宋公明', 75, 65, 30,'12346@qq.com');


-- 查询英语不及格的同学及英语成绩 ( < 60 ) 
-- 查询语文成绩好于英语成绩的同学
 -- 查询总分在 200 分以下的同学
 -- 查询语文成绩大于80分，且英语成绩大于80分的同学
 -- 查询语文成绩在 [80, 90] 分的同学及语文成绩
 -- 查询数学成绩是 58 或者 59 或者 98 或者 99 分的同学 及数学成绩 
-- 查询 qq_mail 已知的同学姓名


解：
-- 查询英语不及格的同学及英语成绩 ( < 60 )
select id,name,english from exam_result where english < 60; 
-- 查询语文成绩好于英语成绩的同学 
select id,name,english from exam_result where chinese > english ; 
-- 查询总分在 200 分以下的同学 where 条件后面 不可以使 用别名 
select id,name,chinese+english+math total from exam_result where chinese+english+math < 200 ; 
-- 查询语文成绩大于80分，且英语成绩大于80分的同学 
select id,name,english,chinese from exam_result where chinese > 80 and english > 80 ;
 -- 查询语文成绩在 [80, 90] 分的同学及语文成绩 
select id,name,chinese from exam_result where chinese >= 80 and chinese <= 90 ; 
select id,name,chinese from exam_result where chinese between 80 and 90 ; 
-- 查询数学成绩是 58 或者 59 或者 98 或者 99 分的同学及 数学成绩 
select id,name,chinese from exam_result where math in(58,59,98,99) ;
 -- 查询 qq_mail 已知的同学姓名 
select * from exam_result where qq_mail is not NULL;