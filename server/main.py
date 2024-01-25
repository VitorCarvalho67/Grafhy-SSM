from fastapi import FastAPI, Depends, HTTPException, WebSocket
from fastapi.encoders import jsonable_encoder
from pydantic import BaseModel
import os
import io
from sqlalchemy.orm import Session
from models import get_db, User, Groups, MenssageGroup, Comunicado_teste, Solicitation, Contacts_users, Mensagens_users
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.exc import IntegrityError
from typing import List, Dict
from fastapi import UploadFile, File
from typing import Optional
from datetime import date
from fastapi import Form
from fastapi.responses import FileResponse
import base64

import hashlib
import minio
app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

client = minio.Minio(
    "minio:9000",
    "your_username",
    "your_pasword",
    region="garage",
    secure=False,
)
# para acessar a documentação do fastapi é só acessar o localhost:8000/docs

# JWT Token

# Define o esquema para o usuário


class UserBase(BaseModel):
    name_users: str
    email_users: str
    password_users: str
    photo_users: str


class UserCreate(UserBase):
    pass


class UserOut(UserBase):
    id_users: int


class UserLogin(BaseModel):
    email_users: str
    password_users: str


@app.post("/users/", response_model=UserOut)
def create_user(user: UserCreate, db: Session = Depends(get_db)):
    db_user = User(**user.dict())
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user.to_dict()

# get em um user com o email especifico
@app.get("/users/email/{email_users}", response_model=UserOut)
def read_user_email(email_users: str, db: Session = Depends(get_db)):
    db_user = db.query(User).filter(User.email_users == email_users).first()
    if db_user is None:
        raise HTTPException(status_code=404, detail="User not found")
    return db_user.to_dict()
 
# get em um user com o id especifico
@app.get("/users/id/{user_id}", response_model=UserOut)
def read_user_id(user_id: int, db: Session = Depends(get_db)):
    db_user = db.query(User).filter(User.id_users == user_id).first()
    if db_user is None:
        raise HTTPException(status_code=404, detail="User not found")
    return db_user.to_dict()

@app.get("/users/", response_model=List[UserOut])
def read_users(db: Session = Depends(get_db)):
    users = db.query(User).all()
    return [user.to_dict() for user in users]


@app.post("/login/", response_model=UserOut)
def login(user_login: UserLogin, db: Session = Depends(get_db)):
    db_user = db.query(User).filter(User.email_users == user_login.email_users).first()
    if db_user is None or db_user.password_users != user_login.password_users:
        raise HTTPException(status_code=400, detail="Invalid login details.")
    return db_user.to_dict()


@app.get("/users/{user_id}", response_model=UserOut)
def read_user(user_id: int, db: Session = Depends(get_db)):
    db_user = db.query(User).filter(User.id_users == user_id).first()
    if db_user is None:
        raise HTTPException(status_code=404, detail="User not found")
    return db_user.to_dict()


# parte dos grupos

class GroupBase(BaseModel):
    name_groups: str
    photo_groups: str
    description_groups: str


class GroupCreate(GroupBase):
    pass


class GroupOut(GroupBase):
    id_groups: int


@app.post("/groups/")
def create_group(group: GroupCreate, db: Session = Depends(get_db)):
    db_group = Groups(**group.dict())
    db.add(db_group)
    db.commit()
    db.refresh(db_group)
    return db_group.to_dict()


@app.get("/groups/{group_id}", response_model=GroupOut)
def read_group(group_id: int, db: Session = Depends(get_db)):
    db_group = db.query(Groups).filter(Groups.id_groups == group_id).first()
    if db_group is None:
        raise HTTPException(status_code=404, detail="Group not found")
    return db_group.to_dict()


# parte das mensagens dos grupos


class MenssageGroupBase(BaseModel):
    id_groups: int
    id_users: int
    message: str
    date_message: str


class MenssageGroupCreate(MenssageGroupBase):
    pass


class MenssageGroupOut(MenssageGroupBase):
    id_messages_grupo: int


@app.post("/menssages/")
def create_menssages(menssages: MenssageGroupCreate, db: Session = Depends(get_db)):
    db_menssages = MenssageGroup(**menssages.dict())
    db.add(db_menssages)
    try:
        db.commit()
    except IntegrityError:
        db.rollback()
        raise HTTPException(
            status_code=400, detail="User or group does not exist.")
    db.refresh(db_menssages)
    return db_menssages.to_dict()

# mostrar todas as mensagens e a data de um grupo


