#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <math.h>
#include "rdtsc.h"
#define max(a, b) a > b ? a : b
#define min(a, b) a < b ? a : b

int P;
unsigned int *IA;
unsigned int *JA;

/*
This function reads the input data. It populates the IA and JA arrays used to store the adjacency matrix of the graph in CSR (compressed sparse row) format.

The CSR is a sparse matrix format can be described with 3 arrays (A, IA, JA). In this assignment, you do not need the A array.

0. The length of IA is the number of vertices in the graph + 1. 
1. IA is an array that splits the JA array into multiple subarrays. Specifically, the (IA[k+1] - IA[k]) is the length of the k^{th} subarray of JA.
2. The k^{th} subarray of JA is the neighbor list for the k^{th} vertex. 

*/
void input()
{
    unsigned int num_IA = N + 1;
    unsigned int num_JA = NUM_A;

    P = atoi(getenv("OMP_NUM_THREADS"));
    IA = (unsigned int *)malloc((N + 1) * sizeof(unsigned int));
    JA = (unsigned int *)malloc(NUM_A * sizeof(unsigned int));

    for (unsigned int i = 0; i < num_IA; i++)
        scanf("%d", &IA[i]);
    for (unsigned int i = 0; i < num_JA; i++)
        scanf("%d", &JA[i]);
}

/*
This function computes the number of triangles in the graph

Description of algorithm:

1. A triangle is created with 3 vertices (x, y, z)
2. We assume that the vertices are numbered from 0 to N-1
3. The algorithm iterates over the vertices, and for each vertex (y) with a number i, 
      the algorithm checks if there is a triangle (x, y, z) where 
        x has a smaller number than i, and z has a larger number than i.

           

*/
unsigned int count_triangles(){
    unsigned int delta = 0;
    unsigned int it_per_t = max((int) ceil((N - 2.) / P), 1);

//The outer loop traverses over all the vertices. The iteration starts with vertex 1;
#pragma omp parallel num_threads(P) reduction(+:delta)
{
    int id = omp_get_thread_num();
    int start = 1 + id * it_per_t, end = min(N - 1, start + it_per_t);
    for (unsigned int i = start; i < end; i++)
    {

        unsigned int *curr_row_x = IA + i;
        unsigned int *curr_row_A = IA + i + 1;
        unsigned int num_nnz_curr_row_x = *curr_row_A - *curr_row_x;
        unsigned int *x_col_begin = (JA + *curr_row_x);
        unsigned int *x_col_end = x_col_begin;
        unsigned int *row_bound = x_col_begin + num_nnz_curr_row_x;
        unsigned int col_x_min = 0;
        unsigned int col_x_max = i - 1;

        while (x_col_end < row_bound && *x_col_end < col_x_max)
            ++x_col_end;

        x_col_end -= (*x_col_end > col_x_max || x_col_end == row_bound);

        unsigned int *y_col_begin = x_col_end + 1;
        unsigned int *y_col_end = row_bound - 1;
        unsigned int num_nnz_y = (y_col_end - y_col_begin) + 1;
        unsigned int num_nnz_x = (x_col_end - x_col_begin) + 1;

        unsigned int y_col_first = i + 1;
        unsigned int x_col_first = 0;
        unsigned int *y_col = y_col_begin;

        //this is where the real triangle counting begins.
        // we search through all possible vertices for x

        for (unsigned int j = 0; j < num_nnz_y; ++j, ++y_col)
        {

            unsigned int row_index_A = *y_col - y_col_first;
            unsigned int *x_col = x_col_begin;
            unsigned int num_nnz_A = *(curr_row_A + row_index_A + 1) - *(curr_row_A + row_index_A);
            unsigned int *A_col = (JA + *(curr_row_A + row_index_A));
            unsigned int *A_col_max = A_col + num_nnz_A;

            // this loop searches through all possible vertices for z.
            for (unsigned int k = 0; k < num_nnz_x && *A_col <= col_x_max; ++k)
            {

                unsigned int row_index_x = *x_col - x_col_first;
                while ((*A_col < *x_col) && (A_col < A_col_max))
                    ++A_col;
                delta += (*A_col == row_index_x);
                ++x_col;
            }
        }
    }
}
    return delta;

}

/*
This main function takes as input the number of runs. It reads the data through the input function and then computes the number of triangles. It prints at the end the average execution time for computing the number of triangles given a data set.
*/

int main(int argc, char **argv)
{
    int runs = atoi(argv[1]);
    tsc_counter t0, t1;

    input();

    long long sum1 = 0;

    for (unsigned int i = 0; i != runs; ++i)
    {
        unsigned int x = 0;

        RDTSC(t0);
        x = count_triangles();
        RDTSC(t1);
        if (x != 28339 && x != 6584 && x != 806) {
            printf("wrong answer!!!");
        }
        // printf("%u\n", x);
        sum1 += (COUNTER_DIFF(t1, t0, CYCLES));
    }

    free(IA);
    free(JA);

    // printf("Average Triangle Count time: %lf cycles\n", ((double)(sum1 / ((double)runs))));
    printf("%lf", ((double)(sum1 / ((double)runs))));}
