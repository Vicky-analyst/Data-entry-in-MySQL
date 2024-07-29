# create database #
Create database students;
use students;

# creating tables #
create table student_info(Stu_Id int primary key auto_increment, 
Stu_First_Name varchar(30), stu_Last_Name varchar(30), Sex char(1),
DOA date, Department Varchar(20), Class_Type char (1));

alter table student_info 
auto_increment = 101;

create table student_term_grade(Stu_Id int primary key auto_increment,
department varchar(20), Assessment int, Exam_Score float, Grade_Score float, 
Grade varchar(10));

alter table student_term_grade
auto_increment =101;

create table student_fail(Id int auto_increment, Stu_Id int, department varchar(20),
						 Grade varchar(10), primary key(Id, stu_id));

# inserting data into student_info #
insert into student_info(Stu_first_Name, stu_Last_Name, Sex, DOA,
						Department, Class_Type)
values("Moris", "Megan", "F", "2019-09-10", "Science Class", "A"),
	  ("Ujuwa", "Kennedy", "F", "2019-08-01", "Science Class", "A"),
	  ("Faithiya", "Abubaka", "F", "2019-08-01", "Science Class", "A"),
      ("Daniel", "Osita", "M", "2019-08-12",  "Science Class", "A"),
      ("Ijemo", "Uchenna", "F", "2019-09-03", "Science Class", "A"),
      ("Dayo", "Ifeioluwa", "M", "2019-08-16", "Science Class", "A"),
      ("Abdul", "Ibrahim", "M", "2019-09-12", "Science Class", "A"),
      ("Ini", "Ibom", "F", "2019-08-28", "Science Class", "A"),
      ("Yusuf", "Abduraman", "M", "2019-09-30", "Science Class", "A"),
      ("Chinwe", "Azubike", "F", "2019-08-14", "Science Class", "A"),
	  ("Umar", "Yaradura", "M", "2019-08-31", "Science Class", "A"),
	  ("Adora", "Okuta", "F", "2019-08-18", "Science Class", "A"),
      ("Timilieye", "Jacob", "M", "2019-09-23", "Science Class", "A"),
      ("Blessing", "Joshua", "F", "2019-09-21", "Science Class", "A"),
      ("Victor", "Ajaye", "M", "2019-08-24", "Science Class", "A"),
      ("Joseph", "Adeboye", "M", "2019-08-13", "Art Class", "B"),
      ("Tiawo", "Akin", "M", "2019-08-24", "Art Class", "B"),
      ("Victoria", "Okon", "F", "2019-09-14", "Art Class", "B"),
      ("Uchenna", "Azuka", "M", "2019-09-14", "Art Class", "B"),
      ("Olivia", "Pope", "F", "2019-08-17", "Art Class", "B"),
      ("Gloria", "Ikeatia", "F", "2019-09-27", "Art Class", "B"),
      ("Dorcas", "Moses", "F", "2019-08-26", "Art Class", "B"),
      ("Jerry", "Jame", "M", "2019-09-30", "Art Class", "B"),
      ("Eli", "Pope", "M", "2019-09-28", "Art Class", "B"),
      ("Fatima", "Danladi", "F", "2019-08-12", "Art Class", "B"),
      ("Chiboi", "Chidi", "M", "2019-08-13", "Art Class", "B"),
      ("Hossena", "Abdul", "F", "2019-09-17", "Art Class", "B"),
      ("Hassan", "Abdul", "M", "2019-09-17", "Art Class", "B"),
      ("Doris", "Handsome", "F", "2019-09-28", "Art Class", "B"),
      ("Emaka", "Amadi", "M", "2019-08-01", "Art Class", "B"),
      ("Ezekiel", "Emmanaul", "M", "2019-09-02", "Art Class", "B"),
	  ("Maria", "Olive", "F", "2019-08-11", "Art Class", "B"),
      ("David", "Chima", "M", "2019-08-22", "Art Class", "B"),
      ("Bose", "Bolu", "F", "2019-09-21", "Art Class", "B"),
      ("Victor","Osimeh", "M", "2019-09-14", "Art Class", "B"),
      ("Johnbull", "Joe", "M", "2019-08-31", "Art Class", "B"),
      ("Grace", "Adams", "F", "2019-08-19", "Financial Class", "C"),
      ("Calab", "Orgi", "M", "2019-08-21", "Financial Class", "C"),
      ("Pricilia", "ORGI","F", "2019-08-22", "Financial Class", "C"),
      ("Chidimma","Chike", "F", "2019-09-17", "Financial Class", "C"),
      ("Stephen", "Nathianel", "M", "2019-08-13", "Financial Class", "C"),
      ("Gladys", "Azubike", "F", "2019-08-28", "Financial Class", "C"),
      ("Sani", "Nasiru", "M", "2019-09-16", "Financial Class", "C"),
      ("Zaniab", "Abdulahi", "F", "2019-08-14", "Financial Class", "C"),
      ("Ekibom", "Iyabom", "M", "2019-09-12", "Financial Class", "C"),
      ("Leonard", "Femi", "M", "2019-08-27", "Financial Class", "C"),
      ("Ogechi", "Jacob", "F", "2019-09-25", "Financial Class", "C"),
      ("Divine", "Favour", "F", "2019-09-26", "Financial Class", "C"),
      ("Efe", "Ese", "M", "2019-09-04", "Financial Class", "C"),
      ("Danielia", "Eze", "F", "2019-09-29", "Financial Class", "C");
      
  # using select statement #    
 select *
 from student_info
      
 # creating triggers for grades #
 delimiter //
 create trigger Stu_grades
 before insert on student_term_grade
 for each row
 begin
 if new.Grade <= 49 then 
 set new.Grade  = "Fail";
 elseif new.Grade <= 59 then 
 set new.grade = "D";
 elseif new.Grade <= 69 then 
 set new.Grade = "C";
 elseif new.Grade <= 79 then 
 set new.Grade = "B";
 elseif new.Grade > 79 then 
 set new.Grade = "A";
 end if ;
 end //
 delimiter ;
 
 # creating a trigger for student who failed #
 delimiter //
 create trigger failed_student
 after insert on student_term_grade
 for each row
 begin
 if new.Grade = "fail" then
 insert into student_fail (Stu_Id, department, Grade)
 values(new.stu_id, new.department, new.Grade);
 end if ;
 end //
 delimiter ;
 
 # inserting data into student_term_grade #
 insert into student_term_grade(Department, Assessment, Exam_Score, 
								Grade_score, Grade)
