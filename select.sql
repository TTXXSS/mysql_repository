# 1.查询同时存在1课程和2课程的情况
SELECT * FROM (SELECT * FROM  student_course sc WHERE sc.courseId=1) AS biao01,
(SELECT * FROM  student_course sc2 WHERE sc2.courseId=2) AS biao02 WHERE
 biao01.studentId = biao02.studentId;
# 2.查询同时存在1课程和2课程的情况
select * from student_course sc1 where sc1.courseId=1 and
sc1.studentId in(select studentId from student_course sc2 where sc2.courseId=2);
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select id,name,sc1.score from student,(select studentId,avg(score) score from student_course 
group by studentId having avg(score)> 60) as sc1 where student.id=sc1.studentId;
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select * from student s where s.id NOT in
(select studentId from student_course);
# 5.查询所有有成绩的SQL
select * from student_course;
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select s.* from student s,student_course sc1,student_course sc2
where s.id=sc1.studentId and s.id=sc2.studentId and sc1.courseId='1'
and sc2.courseId='2';
# 7.检索1课程分数小于60，按分数降序排列的学生信息
select * from student s,(select studentId,score from student_course 
where courseId=1 and score< 60) 
as sc where s.id=sc.studentId ORDER BY score desc;
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select avg(score) average from student_course GROUP BY
courseId ORDER BY average desc,courseId ASC;
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select student.name,score from student,course,(select studentId,courseId,score from student_course where score < 60 ) as SC
where student.id= sc.studentId and sc.courseId=course.id and course.name='数学';