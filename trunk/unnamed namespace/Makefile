
CFLAGS=-Wall

all:main

a.o:a.h a.cc
	g++ -o a.o -c a.cc -Wall

b.o:b.h b.cc
	g++ -o b.o -c b.cc -Wall

main:main.cc a.o b.o
	g++ -o main main.cc b.o a.o -Wall
