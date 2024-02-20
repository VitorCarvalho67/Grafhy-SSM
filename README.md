<h4 align="center">
    <p>
        <b>English</b> |
        <a href="https://github.com/VitorCarvalho67/Grafhy-SSM/blob/main/README_pt-br.md">Рortuguês</a>
      </p>
 </h4>

<p align="center">
  <img src="https://github.com/VitorCarvalho67/Grafhy-SSM/assets/102667323/a10aa288-747e-4b3f-9ca5-1d7da1fba175" alt="Imagem logo" />
</p>

# GRAFHY (social media)

[![GitHub license](https://img.shields.io/github/license/vitorcarvalho67/Grafhy-SSM)](vitorcarvalho67/Grafhy-SSM/blob/master/LICENSE)
![GitHub stars](https://img.shields.io/github/stars/vitorcarvalho67/Grafhy-SSM)
![Build Status](https://github.com/VitorCarvalho67/Grafhy-SSM/actions/workflows/ci.yml/badge.svg)
![GitHub languages top](https://img.shields.io/github/languages/top/vitorcarvalho67/Grafhy-SSM)
[![GitHub contributors](https://img.shields.io/github/contributors/VitorCarvalho67/Grafhy-SSM)](https://github.com/VitorCarvalho67/Grafhy-SSM/graphs/contributors)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/2e2a5e150f9b4af3b6c95070f6526e01)](https://app.codacy.com/gh/VitorCarvalho67/Grafhy-SSM/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

GRAFHY is a virtual communication platform that enables users to exchange messages, posts, and images. Furthermore, it offers features such as creating conversation groups, user login and registration, real-time encrypted messaging, message and post notifications, user profiles with photos, and encrypted passwords. Its MySQL database ensures efficient management of user interactions, making it a comprehensive and secure platform for online communication.

## Technology
- Python
- FastAPI
- MySQL
- Minio
- JavaScript
- Nginx
- Vue
- Docker-compose
- Tauri

## How To Use
```bash
git clone https://github.com/VitorCarvalho67/Grafhy-SSM.git
```

Navigate to the project directory on sever side
```bash
cd Grafhy-SSM/server
```

Create a virtual environment (venv) for the project
```bash
python -m venv venv
```

Activate the virtual environment.
On Windows:
```bash
.\venv\Scripts\activate
```

On macOS and Linux:
```bash
source venv/bin/activate
```

Install the project's dependencies from requirements.txt.
```bash
pip install -r requirements.txt
```

## Running the server side
```bash
uvicorn main:app --reload
```

## Running the client side
Navigate to the project directory on client side, install the dependencies and run the project

```bash
cd client
npm run dev
```

## Screenshots
<p align="center">
  <img src="https://github.com/VitorCarvalho67/Barium/assets/102667323/79d3aebc-ebba-43e0-9bec-19c4ccffd721"/>
</p>

## Running with docker

>[!IMPORTANT]
> remember to uncomment .env.example and remove .example from the file name.

```bash
sudo docker-compose build
sudo docker-compose up
# or 
sudo docker-compose up -d
```

## Contributing
Contributions to this project are welcome. Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes.
4. Push to the branch.
5. Submit a pull request.
