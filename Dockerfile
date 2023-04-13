FROM python:3-alpine

WORKDIR /usr/src/app

RUN apk add --no-cache git

RUN pip install --upgrade pip 

COPY setup.py .

RUN echo "" > README.md && mkdir md2cf && ./setup.py egg_info && pip3 install -r md2cf.egg-info/requires.txt

COPY . .

RUN pip install .

ENTRYPOINT [ "md2cf" ]
