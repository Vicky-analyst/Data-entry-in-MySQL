# Data Entry in MySQL
## Student Database
![](mysql_picture.jpg)

### Project Review
---

This is a built project from scratch which contain student info enclose in a student database in mysql. The integration of these MySQL Features demonstrated a cpommitment to the creation of a well organized and secure database system for managing student academics, it contain detailed code in tracking student academics , entering student info and quick code to Update student information

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

Code use to evaluate student grade and placing the poorly performed Grade in another table
