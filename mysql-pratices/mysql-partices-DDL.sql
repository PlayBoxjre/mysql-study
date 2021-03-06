/*
 * 练习题原地址： http://www.cnblogs.com/shiluoliming/p/6625016.html
 * 库名:	student_information
 * 表:
 *	班级表：	class
 * 	学生表：	student
 *	老师表：	teacher
 *	课程表：	course
 *	成绩表：	score
 */
 #创建数据库 
CREATE DATABASE student_information CHARACTER SET utf8 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
# drop table question,student,teacher;
USE student_information;
#创建班级表
CREATE TABLE class (
	cid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '班级编号',
	caption VARCHAR(16) NOT NULL UNIQUE COMMENT '班级名称'
)ENGINE=INNODB AUTO_INCREMENT=0 CHARSET=utf8;
#创建学生表
CREATE TABLE student (
	sid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '学生编号',
	sname VARCHAR(10) NOT NULL DEFAULT '' COMMENT '学生名称',
	gender ENUM('男','女','未知') DEFAULT '未知' COMMENT '姓名',
	class_id INT UNSIGNED NOT NULL COMMENT '班级编号'
)ENGINE=INNODB AUTO_INCREMENT=0 CHARSET=utf8;
#创建老师表
CREATE TABLE teacher (
	tid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '老师编号',
	tname VARCHAR(10) NOT NULL DEFAULT '' COMMENT '老师姓名'
)ENGINE=INNODB AUTO_INCREMENT=0 CHARSET=utf8;
#创建课程表
CREATE TABLE course (
	cid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '课程编号',
	cname VARCHAR(10) NOT NULL UNIQUE COMMENT '课程名称',
	teach_id INT UNSIGNED NOT NULL COMMENT '教师编号'
)ENGINE=INNODB AUTO_INCREMENT=0 CHARSET=utf8;
#创建成绩表
CREATE TABLE score (
	sid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '成绩编号',
	student_id INT UNSIGNED NOT NULL COMMENT '学生编号',
	course_id INT UNSIGNED NOT NULL COMMENT '课程编号',
	number INT UNSIGNED NOT NULL COMMENT '成绩分数'
)ENGINE=INNODB AUTO_INCREMENT=0 CHARSET=utf8;

INSERT INTO class(caption) VALUES('三年二班'),('一年二班'),('三年一班');	# insert data to class
INSERT INTO student(sname,gender,class_id) VALUES('一号学生','男',1),('二号学生','女',1),('三号学生','未知',2);
insert into teacher(tname) values('大波波老师'),('小岛岛老师'),('小苍苍老师');
insert into course (cname,teach_id) values('生物',1),('体育',2),('物理',3);
insert into score(student_id,course_id,number)values(1,1,98),(2,3,88),(3,2,10);
insert into score(student_id,course_id,number) value(1,2,80);
INSERT INTO score(student_id,course_id,number) VALUE(2,1,80);
INSERT INTO score(student_id,course_id,number) VALUE(3,3,78);
INSERT INTO score(student_id,course_id,number) VALUE(3,1,99);

