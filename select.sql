# 1.��ѯͬʱ����1�γ̺�2�γ̵����
SELECT * FROM (SELECT * FROM  student_course sc WHERE sc.courseId=1) AS biao01,
(SELECT * FROM  student_course sc2 WHERE sc2.courseId=2) AS biao02 WHERE
 biao01.studentId = biao02.studentId;
# 2.��ѯͬʱ����1�γ̺�2�γ̵����
select * from student_course sc1 where sc1.courseId=1 and
sc1.studentId in(select studentId from student_course sc2 where sc2.courseId=2);
# 3.��ѯƽ���ɼ����ڵ���60�ֵ�ͬѧ��ѧ����ź�ѧ��������ƽ���ɼ�
select id,name,sc1.score from student,(select studentId,avg(score) score from student_course 
group by studentId having avg(score)> 60) as sc1 where student.id=sc1.studentId;
# 4.��ѯ��student_course���в����ڳɼ���ѧ����Ϣ��SQL���
select * from student s where s.id NOT in
(select studentId from student_course);
# 5.��ѯ�����гɼ���SQL
select * from student_course;
# 6.��ѯѧ�����Ϊ1����Ҳѧ�����Ϊ2�Ŀγ̵�ͬѧ����Ϣ
select s.* from student s,student_course sc1,student_course sc2
where s.id=sc1.studentId and s.id=sc2.studentId and sc1.courseId='1'
and sc2.courseId='2';
# 7.����1�γ̷���С��60���������������е�ѧ����Ϣ
select * from student s,(select studentId,score from student_course 
where courseId=1 and score< 60) 
as sc where s.id=sc.studentId ORDER BY score desc;
# 8.��ѯÿ�ſγ̵�ƽ���ɼ��������ƽ���ɼ��������У�ƽ���ɼ���ͬʱ�����γ̱����������
select avg(score) average from student_course GROUP BY
courseId ORDER BY average desc,courseId ASC;
# 9.��ѯ�γ�����Ϊ"��ѧ"���ҷ�������60��ѧ�������ͷ���
select student.name,score from student,course,(select studentId,courseId,score from student_course where score < 60 ) as SC
where student.id= sc.studentId and sc.courseId=course.id and course.name='��ѧ';