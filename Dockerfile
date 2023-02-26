# For more information, please refer to https://aka.ms/vscode-docker-python
FROM --platform=linux/amd64 python:3.10-slim

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
RUN pip install -U pip
COPY requirements-deploy.txt .
RUN python -m pip install -r requirements-deploy.txt

WORKDIR /app
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information,
#please refer to https://aka.ms/vscode-docker-python-debug
CMD ["streamlit", "run", "src/emmaus_walking/app.py"]
