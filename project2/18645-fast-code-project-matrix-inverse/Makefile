
all: LU_Naive

LU_Naive: lu_naive.c
	gcc -O3 lu_naive.c -o LU_Naive.x -std=c99
	./LU_Naive.x
 
lu_kernel: lu_kernel.c
	gcc -O3 -I/opt/intel/mkl/include/ lu_kernel.c -o lu_kernel.x -mavx -mfma -std=c99 -lm -Wall
	./lu_kernel.x 4
	./lu_kernel.x 16

lu_timer: lu_kernel_timer.c
	gcc -O3 lu_kernel_timer.c -o lu_kernel_timer.x -mavx -mfma -std=c99 -lm -Wall
	./lu_kernel_timer.x 100

lu_lapack: lu_kernel_lapack.c
	cc -fopenmp -m64  -Wl,--start-group -I/opt/intel/mkl/include lu_kernel_lapack.c -o lu_kernel_lapack.x -L/opt/intel/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_core -Wl,--end-group -lmkl_gnu_thread -lpthread -lmkl_blas95_lp64 -lmkl_lapack95_lp64 -mavx -mfma -std=c99 -lm -Wall -ldl
	./lu_kernel_lapack.x 4

lu_kernel_reuse.o: lu_kernel_reuse.c lu_kernel_reuse.h
	gcc -O3 -c lu_kernel_reuse.c -mavx -mfma -std=c99 -lm -Wall

lu_kernel_reuse.x: lu_kernel_reuse.o
	gcc -O3 lu_kernel_reuse.o -o lu_kernel_reuse.x -mavx -mfma -std=c99 -lm -Wall
	./lu_kernel_reuse.x 4
	./lu_kernel_reuse.x 16

utils.o: utils.c utils.h
	cc -fopenmp -m64  -Wl,--start-group -I/opt/intel/mkl/include -c utils.c -L/opt/intel/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_core -Wl,--end-group -lmkl_gnu_thread -lpthread -lmkl_blas95_lp64 -lmkl_lapack95_lp64 -mavx -mfma -std=c99 -lm -Wall -ldl

trsm_unblocked.o: trsm_unblocked.h trsm_unblocked.c
	cc -fopenmp -m64  -Wl,--start-group -I/opt/intel/mkl/include -c trsm_unblocked.c -L/opt/intel/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_core -Wl,--end-group -lmkl_gnu_thread -lpthread -lmkl_blas95_lp64 -lmkl_lapack95_lp64 -mavx -mfma -std=c99 -lm -Wall -ldl

trsm_unblocked.x: trsm_unblocked.o utils.o
	cc -fopenmp -m64 -Wl,--start-group -I/opt/intel/mkl/include trsm_unblocked.o utils.o  -o trsm_unblocked.x -L/opt/intel/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_core -Wl,--end-group -lmkl_gnu_thread -lpthread -lmkl_blas95_lp64 -lmkl_lapack95_lp64 -mavx -mfma -std=c99 -lm -Wall -ldl -g
	./trsm_unblocked.x

inverse.x: trsm_unblocked.o utils.o lu_kernel_reuse.o inverse.c
	cc -fopenmp -m64 -Wl,--start-group -I/opt/intel/mkl/include trsm_unblocked.o utils.o lu_kernel_reuse.o inverse.c -o inverse.x -L/opt/intel/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_core -Wl,--end-group -lmkl_gnu_thread -lpthread -lmkl_blas95_lp64 -lmkl_lapack95_lp64 -mavx -mfma -std=c99 -lm -Wall -ldl -g
	./inverse.x


clean:
	rm -rf *.x *.o *~
