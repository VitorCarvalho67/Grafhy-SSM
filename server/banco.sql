
Create database grafhyPy;

use grafhyPy;

create table users(
    id_users int not null auto_increment primary key,
    name_users varchar(255) not null,
    email_users varchar(255) not null,
    password_users varchar(255) not null,
    photo_users varchar(255) not null
);

create table groups(
    id_groups int not null auto_increment primary key,
    name_groups varchar(255) not null,
    photo_groups varchar(255) not null,
    description_groups varchar(255) not null
);

create table messages_grupo(
    id_messages_grupo int not null auto_increment primary key,
    id_users int not null,
    id_groups int not null,
    message varchar(255) not null,
    date_message varchar(255) not null,
    foreign key (id_users) references users(id_users),
    foreign key (id_groups) references groups(id_groups)
);

create table contacts_grupo(
    id_contacts int not null auto_increment primary key,
    id_groups int not null,
    id_users int not null,
    type_contact enum('Criador', 'Admin', 'Participante') not null,
    foreign key (id_groups) references groups(id_groups),
    foreign key (id_groups) references groups(id_groups)
);

create table contacts_users(
    id_contacts int not null auto_increment primary key,
    id_users1 int not null,
    id_users2 int not null,
    last_message DATETIME not null,
    foreign key (id_users1) references users(id_users),
    foreign key (id_users2) references users(id_users)
);

create table messages_users(
    id_messages_users int not null auto_increment primary key,
    id_users1 int not null,
    id_users2 int not null,
    message varchar(255) not null,
    date_message varchar(255) not null,
    foreign key (id_users1) references users(id_users),
    foreign key (id_users2) references users(id_users)
);

create table solicitation(
    id_solicitation int not null auto_increment primary key,
    id_users1 int not null,
    id_users2 int not null,
    foreign key (id_users1) references users(id_users),
    foreign key (id_users2) references users(id_users)
);

create table posts(
    id_posts int not null auto_increment primary key,
    id_users int not null,
    data_post varchar(255) not null,
    text_post varchar(255) not null,
    image_post varchar(255) not null,
    foreign key (id_users) references users(id_users)
);

create table comments(
    id_comments int not null auto_increment primary key,
    id_users int not null,
    id_posts int not null,
    data_comment varchar(255) not null,
    text_comment varchar(255) not null,
    foreign key (id_users) references users(id_users),
    foreign key (id_posts) references posts(id_posts)
);

create table likes(
    id_likes int not null auto_increment primary key,
    id_users int not null,
    id_posts int not null,
    foreign key (id_users) references users(id_users),
    foreign key (id_posts) references posts(id_posts)
);

create table comunicados (
  id_comunicados int not null auto_increment primary key,
  message varchar(255) not null,
  date_message varchar(255) not null,
  nome_arquivo varchar(255) not null,
  file_arquivo longblob not null
);

create view view_comments as select comments.id_comments, comments.id_users, comments.id_posts, comments.data_comment, comments.text_comment, users.name_users, users.photo_users from comments inner join users on comments.id_users = users.id_users;

create view view_likes as select likes.id_likes, likes.id_users, likes.id_posts, users.name_users, users.photo_users from likes inner join users on likes.id_users = users.id_users;

create view view_messages_users as select messages_users.id_messages_users, messages_users.id_users1, messages_users.id_users2, messages_users.message, messages_users.date_message, users.name_users, users.photo_users from messages_users inner join users on messages_users.id_users1 = users.id_users;

create view view_messages_grupo as select messages_grupo.id_messages_grupo, messages_grupo.id_users, messages_grupo.id_groups, messages_grupo.message, messages_grupo.date_message, users.name_users, users.photo_users from messages_grupo inner join users on messages_grupo.id_users = users.id_users;

create view view_contacts_users as select contacts_users.id_contacts, contacts_users.id_users1, contacts_users.id_users2, contacts_users.last_message, users.name_users, users.photo_users from contacts_users inner join users on contacts_users.id_users1 = users.id_users;

create view view_contacts_grupo as select contacts_grupo.id_contacts, contacts_grupo.id_groups, contacts_grupo.id_users, contacts_grupo.type_contact, groups.name_groups, groups.photo_groups from contacts_grupo inner join groups on contacts_grupo.id_groups = groups.id_groups;

create view view_solicitation as select solicitation.id_solicitation, solicitation.id_users1, solicitation.id_users2, users.name_users, users.photo_users from solicitation inner join users on solicitation.id_users1 = users.id_users;

create view view_posts as select posts.id_posts, posts.id_users, posts.data_post, posts.text_post, posts.image_post, users.name_users, users.photo_users from posts inner join users on posts.id_users = users.id_users;