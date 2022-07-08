#include <stdio.h>
#include <lapacke.h>
#include "lapacke_example_aux.h"

#define M 376
#define RUNS 100

//timing routine for reading the time stamp counter
static __inline__ unsigned long long rdtsc(void)
{
    unsigned hi, lo;
    __asm__ __volatile__("rdtsc"
                         : "=a"(lo), "=d"(hi));
    return ((unsigned long long)lo) | (((unsigned long long)hi) << 32);
}

int main()
{
    srand(time(NULL));
    int m;
    for (m = 2; m <= M; m++)
    {
        double *mat = (double *)malloc(m * m * sizeof(double));
        int i;
        unsigned long long sum = 0, t0, t1;
        for (i = 0; i < m * m; i++)
        {
            mat[i] = rand() % 20;
        }
        lapack_int ipiv[m];

        for (i = 0; i < RUNS; i++)
        {
            // print_matrix_rowmajor("mat is", m, m, mat, m);
            t0 = rdtsc();
            LAPACKE_dgetrf(LAPACK_ROW_MAJOR, m, m, mat, m, ipiv); // LU decompose
            // LAPACKE_dgetri(LAPACK_ROW_MAJOR, m, mat, m, ipiv);    // invert
            t1 = rdtsc();
            // print_matrix_rowmajor("inv of mat is", m, m, mat, m);
            sum += (t1 - t0);
        }
        sum /= RUNS;
        printf("%llu ", sum);
    }
    printf("\n");
}
