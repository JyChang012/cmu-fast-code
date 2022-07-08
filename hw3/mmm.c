#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <math.h>
#include <malloc.h>
#define GET_IDX_RMAJ(r, c, R, C) r * C + c
#define GET_IDX_CMAJ(r, c, R, C) c * R + r


// the size of the array must be a multiple of the number of processes in each dimension
int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int r = 2;  //number of rows of processors
    int c = 2;  //number of columns of processor
    
    int M = atoi(argv[1]);
    int N = atoi(argv[2]);

    int world_size, world_rank;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    int local_m = M/r;
    int local_n = N/c;

    int x_comm = (int) ceil(N * 1. / (r * c)), y_comm = (int) ceil(M * 1. / (r * c));  // numnber of elements to send for each processor possibly including zero padding 

    double *localx = (double*) memalign(64, x_comm * r * sizeof(double));
    double *localy = (double*) memalign(64, y_comm * c * sizeof(double));
    double *output = (double*) memalign(64, local_m * local_n * sizeof(double));


    // Create row and col communicator 

    
    int row_color = world_rank / c;
    int col_color = world_rank % c;

    //create row and column communicator based on colors
    MPI_Comm row_comm, col_comm;
    MPI_Comm_split(MPI_COMM_WORLD, row_color, world_rank, &row_comm);
    MPI_Comm_split(MPI_COMM_WORLD, col_color, world_rank, &col_comm);

    //find out row and column rank and sizes;
    int row_rank, row_size, col_rank, col_size;
    MPI_Comm_rank(row_comm, &row_rank);
    MPI_Comm_size(row_comm, &row_size);
    MPI_Comm_rank(col_comm, &col_rank);
    MPI_Comm_size(col_comm, &col_size);

    // Create output matrix A
    /*
    for(int i = 0; i != local_m *  local_n; ++i) 
	    output[i] = world_rank * 1.0;
      */
    for (int rr = 0; rr < local_m; rr++) {
      for (int cc = 0; cc < local_n; cc++) {
        output[GET_IDX_RMAJ(rr, cc, local_m, local_n)] = GET_IDX_RMAJ(row_color + rr * r, col_color + cc * c, M, N) * 1.;
      }
    }

    // int x_comm = N / (r * c) + (N % (r * c)), y_comm = M / (r * c) + (M % (r * c));  // numnber of elements to send for each processor

    double *my_x = (double*) memalign(64, x_comm * sizeof(double));
    double *my_y = (double*) memalign(64, y_comm * sizeof(double));
    int lmx = 0, lmy = 0;  // real length of myx and myy

    for (int i = GET_IDX_RMAJ(row_color, col_color, r, c) + 1; i <= N; i += r * c) {
      my_x[lmx] = i * 1.;
      lmx++;
    }

    for (int i = GET_IDX_CMAJ(row_color, col_color, r, c) + 1; i <= M; i += r * c) {
      my_y[lmy] = i * 1.;
      lmy++;
    }


    // Create input vector x that is distributed in a row major fashion
    // Initialize x with random values
    MPI_Allgather(my_x, x_comm, MPI_DOUBLE, localx, x_comm, MPI_DOUBLE, col_comm);

    // Create input vector y that is distributed in a column major fashion
    // Initialize y with random values  
    MPI_Allgather(my_y, y_comm, MPI_DOUBLE, localy, y_comm, MPI_DOUBLE, row_comm);


    //Perform your distributed outer product here
    // swap the order
    double *localx_sorted = (double*) memalign(64, x_comm * r * sizeof(double));
    double *localy_sorted = (double*) memalign(64, y_comm * c * sizeof(double));

    for (int i = 0; i < x_comm; i++){
      for (int j = 0; j < r; j++) {
          // double tmp = localx[GET_IDX_RMAJ(i, j, x_comm, r * c)];
          localx_sorted[GET_IDX_RMAJ(i, j, x_comm, r)] = localx[GET_IDX_RMAJ(j, i, r, x_comm)];
      }
    }


    for (int i = 0; i < y_comm; i++){
      for (int j = 0; j < c; j++) {
          // double tmp = localx[GET_IDX_RMAJ(i, j, x_comm, r * c)];
          localy_sorted[GET_IDX_RMAJ(i, j, y_comm, c)] = localy[GET_IDX_RMAJ(j, i, c, y_comm)];
      }
    }
  
  for (size_t i = 0; i < local_m; i++) {
    for (size_t j = 0; j < local_n; j++) {
      output[GET_IDX_RMAJ(i, j, local_m, local_n)] += localy_sorted[i] * localx_sorted[j];
    }
  }
  

    // Make sure everyone is done
    MPI_Barrier(MPI_COMM_WORLD);
    
    // only processor 0 prints its output
    if (world_rank == 0){
      for(int i = 0; i != local_m; ++i) {
        for(int j = 0; j != local_n; ++j) {
          printf("%lf ", output[i*local_n + j]);
        }
        printf("\n");
      }
      printf("\n");

    printf("\n\n\n\n");
    for (size_t i = 0; i < local_m; i++)
    {
      printf("%lf ", localy_sorted[i]);
    }
    printf("\n");
    for (size_t i = 0; i < local_n; i++)
    {
      printf("%lf ", localx_sorted[i]);
    }
    printf("\n");



    }

    free(output);
    free(localx);
    free(localy);
    free(localx_sorted);
    free(localy_sorted);
    
    MPI_Finalize();

    return 0;
}
