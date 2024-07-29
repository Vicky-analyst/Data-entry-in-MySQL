# Data Entry in MySQL
## Student Database
![](mysql_picture.jpg)

### Project Review
---

This is a built project from scratch which contain student info enclose in a student database in mysql. The integration of these MySQL Features demonstrated a commitment to the creation of a well organized and secure database system for managing student academics, it contain detailed code in tracking student academics , entering student info and quick code to Update student information

**_Disclaimer_** -> _This dataset does not represent or gotton from any school, it is adummy dataset and fabricated for the purpose of learning_

### Tools and Skills Demonstrated

#### Tool
- MySQL

#### Skills Demonstrated

- Created Database
- Created Tables
- Entered Values(Data)
- Created Triggers
- Store procedure

### Triggers
the Triggers created in this projecrt is used to track Student academics in real time, evaluate student grade and placing the poorly performed Grade in another table

Code use to track student academics in real time

```sql
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
```

Code use to evaluate student grade and placing the poorly performed Grade in another table

```sql
create trigger failed_student
 after insert on student_term_grade
 for each row
 begin
 if new.Grade = "fail" then
 insert into student_fail (Stu_Id, department, Grade)
 values(new.stu_id, new.department, new.Grade);
 end if ;
```

### Store Procedure

The Store Procedure designed in this project is to update Student Grade Info, which offer a streamlined and consistent approach to data management during mistake input of values or null values

Code used update student grade info

```sql
create procedure update_stu_grade(in student_id int, in 
 new_assessment int,  in new_exam_score float, in new_grade_score float,
 in new_grade varchar(10))
 begin 
 update student_term_grade set 
 Assessment = new_assessment, Exam_Score = new_exam_score,
 Grade_Score = new_grade_score, Grade = new_grade
 where Stu_Id = student_id;
 end;
```
**To interact with the code here
- [MySQL](Data_entry_in_mysql.sql)

  
