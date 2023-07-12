# GRAFHY (Rede social)

## Descrição
Ambinete virtual para comunicação de usuarios através de mensagens, posts e imagens.
Além disso o usuário pode criar grupos de conversa e adicionar outros usuários.
Possui um sistema de login e cadastro de usuários.
Ambiente de postagem de imagens e mensagens.
Criação de grupos de conversa e adição de usuários.
Possui um sistema de verificação de usuários online.
Mensagens em tempo real e criptografadas.
sistema de notificações de mensagens e posts.
Sistema de busca de usuários e grupos.
Perfil de usuário com informações e foto de perfil.
Senhas criptografadas.
Sistema de recuperação de senha.
Banco de dados em mysql.

## Technologies

- [Vue.js](https://vuejs.org/)
- [Vue Router](https://router.vuejs.org/)
- [Python](https://www.python.org/)
- [FastAPI](https://fastapi.tiangolo.com/)
- [MySQL](https://www.mysql.com/)
- [node.js](https://nodejs.org/en/)
- [npm](https://www.npmjs.com/)
- [pnpm](https://pnpm.js.org/)
- [pip](https://pypi.org/project/pip/)
- [GitHub](https://github.com/)
- [Vite](https://vitejs.dev/)
- [Cors](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)
- [Axios](https://axios-http.com/)
- [Uvicorn](https://www.uvicorn.org/)
- [python-multipart](https://pypi.org/project/python-multipart/)
- [sqlalchemy](https://pypi.org/project/SQLAlchemy/)
- [mysql-connector-python](https://pypi.org/project/mysql-connector-python/)
- [garage](https://garagehq.deuxfleurs.fr/)

## Funcionalidades
- [ ] Cadastro de usuário
- [ ] Login de usuário
- [ ] Recuperação de senha
- [ ] Postagem de mensagens
- [ ] Postagem de imagens
- [ ] Criação de grupos
- [ ] Adição de usuários em grupos
- [ ] Sistema de notificações
- [ ] Sistema de busca de usuários
- [ ] Sistema de busca de grupos
- [ ] Sistema de verificação de usuários online
- [ ] Sistema de mensagens em tempo real
- [ ] Sistema de criptografia de mensagens
- [ ] Sistema de criptografia de senhas
- [ ] Sistema de perfil de usuário
- [ ] Sistema de perfil de grupo

## Execução

### Frontend
- cd frontend
- npm run dev

### Backend
- cd backend
- cd venv\Scripts
- .\activate
- cd ../../
- uvicorn main:app --reload

## Database em mysql

Create database grafhyPy;

use grafhyPy;

create table users(
    id_users int not null auto_increment primary key,
    name_users varchar(255) not null,
    email_users varchar(255) not null,
    password_users varchar(255) not null,
    photo_users varchar(255) not null,
);

create table groups(
    id_groups int not null auto_increment primary key,
    name_groups varchar(255) not null,
    photo_groups varchar(255) not null,
    description_groups varchar(255) not null,
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
    last_message datatime not null,
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

create view view_posts as select posts.id_posts, posts.id_users, posts.data_post, posts.text_post, posts.image_post, users.name_users, users.photo_users from posts inner join users on posts.id_users = users.id_users;

create view view_comments as select comments.id_comments, comments.id_users, comments.id_posts, comments.data_comment, comments.text_comment, users.name_users, users.photo_users from comments inner join users on comments.id_users = users.id_users;

create view view_likes as select likes.id_likes, likes.id_users, likes.id_posts, users.name_users, users.photo_users from likes inner join users on likes.id_users = users.id_users;

create view view_messages_users as select messages_users.id_messages_users, messages_users.id_users1, messages_users.id_users2, messages_users.message, messages_users.date_message, users.name_users, users.photo_users from messages_users inner join users on messages_users.id_users1 = users.id_users;

create view view_messages_grupo as select messages_grupo.id_messages_grupo, messages_grupo.id_users, messages_grupo.id_groups, messages_grupo.message, messages_grupo.date_message, users.name_users, users.photo_users from messages_grupo inner join users on messages_grupo.id_users = users.id_users;

create view view_contacts_users as select contacts_users.id_contacts, contacts_users.id_users1, contacts_users.id_users2, contacts_users.last_message, users.name_users, users.photo_users from contacts_users inner join users on contacts_users.id_users1 = users.id_users;

create view view_contacts_grupo as select contacts_grupo.id_contacts, contacts_grupo.id_groups, contacts_grupo.id_users, contacts_grupo.type_contact, groups.name_groups, groups.photo_groups from contacts_grupo inner join groups on contacts_grupo.id_groups = groups.id_groups;

create view view_solicitation as select solicitation.id_solicitation, solicitation.id_users1, solicitation.id_users2, users.name_users, users.photo_users from solicitation inner join users on solicitation.id_users1 = users.id_users;

## Requisições

**Users**
- `POST /users`: Cria um novo usuário.
- `GET /users/{id}`: Retorna os detalhes de um único usuário.
- `PUT /users/{id}`: Atualiza os detalhes de um usuário.
- `DELETE /users/{id}`: Exclui um usuário.

- **Groups**  
- `POST /groups`: Cria um novo grupo.
- `GET /groups/{id}`: Retorna os detalhes de um único grupo.
- `PUT /groups/{id}`: Atualiza os detalhes de um grupo.
- `DELETE /groups/{id}`: Exclui um grupo.

- **MessagesGrupo**  
- `POST /messages_grupo`: Cria uma nova mensagem em um grupo.
- `GET /messages_grupo/{id}`: Retorna os detalhes de uma única mensagem de grupo.
- `PUT /messages_grupo/{id}`: Atualiza os detalhes de uma mensagem de grupo.
- `DELETE /messages_grupo/{id}`: Exclui uma mensagem de grupo.

- **ContactsGrupo**  
- `POST /contacts_grupo`: Adiciona um novo contato a um grupo.
- `GET /contacts_grupo/{id}`: Retorna os detalhes de um único contato do grupo.
- `PUT /contacts_grupo/{id}`: Atualiza os detalhes de um contato do grupo.
- `DELETE /contacts_grupo/{id}`: Remove um contato de um grupo.

- **ContactsUsers**  
- `POST /contacts_users`: Adiciona um novo contato.
- `GET /contacts_users/{id}`: Retorna os detalhes de um único contato.
- `PUT /contacts_users/{id}`: Atualiza os detalhes de um contato.
- `DELETE /contacts_users/{id}`: Exclui um contato.

- **MessagesUsers**   
- `POST /messages_users`: Cria uma nova mensagem entre usuários.
- `GET /messages_users/{id}`: Retorna os detalhes de uma única mensagem entre usuários.
- `PUT /messages_users/{id}`: Atualiza os detalhes de uma mensagem entre usuários.
- `DELETE /messages_users/{id}`: Exclui uma mensagem entre usuários.

- **Solicitation**  
- `POST /solicitation`: Cria uma nova solicitação.
- `GET /solicitation/{id}`: Retorna os detalhes de uma única solicitação.
- `PUT /solicitation/{id}`: Atualiza os detalhes de uma solicitação.
- `DELETE /solicitation/{id}`: Exclui uma solicitação.

- **Posts**
- `POST /posts`: Cria um novo post.
- `GET /posts/{id}`: Retorna os detalhes de um único post.
- `PUT /posts/{id}`: Atualiza os detalhes de um post.
- `DELETE /posts/{id}`: Exclui um post.

- **Comments**   
- `POST /comments`: Cria um novo comentário.
- `GET /comments/{id}`: Retorna os detalhes de um único comentário.
- `PUT /comments/{id}`: Atualiza os detalhes de um comentário.
- `DELETE /comments/{id}`: Exclui um comentário.

- **Likes**
- `POST /likes`: Adiciona um like a um post.
- `DELETE /likes/{id}`: Remove um like de um post.

- **Login**
- `POST /login`: Autentica um usuário e retorna seus detalhes.

- **Comunidados**
- `POST /comunidados`: Cria um novo comunicado.
- `GET /comunidados/{id}`: Retorna os detalhes de um único comunicado.
- `GET /comunidados/`: Retorna todos os comunicados.

