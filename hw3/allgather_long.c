#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <math.h>
#include <malloc.h>

int mod(int a, int b) {
  return a >= 0 ? a % b : (a + (-a / b + 1) * b) % b;
}

/****************************************
 buffer - send and receive buffers
 size - the size of data hold by each process before the allgather
 own_id - the id of the current process
 world_size - the total number of process
*/
void bkt_allgather(double *buffer, int size, int own_id, int world_size) {
    if (own_id % 2 == 0)
    for (int i = 0; i < world_size - 1; i++) {
      MPI_Send(buffer + mod(own_id - i, world_size) * size, size, MPI_DOUBLE, mod(own_id + 1, world_size), 0, MPI_COMM_WORLD);
      // MPI_Send(buffer + ((own_id - i) % world_size) * size, size, MPI_DOUBLE, (own_id + 1) % world_size, 0, MPI_COMM_WORLD);
      MPI_Recv(buffer + mod(own_id - i - 1, world_size) * size, size, MPI_DOUBLE, mod(own_id - 1, world_size), 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
      // MPI_Recv(buffer + ((own_id - i - 1) % world_size) * size, size, MPI_DOUBLE, (own_id - 1) % world_size, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
    }
    else 
      for (int i = 0; i < world_size - 1; i++) {
      MPI_Recv(buffer + mod(own_id - i - 1, world_size) * size, size, MPI_DOUBLE, mod(own_id - 1, world_size), 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
      MPI_Send(buffer + mod(own_id - i, world_size) * size, size, MPI_DOUBLE, mod(own_id + 1, world_size), 0, MPI_COMM_WORLD);
    }
}

// the size of the array must be a multiple of the number of processes
int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int size = atoi(argv[1]);
    
    int world_size, world_rank;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    int private_data_size = size / world_size;  // size of process's private data
    double *buffer = (double*) memalign(64, size * sizeof(double));  // buffer for all data

    for(int i = 0; i != size; ++i) buffer[i] = 0.0;
    for(int i = 0; i != private_data_size; ++i) buffer[i + private_data_size * world_rank] = world_rank * 1.0;  // fill private data with rank nnumber

    bkt_allgather(buffer, private_data_size, world_rank, world_size);
    
    // check correctness
    int correct = 1;
    for (int i = 0; i < world_size; i++) {
      for (int j = 0; j < private_data_size; j++) {
        int id = i * private_data_size + j;
        if (buffer[id] != i * 1.0) {
          printf("Process %d, %d-%d incorrect", world_rank, i, j);
          correct = 0;
        }
      }
    }

    if (correct == 1) {
      printf("node %d: correct", world_rank);
    }

    for(int i = 0; i != size; ++i) {
      printf("%lf ", buffer[i]);
    }
    printf("\n");
    free(buffer);
    
    MPI_Finalize();

    return 0;
}
