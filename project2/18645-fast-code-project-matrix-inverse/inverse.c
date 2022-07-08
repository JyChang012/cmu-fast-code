#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "immintrin.h"
#include "mkl_lapacke.h"
#include "utils.h"
#include "lu_kernel_reuse.h"

// #define N 64
#define RUNS 100


static __inline__ unsigned long long rdtsc(void) {
  unsigned hi, lo;
  __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));
  return ( (unsigned long long)lo)|( ((unsigned long long)hi)<<32 );
}

int inverse(double *am, int n, double *out) {  // inverse am n * n mat, am is col mjr
    lu(am, n); // get lu decompose
    for (int i = 0; i < n; i++)  // set out = I
        for (int j = 0; j < n; j++)
            if (i == j)
                out[GET_RMJ(i, j, n, n)] = 1.;
            else
                out[GET_RMJ(i, j, n, n)] = 0.;

    trsm_l_scalar(am, out, n, n);

    // make u unit diagonal
    // print_matrix_colmajor("before unit", N, N, am);
    for (int r = 0; r < n; r++) {
        double div = am[GET_CMJ(r, r, n, n)];
        for (int c = 0; c < n; c++) {
            out[GET_RMJ(r, c, n, n)] /= div;
        }

        for (int c = r + 1; c < n; c++) {
            am[GET_CMJ(r, c, n, n)] /= div;
        }
    }
    // print_matrix_colmajor("after unit", N, N, am);

    trsm_u_scalar(am, out, n, n);

}


int main() {
    srand(12
    // time(NULL)
    );


    for (int N = 8; N < 513; N *= 2) {
            double am[N * N], ar[N * N], am_inv[N * N];
    for (int i = 0; i < N * N; i++) {
        am[i] = rand() % 10 + 1;
    }
    memcpy(ar, am, N * N * sizeof(double));

    unsigned long long start, end, sum = 0;

    for (int i = 0; i < RUNS; i++) {
        start = rdtsc();
        inverse(am, N, am_inv);
        end = rdtsc();
        sum += (end - start);
    }

    printf("mine: Average time: %lf cycles\n", ((double) (sum / ((double) RUNS))));

    // print_matrix_rowmajor("mine", N, N, am_inv);

    lapack_int ipiv[N];

    sum = 0;
    for (int i = 0; i < RUNS; i++) {
        start = rdtsc();
        LAPACKE_dgetrf(LAPACK_COL_MAJOR, N, N, ar, N, ipiv); // LU decompose
        LAPACKE_dgetri(LAPACK_COL_MAJOR, N, ar, N, ipiv);    // invert
        end = rdtsc();
        sum += (end - start);
    }
    // print_matrix_colmajor("real", N, N, ar);
    printf("lapacke: Average time: %lf cycles\n", ((double) (sum / ((double) RUNS))));
    }

    return 0;
}