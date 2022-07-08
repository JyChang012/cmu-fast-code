CC = gcc
CFLAGS = -O3 -std=c99

all: 
	$(CC) $(CFLAGS) $(OBJS) -mavx2 kernel_driver.c  -o mmm.x -march=native
run:
	./mmm.x

clean:
	rm -f *.x *~ *.o
