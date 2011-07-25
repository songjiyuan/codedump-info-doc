
CXX_FLAGS=-Wall

all:main

a.o:a.h a.cc
	g++ -o a.o -c a.cc $(CXX_FLAGS)

b.o:b.h b.cc
	g++ -o b.o -c b.cc $(CXX_FLAGS)

main:main.cc a.o b.o
	g++ -o main main.cc a.o b.o $(CXX_FLAGS)
