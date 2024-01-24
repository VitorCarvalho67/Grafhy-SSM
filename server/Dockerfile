FROM python:latest

WORKDIR /app/server

COPY requirements.txt /app/server

RUN python -m venv venv
RUN /bin/bash -c "source venv/bin/activate"

RUN venv/bin/pip install --upgrade pip

RUN venv/bin/pip install -r requirements.txt -i https://pypi.org/simple/

COPY . /app/server

EXPOSE 8000

# Execute o servidor usando o ambiente virtual
CMD ["venv/bin/uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
