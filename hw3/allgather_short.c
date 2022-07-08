#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <math.h>
#include <malloc.h>

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int size = atoi(argv[1]);
    
    int world_size, world_rank;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    int psize = size / world_size;
    double *global = (double*) memalign(64, size * sizeof(double));
    double *temp = (double*) memalign(64, psize * sizeof(double));

    for(int i = 0; i != size; ++i) global[i] = 0.0;
    for(int i = 0; i != psize; ++i) temp[i] = world_rank * 1.0;

    // write your code here - should not be more than two lines
    // MPI_Allgather(temp, psize, MPI_DOUBLE, global, psize, MPI_DOUBLE, MPI_COMM_WORLD);
    MPI_Gather(temp, psize, MPI_DOUBLE, global, psize, MPI_DOUBLE, 0, MPI_COMM_WORLD);
    MPI_Bcast(global, size, MPI_DOUBLE, 0, MPI_COMM_WORLD);

    // check correctness
    int correct = 1;
    for (int i = 0; i < world_size; i++) {
      for (int j = 0; j < psize; j++) {
        int id = i * psize + j;
        if (global[id] != i * 1.0) {
          printf("Process %d, %d-%d incorrect", world_rank, i, j);
          correct = 0;
        }
      }
    }

    if (correct == 1) {
      printf("node %d: correct", world_rank);
    }
    
    
    for(int i = 0; i != size; ++i) {
      printf("%lf ", global[i]);
    }
    printf("\n");
    
    free(global);
    
    MPI_Finalize();

    return 0;
}
