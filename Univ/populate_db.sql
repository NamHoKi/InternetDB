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

 insert into STUDENT values ('100', '������', '100', 'student', 4, '��ǻ��');
 insert into STUDENT values ('200', '������', '200', 'student', 3, '����');
 insert into STUDENT values ('300', '������', '300', 'student', 1, '��ǻ��');
 insert into STUDENT values ('400', '�ۺ���', '400', 'student', 4, '��ǻ��');
 insert into STUDENT values ('500', '����ȭ', '500', 'student', 2, '���');
  
create table COURSE (
  cno char(4),
  cname nvarchar2(6) not null,
  credit integer not null,
  dept nvarchar2(3) not null,
  professor nchar(3),
  primary key(cno),
  unique (cno,professor)
);

insert into COURSE values ('C123', 'C���α׷���',  3,	'��ǻ��', '�輺��');
insert into COURSE values ('C312', '�ڷᱸ��',	   3,	'��ǻ��', 'Ȳ����');
insert into COURSE values ('C324', 'ȭ�ϱ���',	   3,	'��ǻ��', '�̱���');
insert into COURSE values ('C413', '�����ͺ��̽�', 3,	'��ǻ��', '���Ϸ�');
insert into COURSE values ('E412', '�ݵ�ü',	   3,	'����',	  'ȫ����');
  
  
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


