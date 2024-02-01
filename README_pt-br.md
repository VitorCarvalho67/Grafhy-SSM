<h4 align="center">
    <p>
        <b>Рortuguês</b> |
        <a href="https://github.com/VitorCarvalho67/Grafhy-SSM/blob/main/README.md">English</b> 
      </p>
 </h4>

<p align="center">
  <img src="https://github.com/VitorCarvalho67/Grafhy-SSM/assets/102667323/a10aa288-747e-4b3f-9ca5-1d7da1fba175" alt="Imagem logo" />
</p>

# GRAFHY (rede social)

[![GitHub license](https://img.shields.io/github/license/vitorcarvalho67/Grafhy-SSM)](vitorcarvalho67/Grafhy-SSM/blob/master/LICENSE) ![GitHub stars](https://img.shields.io/github/stars/vitorcarvalho67/Grafhy-SSM) ![GitHub stars](https://img.shields.io/github/languages/count/vitorcarvalho67/Grafhy-SSM) ![GitHub stars](https://img.shields.io/github/languages/top/vitorcarvalho67/Grafhy-SSM) ![GitHub stars](https://img.shields.io/github/repo-size/vitorcarvalho67/Grafhy-SSM) ![GitHub stars](https://img.shields.io/github/languages/code-size/vitorcarvalho67/Grafhy-SSM)

GRAFHY é uma plataforma de comunicação virtual que permite aos usuários trocar mensagens, publicações e imagens. Além disso, oferece recursos como a criação de grupos de conversa, login e registro de usuário, mensagens criptografadas em tempo real, notificações de mensagens e publicações, perfis de usuário com fotos e senhas criptografadas. Seu banco de dados MySQL garante a gestão eficiente das interações dos usuários, tornando-o uma plataforma abrangente e segura para comunicação online.

## Tecnologia
- Python
- FastAPI
- MySQL
- Minio
- JavaScript
- Nginx
- Vue
- Docker-compose
- Tauri

## Como usar
```bash
git clone https://github.com/VitorCarvalho67/Grafhy-SSM.git
```

Navegue até o diretório do projeto no lado do servidor
```bash
cd Grafhy-SSM/server
```

Crie um ambiente virtual (venv) para o projeto

```bash
python -m venv venv
``` 
Ative o ambiente virtual.
No Windows:

```bash
.\venv\Scripts\activate
```
No macOS e Linux:

```bash
source venv/bin/activate
```

Instale as dependências do projeto a partir do requirements.txt.

```bash 
pip install -r requirements.txt
```


## Executando o lado do servidor
```bash
uvicorn main:app --reload
```

## Executando o lado do cliente

Navegue até o diretório do projeto no lado do cliente, instale as dependências e execute o projeto

```bash
cd client
npm run dev
```

## Captura de tela 
<p align="center">
  <img src="https://github.com/VitorCarvalho67/Barium/assets/102667323/79d3aebc-ebba-43e0-9bec-19c4ccffd721"/>
</p>

## Executando com docker

>[!WARNING]
> lembre-se de descomentar .env.example e remover .example do nome do arquivo.


```bash
sudo docker-compose build
sudo docker-compose up
```
## Contribuindo
Contribuições para este projeto são bem-vindas. Por favor, siga estes passos para contribuir:

1. Faça um fork do repositório.
2. Crie uma nova branch para sua funcionalidade ou correção de bugs.
3. Faça commit das suas alterações.
4. Faça push para a branch.
5. Envie um pull request.
