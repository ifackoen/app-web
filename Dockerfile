FROM python:3.9
# FROM  python:3.9.4-slim 

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# RUN groupadd --gid 1000 app && \
#     useradd --create-home --gid 1000 --uid 1000 app

# RUN mkdir -p /home/app/src

# WORKDIR /home/app/src

# COPY . /home/app/src

# USER app

COPY . .

# install python dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# gunicorn
CMD ["gunicorn", "--config", "gunicorn-cfg.py", "run:app"]
