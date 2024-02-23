-- SQL - structured query language (структурированный язык запросов)
-- DDL - data definition language (язык описания данных)
create table PEOPLE
(
    id  bigserial,
    fio varchar(100)
);
-- DML - data manipulation language (язык манипулирования данными)
insert into PEOPLE (fio)
values ('Иванов Иван Иванович');
insert into PEOPLE (fio)
values ('Андреев Андрей Андреевич');
select *
from PEOPLE;
select *
from car;
delete
from people
where id = 2;
update people
set fio='Андреева Ольга Ивановна'
where id = 1;
-- DDL
drop table car;
drop table PEOPLE;

create table employee
(
    id            bigserial,
    fio           varchar(100),
    department_id bigint
);
create table department
(
    id           bigserial,
    title        varchar(100),
    organization varchar(100)
);
insert into department (title, organization)
values ('разработка', 'sun');
insert into department (title, organization)
values ('тестирование', 'sun');
insert into department (title, organization)
values ('маркетинг', 'sun');
insert into department (title, organization)
values ('serverless', 'amazon');
select *
from department;
insert into employee (fio, department_id)
values ('Иванов Иван Иваныч', 1)
insert into employee (fio, department_id)
values ('Александров Александр Александрович', 2)
insert into employee (fio, department_id)
values ('Андреева Марина Ивановна', 3)
select *
from employee;
select fio, title, organization
from employee
         join department on employee.department_id = department.id;
select fio, title, organization
from employee
         join department on employee.department_id = department.id
where department.title != 'разработка';