@app.get("/menssages/group/{menssages_id}", response_model=List[MenssageGroupOut])
def read_menssages_group(menssages_id: int, db: Session = Depends(get_db)):
    db_menssages = db.query(MenssageGroup).filter(
        MenssageGroup.id_groups == menssages_id).all()
    if db_menssages is None:
        raise HTTPException(status_code=404, detail="Menssages not found")
    return [menssages.to_dict() for menssages in db_menssages]


@app.get("/menssages/{menssages_id}", response_model=MenssageGroupOut)
def read_menssages(menssages_id: int, db: Session = Depends(get_db)):
    db_menssages = db.query(MenssageGroup).filter(
        MenssageGroup.id_menssages == menssages_id).first()
    if db_menssages is None:
        raise HTTPException(status_code=404, detail="Menssages not found")
    return db_menssages.to_dict()

# parte dos comunicados

# Comunicado teste


class comunicado_teste(BaseModel):
    title_comunicado: str
    message_comunicado: str
    date_message: str
    hash_arquivo: str


@app.post("/comunicado/", response_model=comunicado_teste)
async def criar_comunicado(message_comunicado: str = Form(...), title_comunicado: str = Form(...), file_arquivo: UploadFile = Form(None), db: Session = Depends(get_db)):
    date_message = date.today()

    if file_arquivo is not None:
        hash_arquivo = hashlib.sha256(
            f"{file_arquivo.filename}:::::::{date_message}".encode("UTF-8")).hexdigest()
        type_file = file_arquivo.filename.split(".")[-1]
        file_content = await file_arquivo.read()
        client.put_object(
            "grafhy", f"comunicados/{hash_arquivo}.{type_file}", io.BytesIO(file_content), file_content.__len__())
    else:
        file_content = None
        return {"error": 1, "sucess": False}

    db_comunicado = Comunicado_teste(
        title_comunicado=title_comunicado,
        message_comunicado=message_comunicado,
        date_message=date_message,
        hash_arquivo=hash_arquivo + "." + type_file)
    
    db.add(db_comunicado)
    db.commit()
    db.refresh(db_comunicado)
    return db_comunicado.to_dict()

# mostrar todas os comunicados imgs e a data

class comunicado_teste_out(comunicado_teste):
    id_comunicados: int
    message_comunicado: str
    date_message: str
    name_arquivo: Optional[str] = None
    type_arquivo: Optional[str] = None
    file_arquivo: Optional[bytes]= None

# uma rota que retorne um json com todos os comunicados e o arquivo em bytes, tipo e nome do arquivo
@app.get("/comunicado/", response_model=List[comunicado_teste_out])
async def get_comunicados(db: Session = Depends(get_db)):
    db_comunicados = db.query(Comunicado_teste).all()
    comunicados = []

    for db_comunicado in db_comunicados:
        comunicado = db_comunicado.to_dict()
        try:
            type_arquivo = comunicado['hash_arquivo'].split('.')[-1]
            name_arquivo = comunicado['hash_arquivo'].split('.')[-2]
            file_arquivo = client.get_object("grafhy", f"comunicados/{name_arquivo}.{type_arquivo}").read()

            # quero o file_arquivo em base64
            base64_bytes = base64.b64encode(file_arquivo)

            comunicado['name_arquivo'] = name_arquivo
            comunicado['type_arquivo'] = type_arquivo
            comunicado['file_arquivo'] = base64_bytes

        except Exception as e:
            print(f"Erro ao obter arquivo: {e}")
            comunicado['file_arquivo'] = None

        comunicados.append(comunicado)

    return comunicados


# a requisicao para o arquivo é feita assim:
# http://localhost:8000/comunicado/1
# o 1 é o id do comunicado
# o retorno é um json com o arquivo em bytes, tipo e nome do arquivo
@app.get("/comunicado/{id_comunicado}", response_model=comunicado_teste_out)
async def get_comunicado(id_comunicado: int, db: Session = Depends(get_db)):
    db_comunicado = db.query(Comunicado_teste).filter(Comunicado_teste.id_comunicados == id_comunicado).first()
    comunicado = db_comunicado.to_dict()
    try:
        file_content = client.get_object("grafhy", f"comunicados/{comunicado['hash_arquivo']}").read()

        print(file_content)
        comunicado['file_content'] = file_content
    except Exception as e:
        print(f"Erro ao obter arquivo: {e}")
        comunicado['file_content'] = None

    return comunicado


class Solicitation_Enter(BaseModel):
    id_users1: int
    id_users2: int

class Solicitation_Out(Solicitation_Enter):
    id_solicitation: int

