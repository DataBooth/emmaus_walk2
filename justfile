poetry config virtualenvs.in-project true
poetry install
poetry export -f requirements.txt --output requirements.txt

