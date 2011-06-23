create table webpage (
	id char(72) not null primary key,
	title char(72) not null,
	menu_title char(72) not null,
	window_title char(72) not null,
	weight int not null,
	access enum('public','member','private') not null default 'public',
	layout char(48) not null,
	description text,
	keywords text,
	body text,
	index (access, weight)
);

insert into webpage (id, title, menu_title, window_title, weight, access, layout, description, keywords, body) values ('index', 'Congratulations!', 'Home', 'Home', 0, 'public', 'default', '', '', '<p>You have successfully installed Elefant!</p>');

create table user (
	id int not null auto_increment primary key,
	email char(72) unique not null,
	password char(35) not null,
	session_id char(32) unique,
	expires datetime not null,
	name char(72) not null,
	type char(32) not null,
	signed_up datetime not null,
	updated datetime not null,
	userdata text not null,
	index(email, password),
	index(session_id)
);

create table versions (
	id int not null auto_increment primary key,
	class char(72) not null,
	pkey char(72) not null,
	user int not null,
	ts datetime not null,
	serialized text not null,
	index (class, pkey, ts),
	index (user, ts)
);

create table api (
	token char(35) not null primary key,
	api_key char(35) not null,
	user_id int not null,
	index (token, api_key),
	index (user_id)
);

create table blog_post (
	id int not null auto_increment primary key,
	title char(72) not null,
	ts datetime not null,
	author char(32) not null,
	body text not null,
	index (ts)
);