@app.post("/solicitation/", response_model=Solicitation_Out)
def create_solicitation(solicitation: Solicitation_Enter, db: Session = Depends(get_db)):
    db_solicitation = Solicitation(**solicitation.dict())
    db.add(db_solicitation)
    db.commit()
    db.refresh(db_solicitation)
    return db_solicitation.to_dict()

# mostrar todas as solicitações de amizade de um usuário
@app.get("/solicitation/{user_id}", response_model=List[Solicitation_Out])
def read_solicitation(user_id: int, db: Session = Depends(get_db)):
    db_solicitation = db.query(Solicitation).filter(Solicitation.id_users2 == user_id).all()
    if db_solicitation is None:
        raise HTTPException(status_code=404, detail="Solicitation not found")
    return [solicitation.to_dict() for solicitation in db_solicitation]

# aceitar uma solicitação de amizade

class Contacts_users_Enter(BaseModel):
    id_users1: int
    id_users2: int
    response: bool


class Contacts_users_Out(Contacts_users_Enter):
    id_contacts: int


@app.post("/solicitation/accept", response_model=Contacts_users_Out)
def accept_solicitation(solicitation: Contacts_users_Enter, db: Session = Depends(get_db)):
    db_solicitation = db.query(Solicitation).filter(Solicitation.id_users1 == solicitation.id_users1).filter(Solicitation.id_users2 == solicitation.id_users2).first()
    if db_solicitation is None:
        raise HTTPException(status_code=404, detail="Solicitation not found")
    if solicitation.response == True:
        db_contacts_users = Contacts_users(id_users1=solicitation.id_users1, id_users2=solicitation.id_users2)
        db_contacts_users_reverse = Contacts_users(id_users1=solicitation.id_users2, id_users2=solicitation.id_users1)
        db.add(db_contacts_users_reverse)
        db.add(db_contacts_users)
        db.delete(db_solicitation)
        db.commit()
        db.refresh(db_contacts_users)
        response_dict = db_contacts_users.to_dict()
    else:
        db.delete(db_solicitation)
        db.commit()
        response_dict = db_solicitation.to_dict()

    # Include 'response' in the output
    response_dict["response"] = solicitation.response
    return response_dict

# mostrar todos os contatos de um usuário
class Contacts_user(BaseModel):
    id_users1: int
    id_users2: int

class Contacts_user_Out(Contacts_user):
    id_contacts: int

@app.get("/contacts/{user_id}", response_model=List[Contacts_user_Out])
def read_contacts(user_id: int, db: Session = Depends(get_db)):
    db_contacts = db.query(Contacts_users).filter(Contacts_users.id_users2 == user_id).all()
    if db_contacts is None:
        raise HTTPException(status_code=404, detail="Contacts not found")
    return [contacts.to_dict() for contacts in db_contacts]
    
# a requisicao para essa rota é feita assim:
# http://localhost:8000/solicitation/
# o body é um json com o id_users1, id_users2 e response
# "id_users1": 1,
# "id_users2": 2,
# "response": true


# envio de mensagens entre usuários

class Mensagens_users_Enter(BaseModel):
    id_users1: int
    id_users2: int
    message: str
    date_message: str

class Mensagens_users_Out(Mensagens_users_Enter):
    id_messages_users: int

@app.post("/message_user/", response_model=Mensagens_users_Out)
def create_message_user(mensagens_users: Mensagens_users_Enter, db: Session = Depends(get_db)):
    db_mensagens_users = Mensagens_users(**mensagens_users.dict())
    db.add(db_mensagens_users)
    db.commit()
    db.refresh(db_mensagens_users)
    return db_mensagens_users.to_dict()


# mostrar todas as mensagens e a data de um usuário enviado para outro usuário ou recebida de outro usuário

class Show_mensagens_users(Mensagens_users_Enter):
    id_users1: int
    id_users2: int

@app.get("/message_user/{user_id1}/{user_id2}", response_model=List[Show_mensagens_users])
def read_mensagens_users(user_id1: int, user_id2: int, db: Session = Depends(get_db)):
    db_mensagens_users = db.query(Mensagens_users).filter(Mensagens_users.id_users1 == user_id1).filter(Mensagens_users.id_users2 == user_id2).all()
    db_mensagens_users2 = db.query(Mensagens_users).filter(Mensagens_users.id_users1 == user_id2).filter(Mensagens_users.id_users2 == user_id1).all()

    if db_mensagens_users is None:
        raise HTTPException(status_code=404, detail="Menssages not found")
    if db_mensagens_users2 is None:
        raise HTTPException(status_code=404, detail="Menssages not found")
    return [mensagens_users.to_dict() for mensagens_users in db_mensagens_users] + [mensagens_users.to_dict() for mensagens_users in db_mensagens_users2]



