create table employee
(
    id         bigserial,
    fio        varchar(100),
    manager_id int,
    salary     int
);
insert into employee (fio, salary)
values ('Вася', 300);

insert into employee (fio, manager_id, salary)
values ('Дима', (select id from employee where fio = 'Вася'), 280);

insert into employee (fio, manager_id, salary)
values ('Оля', (select id from employee where fio = 'Вася'), 270);

insert into employee (fio, salary)
values ('Коля', 500);

select *
from employee
where manager_id IS NULL
order by salary desc;

select *
from employee;