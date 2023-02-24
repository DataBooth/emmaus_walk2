# See https://stackoverflow.com/questions/68673221/warning-running-pip-as-the-root-user
# for enhancements to Dockerfile e.g. not running as root & in venv

#FROM python:3.9.12
FROM python:3.10-slim-bullseye
RUN apt-get update && apt-get install -y

# remember to expose the port your app'll be exposed on.
EXPOSE 8080

RUN pip install -U pip

#TODO: Export requirements.txt from Poetry

COPY requirements-deploy.txt requirements.txt
RUN pip install -r requirements.txt

# copy into a directory of its own (so it isn't in the toplevel dir)
# RUN mkdir -p /app

#TODO: Fix the paths & data files

COPY src app/src
COPY data app/data
WORKDIR /app

# run it!
ENTRYPOINT ["streamlit", "run", "src/emmaus_wallking/app.py", "--server.port=8080", "--server.address=0.0.0.0"]