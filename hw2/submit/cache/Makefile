CC = gcc
CFLAGS = -O3 -std=c99

OBJS = morton.o 

%.o: %.c
	$(CC) $(CFLAGS) -mavx2 -c $< -o $@

compile: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -mavx driver.c  -o transpose.x -march=native

run:
	./transpose.x
	./transpose.x 1000  4 4

clean:
	rm -f *.x *~ *.o