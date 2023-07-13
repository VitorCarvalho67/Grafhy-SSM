from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import Session
from mysql.connector import connect
from sqlalchemy import Column, Integer, String
from sqlalchemy import LargeBinary


Base = declarative_base()




class User(Base):
    __tablename__ = "users"

    id_users = Column(Integer, primary_key=True, index=True)
    name_users = Column(String, index=True)
    email_users = Column(String, index=True)
    password_users = Column(String)
    photo_users = Column(String)

    def to_dict(self):
        return {
            "id_users": self.id_users,
            "name_users": self.name_users,
            "email_users": self.email_users,
            "password_users": self.password_users,
            "photo_users": self.photo_users
        }


class Groups(Base):
    __tablename__ = "groups"

    id_groups = Column(Integer, primary_key=True, index=True)
    name_groups = Column(String, index=True)
    photo_groups = Column(String)
    description_groups = Column(String, index=True)

    def to_dict(self):
        return {
            "id_groups": self.id_groups,
            "name_groups": self.name_groups,
            "description_groups": self.description_groups,
            "photo_groups": self.photo_groups
        }


class MenssageGroup(Base):
    __tablename__ = "messages_grupo"

    id_messages_grupo = Column(Integer, primary_key=True, index=True)
    id_users = Column(Integer, index=True)
    id_groups = Column(Integer, index=True)
    message = Column(String, index=True)
    date_message = Column(String, index=True)

    def to_dict(self):
        return {
            "id_messages_grupo": self.id_messages_grupo,
            "id_users": self.id_users,
            "id_groups": self.id_groups,
            "message": self.message,
            "date_message": self.date_message
        }
    

class Comunicado_teste(Base):
    __tablename__ = "comunicados_teste"

    id_comunicados = Column(Integer, primary_key=True, index=True)
    title_comunicado = Column(String, index=True)
    message_comunicado = Column(String, index=True)
    date_message = Column(String, index=True)
    hash_arquivo = Column(String, index=True)
    

    def to_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}


class Solicitation(Base):
    __tablename__ = "solicitation"

    id_solicitation = Column(Integer, primary_key=True, index=True)
    id_users1 = Column(Integer, index=True)
    id_users2 = Column(Integer, index=True)

    def to_dict(self):
        return {
            "id_solicitation": self.id_solicitation,
            "id_users1": self.id_users1,
            "id_users2": self.id_users2
        }


class Contacts_users(Base):
    __tablename__ = "contacts_users"

    id_contacts = Column(Integer, primary_key=True, index=True)
    id_users1 = Column(Integer, index=True)
    id_users2 = Column(Integer, index=True)
    
    def to_dict(self):
        return {
            "id_contacts": self.id_contacts,
            "id_users1": self.id_users1,
            "id_users2": self.id_users2
        }
    
DATABASE_URL = "mysql+mysqlconnector://root:@localhost/grafhyPy?charset=utf8mb4"

engine = create_engine(DATABASE_URL)
Base.metadata.create_all(bind=engine)


def get_db():
    db = Session(bind=engine)
    try:
        yield db
    finally:
        db.close()


# create table comunicados_teste (
#   id_comunicados int not null auto_increment primary key,
#   title_comunicado varchar(255) not null,
#   message_comunicado varchar(255) not null,
#   date_message varchar(255) not null
#   hash_arquivo varchar(255) not null
# );
