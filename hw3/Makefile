compile:
	mpicc -std=c99 allgather_long.c -o allgather_long.x
	# mpicc reduce_long.c -o reduce_long.x
	mpicc -std=c99 allgather_short.c -o allgather_short.x
	mpicc -std=c99 mmm.c -o mmm.x -lm

run:
	mpiexec -n 4 ./allgather_long.x 32
	# mpiexec -n 4 ./reduce_long.x 16 3
	mpiexec -n 4 ./allgather_short.x 16
	mpiexec -n 4 ./mmm.x 4 4

test_split:
	mpicc mpi_row_col.c -o mpi_row_col.x
	mpiexec -n 16 ./mpi_row_col.x 8

clean:
	rm -rf *.x *.o *~ \#*\#
