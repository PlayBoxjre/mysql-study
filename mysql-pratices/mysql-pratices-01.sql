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
 
 USE student_information;
 
# 获取所有生物课程的 学号和成绩
SELECT cid FROM course WHERE cname = '生物';
SELECT sid FROM 
	(SELECT student_id AS sid ,number,sw.cname FROM 
		(SELECT cid,cname FROM course WHERE cname = '生物') AS sw,score
	WHERE score.course_id = sw.cid) AS sw_score,
	(SELECT student_id AS wsid,number,wl.cname FROM 
		(SELECT cid,cname FROM course WHERE cname = '物理') AS wl,score
	WHERE score.course_id = wl.cid) AS wl_score
WHERE sw_score.sid = wl_score.wsid AND sw_score.number > wl_score.number;

SELECT score.student_id,stu.sname ,score.course_id,cr.cname,number FROM score LEFT JOIN student stu ON score.student_id = stu.sid  LEFT JOIN course cr ON score.course_id = cr.cid;

SELECT * FROM score ORDER BY student_id;