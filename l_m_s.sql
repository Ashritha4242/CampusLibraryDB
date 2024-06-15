create database lms;
use lms;

create table book_details(
ISBN bigint,
book_title varchar(50) primary key,
genre varchar(20),
author varchar(50),
publisher varchar(50),
publication_year int,
status varchar(20),
no_of_copies_actual int default(5),
no_of_copies_current int);

desc book_details;

insert into book_details
values('1001','statistical methods','statistics','Dr.Manash Pratim Braman','Mahaveer publications',2021,'available',5,4),
                               ('1101','Mathematics for Machine Learning','Mathematics','A.Aldo Faisal','Cambridge Univercity Press',2020,'available',5,5),
                               ('1201','statistics for Data Science','satatistics','James D.Miler','Packt Publishing Limited',2017,'available',5,4),
                               ('1301','General Chemistry','Chemistry','Linus Pauling','Dover Publications',2003,'available',5,5),
                               ('1401','organic Chemistry','Chemistry','Jonathon Clayden','Oxford University Press',2014,'available',5,4),
                               ('1501','Concepts of Atomic Physics','Physics','SP Kuila','New Central Book Agency',2017,'available',5,3),
                               ('1601','Concepts of Physics','Physics','HC Varma','Book Houses',2018,'available',5,5),
                               ('1701','Political Science','Polity','DR.S.R Myneni','Allahabad Law Agency',2021,'available',5,4),
                               ('1801','Nationalism','Polity','Ravindranath Tagore','Finger Print Publications',2015,'unavailable',5,0),
                               ('1901','Psychology of Life','Psychology','Anirudha Singh','Nation Press',2021,'available',5,5);
                               
select * from book_details
order by book_title;
                               
create table staff_details(
staff_id varchar(5) primary key,
staff_name varchar(50)
);

alter table staff_details
modify staff_id varchar(5);

alter table staff_details
add primary key(staff_id);

insert into staff_details
 values("s1","krishna"),
 ("s2","govindh"),
 ("s3","radhesh"),
 ("s4","santhosh");
  

select * from staff_details;

create table borrower_details(
borrower_id varchar(5) primary key,
book_title varchar(50),
date_out date,
due_date date,
date_in date,
issued_by varchar(5),
penalty_per_day int,
extra_days int);

desc borrower_details;

alter table borrower_details add constraint foreign_book foreign key(book_title) references book_details(book_title) on delete cascade on update cascade;
alter table borrower_details add constraint book_issued_by foreign key(issued_by) references staff_details(staff_id) on delete cascade on update cascade;

insert into borrower_details
values ('B1','statistics for Data Science','22-01-1','22-01-7','22-01-9','s2',5,2),
								   ('B2','organic Chemistry','22-01-8','22-01-14','22-01-20','s1',7,6),
                                   ('B3','Concepts of Atomic Physics','22-01-10','22-01-16','22-01-19','s4',5,3),
                                   ('B4','Nationalism','22-01-13','22-01-19','22-01-21','s3',10,2),
                                   ('B5','Nationalism','22-01-23','22-01-29','22-01-29','s3',10,0),
                                   ('B6','Nationalism','22-02-5','22-02-11','22-02-13','s1',10,2),
                                   ('B7','Nationalism','22-02-13','22-02-19','22-02-19','s1',10,0),
                                   ('B8','Political Science','22-02-24','22-03-2','22-03-4','s3',7,2),
                                   ('B9','Concepts of Atomic Physics','22-03-7','22-03-13','22-03-16','s2',5,3),
                                   ('B10','Nationalism','22-03-10','22-03-16','22-03-20','s2',10,4),
                                   ('B11','statistical methods','22-03-13','22-03-19','22-03-20','s4',5,1);

select * from borrower_details
order by book_title;

create table student_details(
student_id varchar(10) primary key,
student_name varchar(20),
borrower_id varchar(5),
department varchar(20),
contact_no bigint
);
alter table student_details add constraint foreign_borrower foreign key(borrower_id) references borrower_details(borrower_id) on delete cascade on update cascade;
desc student_details;

insert into student_details
values('A1','Thrisha','B2','BTECT',7673968051),
                                   ('A2','Shravani','B7','BSC',7989630632),
                                   ('A3','Venkat','B5','BTECT',7989829186),
                                   ('A4','Phanindra','B9','BTECT',9245782322),
                                   ('A5','Vishwa','B6','BCOM',8962533121),
                                   ('A6','Teja','B4','BTECT',9550699695),
                                   ('A7','Ravi','B11','BSC',9333998889),
                                   ('A8','Raj','B3','MBA',8798306326),
                                   ('A9','Bheem','B8','BTECT',9897928861),
                                   ('A10','Arjun','B10','MBA',7696235543),
                                   ('A11','Nakul','B1','BSC',9323698789);

