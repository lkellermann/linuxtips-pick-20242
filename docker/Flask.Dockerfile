FROM python:3.12.7-alpine
RUN apk --update add git \
    && git clone https://github.com/lkellermann/LINUXtips-Giropops-Senhas.git /app && cd /app \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del git \
    && rm -rf .git \
    && rm -rf /var/lib/apt/lists/*
EXPOSE 5000
WORKDIR /app

ENTRYPOINT [ "flask"]
CMD [ "run", "--host=0.0.0.0" ]