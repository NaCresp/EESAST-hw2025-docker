FROM ubuntu:20.04

RUN apt-get update && apt-get install -y g++

COPY src/ /app/

WORKDIR /app

RUN g++ add.cpp -o add
RUN g++ mul.cpp -o mul

CMD ["./add", "1", "2"]