drop table ENROL;
drop table STUDENT;
drop table COURSE;

create table STUDENT (
  sno char(3) primary key,
  sname nchar(3) constraint sname_always_exists not null,
  passwd varchar(5),
  rolename varchar(10),
  year integer default 1, 
  dept nvarchar2(3),
  unique (dept, sname),
  constraint year_check check (year >=1 and year <=4 )
);

 insert into STUDENT values ('100', '나수영', '100', 'student', 4, '컴퓨터');
 insert into STUDENT values ('200', '이찬수', '200', 'student', 3, '전기');
 insert into STUDENT values ('300', '정기태', '300', 'student', 1, '컴퓨터');
 insert into STUDENT values ('400', '송병길', '400', 'student', 4, '컴퓨터');
 insert into STUDENT values ('500', '박종화', '500', 'student', 2, '산공');
  
create table COURSE (
  cno char(4),
  cname nvarchar2(6) not null,
  credit integer not null,
  dept nvarchar2(3) not null,
  professor nchar(3),
  primary key(cno),
  unique (cno,professor)
);

insert into COURSE values ('C123', 'C프로그래밍',  3,	'컴퓨터', '김성국');
insert into COURSE values ('C312', '자료구조',	   3,	'컴퓨터', '황수관');
insert into COURSE values ('C324', '화일구조',	   3,	'컴퓨터', '이규찬');
insert into COURSE values ('C413', '데이터베이스', 3,	'컴퓨터', '이일로');
insert into COURSE values ('E412', '반도체',	   3,	'전자',	  '홍봉진');
  
  
  create table ENROL (
  sno char(3) not null,
  cno char(4) not null,
  grade char,
  midterm integer,
  finterm integer,
  primary key (sno, cno),
  foreign key (sno) references STUDENT(sno)
	on delete cascade,
  foreign key (cno) references COURSE
	on delete cascade,
  check (grade in ('A', 'B', 'C', 'D', 'F'))
  );
  
insert into ENROL values ('100', 'C413',	'A',	90,	95);
insert into ENROL values ('100', 'E412',	'A',	95,	95);
insert into ENROL values ('200', 'C123',	'B',	85,	80);
insert into ENROL values ('300', 'C312',	'A',	90,	95);
insert into ENROL values ('300', 'C324',	'C',	75,	75);
insert into ENROL values ('300', 'C413',	'A',	95,	90);
insert into ENROL values ('400', 'C312',	'A',	90,	95);
insert into ENROL values ('400', 'C324',	'A',	95,	90);
insert into ENROL values ('400', 'C413',	'B',	80,	85);
insert into ENROL values ('400', 'E412',	'C',	65,	75);
insert into ENROL values ('500', 'C312',	'B',	85,	80);


