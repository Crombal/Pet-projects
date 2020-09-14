delete from user_role;
delete from usr;

insert into usr
    (id, active, password, username) values
    (1, true, '$2a$08$v0PJfNF3.VASzjDngM0G2O1Z6jzEA1lW2tsJNffe2xqgUmZob7Kjq', 'admin'),
    (2, true, '$2a$08$v0PJfNF3.VASzjDngM0G2O1Z6jzEA1lW2tsJNffe2xqgUmZob7Kjq', 'Anton');

insert into user_role
    (user_id, roles) values
    (1, 'USER'),
    (1, 'ADMIN'),
    (2, 'USER');