values( "Science Class", 13, 45, Assessment + Exam_Score, Assessment + Exam_Score),
	  ("Science Class", 28, 56, Assessment + Exam_Score, Assessment + Exam_Score),
	  ("Science Class", 10, 32, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Science Class", 21, 39, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Science Class", 20, 62, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Science Class", 16, 43, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Science Class", 12, 21, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Science Class", 18, 55, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Science Class", 2, 25, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Science Class", 15, 59, Assessment + Exam_Score, Assessment + Exam_Score),
	  ("Science Class", 17, 52.7, Assessment + Exam_Score, Assessment + Exam_Score),
	  ("Science Class", 7, 45, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Science Class", 26, 67.5, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Science Class", 13, 49.5, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Science Class", 15, 43, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 17, 37, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 23, 54, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 19, 61.7, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 28, 64, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 26, 66.5, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 23, 56, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 14, 44.6, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 15, 39.7, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 24, 57, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 10, 33, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 13, 36.6, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 19, 51, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 7, 23.4, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 16, 53, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 3, 17.8, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 9, 28, Assessment + Exam_Score, Assessment + Exam_Score),
	  ("Art Class", 17, 48, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 20, 50, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 18, 45, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 22, 61.5, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Art Class", 3, 12, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Financial Class", 16, 47, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Financial Class", 21, 69, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Financial Class", 13, 35.7, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Financial Class", 6, 19, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Financial Class", 12, 43.2, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Financial Class", 27, 65, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Financial Class", 19, 42, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Financial Class", 18, 54.5, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Financial Class", 11, 28, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Financial Class", 15, 50, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Financial Class", 18, 46, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Financial Class", 25, 57, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Financial Class", 23, 56, Assessment + Exam_Score, Assessment + Exam_Score),
      ("Financial Class", 19, 38.5, Assessment + Exam_Score, Assessment + Exam_Score);
 
 # using select statment to check tables #
 select *
 from student_term_grade
 
 select *
 from  student_fail
 
 # creating a procedure to update student_term_grade incase of errors #
 delimiter //
 create procedure update_stu_grade(in student_id int, in 
 new_assessment int,  in new_exam_score float, in new_grade_score float,
 in new_grade varchar(10))
 begin 
 update student_term_grade set 
 Assessment = new_assessment, Exam_Score = new_exam_score,
 Grade_Score = new_grade_score, Grade = new_grade
 where Stu_Id = student_id;
 end; //
 
 call update_stu_grade(118, 20, 65, 20+65, "A" )
 