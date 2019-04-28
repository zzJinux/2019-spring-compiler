CC = gcc

CFLAGS =

TARGET = 20131570

OBJS = main.o util.o lex.yy.o

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS) -lfl

main.o: main.c globals.h util.h scan.h
	$(CC) $(CFLAGS) -c main.c

util.o: util.c util.h globals.h
	$(CC) $(CFLAGS) -c util.c

lex.yy.o: lex/cminus.l scan.h util.h globals.h
	flex -o lex.yy.c lex/cminus.l
	$(CC) $(CFLAGS) -c lex.yy.c

clean:
	rm -rf $(TARGET) $(OBJS)
	rm lex.yy.c

all:
	$(TARGET)