select * from student_details;


create table shelf_details(
shelf_id int primary key,
shelf_no int,
floor int,
book_title varchar(50)
);
alter table shelf_details add constraint foreign_shelf foreign key(book_title) references book_details(book_title) on delete cascade on update cascade;

desc shelf_details;
desc book_details;

insert into shelf_details 
values(21,2,1,'statistical methods'),
                                 (22,1,2,'Mathematics for Machine Learning'),
                                 (23,3,1,'statistics for Data Science'),
                                 (24,3,1,'General Chemistry'),
                                 (25,2,2,'organic Chemistry'),
                                 (26,1,2,'Concepts of Atomic Physics'),
                                 (27,2,1,'Concepts of Physics'),
                                 (28,3,2,'Political Science'),
                                 (29,2,2,'Nationalism'),
                                 (30,1,1,'Psychology of Life');

select * from shelf_details;

create table visit_details(
student_id varchar(10) primary key,
entry_time time,
exit_time time
);

alter table visit_details add constraint foreign_borrow foreign key(student_id) references student_details(student_id) on delete cascade on update cascade;

desc visit_details;

insert into visit_details
values('A1','9:23:15','10:23:26'),
                                   ('A2','9:45:15','10:23:26'),
                                   ('A3','9:55:23','10:30:34'),
                                   ('A4','10:13:45','10:55:16'),
                                   ('A5','10:40:15','11:20:35'),
                                   ('A6','10:53:45','11:58:23'),
                                   ('A7','11:12:42','11:30:32'),
                                   ('A8','11:46:34','12:45:22'),
                                   ('A9','11:56:43','12:50:36'),
                                   ('A10','12:30:15','1:43:21');

select * from visit_details
order by student_id;

create table penalty_details(
penalty_amount int,
borrower_id varchar(10),
transaction_id varchar(10) primary key,
book_title varchar(50),
payment_mode varchar(50),
payment_date date
);

desc penalty_details;
desc visit_details;
desc shelf_details;
desc borrower_details;
desc staff_details;
desc student_details;
desc book_details;

#1 write a query to display book title and author of the books whose author name begins with 'j'.
select * from book_details
where author like 'j%';

#2 write a query to display the book which are published after year 2017.
select book_title,author,publication_year from book_details
where publication_year>2017;

#3 Write a query to display all books sorted by book title in ascending order.
select * from book_details
order by book_title asc;

#4 Write a query to count the total number of books that are 'available' in the book_details table.
select count(book_title) as books_ava from book_details
where status='available';

#5 Write a query to display the first 5 books from the book_details table.
select book_title from book_details
limit 5;

#6 Write a query to display all books published between 2010 and 2020.
select book_title,publication_year 
from book_details 
where publication_year between 2010 and 2020;

#7 Write a query to display all books where the genre is either 'Chemistry' or 'Physics'.
select * from book_details
where genre in('Chemistry','Physics');

#8 Write a query to display the distinct genres present in the book_details table.
select distinct genre as dis_genre from book_details;

use lms;

select book_title,borrower_id
from borrower_details;

select publication_year,author 
from book_details a
inner join borrower_details b
on a.book_title=b.book_title;

#9 write a query to display student names who have taken the book called Nationalism.
select * from student_details a
inner join borrower_details b
on a.borrower_id=b.borrower_id
where b.book_title='Nationalism';

 #10 write a query to display availability status,no_of copies available and location of a book named organic chemistry in the library.
 select status,no_of_copies_current,shelf_id
 from book_details a
 inner join shelf_details b
 on a.book_title=b.book_title
 where a.book_title='organic chemistry';
 
 #11 write a query to display the name of the staff member who issued statistical methods book and also find out the student name and date on which he/she issued the book.
select staff_name,book_title,student_name,date_out
from staff_details b
inner join borrower_details bo
on b.staff_id=bo.issued_by
inner join student_details book
on book.borrower_id=bo.borrower_id
where book_title='statistical methods';

 select s.staff_name,b.book_title,st.student_name,b.date_out from borrower_details as b
    inner join staff_details as s
    on b.issued_by=s.staff_id
    inner join student_details as st
    on b.borrower_id=st.borrower_id
    where b.book_title='statistical methods';
    
    