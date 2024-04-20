
FROM python:3.10

WORKDIR /app

COPY requirements.txt /app/

RUN apt update && apt upgrade -y
RUN apt install git python3-pip ffmpeg -y

heroku buildpacks:add --index 1 https://github.com/mojodna/heroku-buildpack-jemalloc.git
git push heroku master

COPY . .

RUN pip install -r requirements.txt

COPY . /app

CMD python3 bot.py
