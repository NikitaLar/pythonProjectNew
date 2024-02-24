-- SQL - structured query language (структурированный язык запросов)
-- DDL - data definition language (язык описания данных)
-- Создать таблицу PEOPLE с полями id и fio
create table PEOPLE
(
    id  bigserial,
    fio varchar(100)
);
-- DML - data manipulation language (язык манипулирования данными)
-- Добавить в таблицу в поле fio нового человека
insert into PEOPLE (fio)
values ('Иванов Иван Иванович');
insert into PEOPLE (fio)
values ('Андреев Андрей Андреевич');
-- Вывести всю таблицу
select *
from PEOPLE;
select *
from car;
-- Удалить из таблицы строку с id=2
delete
from people
where id = 2;
-- Вместо человека с id=1 добавить в таблицу people нового человека
update people
set fio='Андреева Ольга Ивановна'
where id = 1;
-- DDL
-- Удалить таблицу
drop table car;
drop table PEOPLE;
-- Создать таблицу с полями
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
-- Добавить в таблицу в поля соответствующие значения
insert into department (title, organization)
values ('разработка', 'sun');
insert into department (title, organization)
values ('тестирование', 'sun');
insert into department (title, organization)
values ('маркетинг', 'sun');
insert into department (title, organization)
values ('serverless', 'amazon');
-- вывести всю таблицу
select *
from department;
-- Добавить в таблицу в поля соответствующие значения
insert into employee (fio, department_id)
values ('Иванов Иван Иваныч', 1);
insert into employee (fio, department_id)
values ('Александров Александр Александрович', 2);
insert into employee (fio, department_id)
values ('Андреева Марина Ивановна', 3);
-- вывести всю таблицу
select *
from employee;
-- Вывести данные о работнике, работая с двумя таблицами
select fio, title, organization
from employee
         join department on employee.department_id = department.id;
-- Вывести всех разработчиков
select fio, title, organization
from employee
         join department on employee.department_id = department.id
where department.title != 'разработка';
-- Удалил все таблицы
drop table department;
drop table employee;


-- Новый проект

-- Новые таблицы
create table car
(
    id        bigserial,
    title     varchar(100),
    engine_id bigint,
    body_id   bigint
);
create table engine
(
    id               bigserial,
    title            varchar(100),
    engine_type_name varchar(100),
    v                varchar(10),
    hp               int
);
create table engine_type
(
    id          bigserial,
    name        varchar(100),
    description varchar(100)
);
create table body
(
    id    bigserial,
    title varchar(100)
);
-- Добавляю в таблицу типы кузова
insert into body (title)
values ('седан');
insert into body (title)
values ('пикап');
insert into body (title)
values ('внедорожник');
insert into body (title)
values ('универсал');
-- Добавляю в таблицу типы двигателей
insert into engine_type (name, description)
values ('gasoline', 'бензиновый двигатель');
insert into engine_type (name, description)
values ('diesel', 'дизельный двигатель');
insert into engine_type (name, description)
values ('electro', 'электрический двигатель');
-- Создаю двигатель
insert into engine (title, engine_type_name, v, hp)
values ('ваз', 'бензиновый двигатель', '1.5', 75);
insert into engine (title, engine_type_name, v, hp)
values ('ваз', 'бензиновый двигатель', '2', 100);
insert into engine (title, engine_type_name, v, hp)
values ('ваз', 'бензиновый двигатель', '2.2', 130);
insert into engine (title, engine_type_name, v, hp)
values ('ford', 'бензиновый двигатель', '6.2', 270);
insert into engine (title, engine_type_name, v, hp)
values ('tesla', 'электрический двигатель', '0', 400);
insert into engine (title, engine_type_name, v, hp)
values ('toyota', 'бензиновый двигатель', '2.7', 163);
insert into engine (title, engine_type_name, v, hp)
values ('toyota', 'бензиновый двигатель', '4', 270);
insert into engine (title, engine_type_name, v, hp)
values ('УАЗ', 'бензиновый двигатель', '2.7', 140);
-- Создаю машины
insert into car (title, engine_id, body_id)
values ('УАЗ', 8, 3);
insert into car (title, engine_id, body_id)
values ('tlc120', 6, 3);
insert into car (title, engine_id, body_id)
values ('ford excursion', 4, 3);
insert into car (title, engine_id, body_id)
values ('УАЗ', 4, 3);
insert into car (title, engine_id, body_id)
values ('УАЗ', 7, 2);
insert into car (title, engine_id, body_id)
values ('ВАЗ', 1, 1);
insert into car (title, engine_id, body_id)
values ('tesla model s', 5, 1);
insert into car (title, engine_id, body_id)
values ('УАЗ', 0, 3);
insert into car (title, engine_id, body_id)
values ('УАЗ', 0, 2);
insert into car (title, engine_id, body_id)
values ('ВАЗ НИВА', 0, 3);
-- изменил с 0 на null
update car
set engine_id=NULL
where engine_id = 0;
--Вывожу все авто с полной информацией по двигателям и кузовам
select c.title as car, e.title as engine, et.description as engine_type,e.v as volume, e.hp as power, b.title as body
from car c
join engine e on c.engine_id = e.id
join engine_type et on et.name=e.engine_type_name
join body b on b.id=c.body_id;
