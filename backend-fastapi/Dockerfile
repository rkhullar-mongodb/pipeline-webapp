ARG PYTHON_VERSION=3.10
FROM python:${PYTHON_VERSION}-alpine
WORKDIR /root
COPY Pipfile ./
RUN pip install pipenv                   \
    && pipenv lock -r > requirements.txt \
    && pip install -r requirements.txt   \
    && rm requirements.txt
COPY *.py ./
COPY util/ util/
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
