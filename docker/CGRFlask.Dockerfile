FROM cgr.dev/chainguard/python:latest-dev AS build
WORKDIR /app
RUN git clone https://github.com/lkellermann/LINUXtips-Giropops-Senhas.git /app && rm -rf .git
RUN python -m venv venv
ENV PATH="/app/venv/bin:$PATH"
RUN pip install --no-cache-dir -r requirements.txt

FROM cgr.dev/chainguard/python:latest AS app
WORKDIR /app
COPY --from=build /app /app
ENV PATH="/app/venv/bin:$PATH"
EXPOSE 5000
ENTRYPOINT [ "flask"]
CMD [ "run", "--host=0.0.0.0" ]