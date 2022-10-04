FROM python:3.10.1-alpine3.15
LABEL maintainer="pdsv88@gmail.com"

# para printar output direto no console sem buferizar
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
COPY ./src /src

WORKDIR /src

#porta para acessar a aplicação
EXPOSE 8000

# para deixar a imagem mais leve, e não criar uma Layer para
# cada RUN usar && \ e fazer todos os comandos juntos
RUN apk update
RUN python -m venv /venv
RUN /venv/bin/pip install --upgrade pip
RUN /venv/bin/pip install -r /requirements.txt


# adiciona o venv py
ENV PATH="/venv/bin:$PATH"
