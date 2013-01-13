--Wide db-structure

create table users(
	uid serial not null primary key,
	"name" varchar(25) not null,
	pw varchar(50) not null,
	email varchar(40) not null,
	d timestamp  not null
);  

create table friends (
	uid1 integer not null,
	uid2 integer not null,
	foreign key(uid1) references users(uid),
	foreign key(uid2) references users(uid)
);

create table groups (
	gid serial not null primary key,
	ownerid integer not null,
	gname varchar(40) not null,
	d timestamp  not null,
	foreign key (ownerid) references users (uid)
);

create table groupuser(
	gid integer not null,
	uid integer not null,
	foreign key(gid) references groups(gid),
	foreign key(uid) references users(uid)
);

--example inserts
insert into users (name, email, pw, d) values ('Testuser1', 'test@test.de', 'test', now());
insert into users (name, email, pw, d) values ('Testuser2', 'test2@test.de', 'test', now());
insert into users (name, email, pw, d) values ('Testuser3', 'test3@test.de', 'test', now());
insert into users (name, email, pw, d) values ('Testuser4', 'test4@test.de', 'test', now());
insert into users (name, email, pw, d) values ('Testuser5', 'test5@test.de', 'test', now());
insert into users (name, email, pw, d) values ('Testuser6', 'test6@test.de', 'test', now());
insert into users (name, email, pw, d) values ('Testuser7', 'test7@test.de', 'test', now());

insert into friends (uid1, uid2) values (1,2);
insert into friends (uid1, uid2) values (1,4);
insert into friends (uid1, uid2) values (2,3);
insert into friends (uid1, uid2) values (2,4);
insert into friends (uid1, uid2) values (2,5);
insert into friends (uid1, uid2) values (3,7);

insert into groups (ownerid, gname, d) values (1, 'family', now());
insert into groups (ownerid, gname, d) values (1, 'friends', now());
insert into groups (ownerid, gname, d) values (2, 'school', now());
insert into groups (ownerid, gname, d) values (3, 'team', now());

insert into groupuser (gid, uid) values (1,2);
insert into groupuser (gid, uid) values (2,4);
insert into groupuser (gid, uid) values (3,3);
insert into groupuser (gid, uid) values (3,4);

