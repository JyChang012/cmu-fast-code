#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "immintrin.h"
#include "mkl_lapacke.h"
#include "utils.h"
#include "trsm_unblocked.h"


#define M 12  // 3 * 4
#define N 4

// solving Ly = b, where the diag elements of L is all one
// L(M, M), b and y (M, N)
// L is column major, b and y are row major

// for a system with 16 ymm register, the max  size M is 5
void trsm_unblock_unit_l(double *l, double *y) {
    __m256d y0_0 = _mm256_loadu_pd(y + 0);
    __m256d y0_1 = _mm256_loadu_pd(y + 4);
    __m256d y0_2 = _mm256_loadu_pd(y + 8);
    __m256d y1_0 = _mm256_loadu_pd(y + 12);
    __m256d y1_1 = _mm256_loadu_pd(y + 16);
    __m256d y1_2 = _mm256_loadu_pd(y + 20);
    __m256d y2_0 = _mm256_loadu_pd(y + 24);
    __m256d y2_1 = _mm256_loadu_pd(y + 28);
    __m256d y2_2 = _mm256_loadu_pd(y + 32);
    __m256d y3_0 = _mm256_loadu_pd(y + 36);
    __m256d y3_1 = _mm256_loadu_pd(y + 40);
    __m256d y3_2 = _mm256_loadu_pd(y + 44);

    // m shoudl be the inner loop
    // load l
    __m256d l0, l1, l2;
    __m256d s = _mm256_set_pd(-1.0, -1.0, -1.0, -1.0);

    
    l0 = _mm256_broadcast_sd(l + 1);
    l1 = _mm256_broadcast_sd(l + 2);
    l2 = _mm256_broadcast_sd(l + 3);
    l0 = _mm256_mul_pd(l0, s);
    l1 = _mm256_mul_pd(l1, s);
    l2 = _mm256_mul_pd(l2, s);
    y1_0 = _mm256_fmadd_pd(l0, y0_0 , y1_0);
    y1_1 = _mm256_fmadd_pd(l0, y0_1 , y1_1);
    y1_2 = _mm256_fmadd_pd(l0, y0_2 , y1_2);
    y2_0 = _mm256_fmadd_pd(l1, y0_0 , y2_0);
    y2_1 = _mm256_fmadd_pd(l1, y0_1 , y2_1);
    y2_2 = _mm256_fmadd_pd(l1, y0_2 , y2_2);
    y3_0 = _mm256_fmadd_pd(l2, y0_0 , y3_0);
    y3_1 = _mm256_fmadd_pd(l2, y0_1 , y3_1);
    y3_2 = _mm256_fmadd_pd(l2, y0_2 , y3_2);
    l0 = _mm256_broadcast_sd(l + 6);
    l1 = _mm256_broadcast_sd(l + 7);
    l0 = _mm256_mul_pd(l0, s);
    l1 = _mm256_mul_pd(l1, s);
    y2_0 = _mm256_fmadd_pd(l0, y1_0 , y2_0);
    y2_1 = _mm256_fmadd_pd(l0, y1_1 , y2_1);
    y2_2 = _mm256_fmadd_pd(l0, y1_2 , y2_2);
    y3_0 = _mm256_fmadd_pd(l1, y1_0 , y3_0);
    y3_1 = _mm256_fmadd_pd(l1, y1_1 , y3_1);
    y3_2 = _mm256_fmadd_pd(l1, y1_2 , y3_2);
    l0 = _mm256_broadcast_sd(l + 11);
    l0 = _mm256_mul_pd(l0, s);
    y3_0 = _mm256_fmadd_pd(l0, y2_0 , y3_0);
    y3_1 = _mm256_fmadd_pd(l0, y2_1 , y3_1);
    y3_2 = _mm256_fmadd_pd(l0, y2_2 , y3_2);
    

    _mm256_storeu_pd(y + 12, y1_0);
    _mm256_storeu_pd(y + 16, y1_1);
    _mm256_storeu_pd(y + 20, y1_2);
    _mm256_storeu_pd(y + 24, y2_0);
    _mm256_storeu_pd(y + 28, y2_1);
    _mm256_storeu_pd(y + 32, y2_2);
    _mm256_storeu_pd(y + 36, y3_0);
    _mm256_storeu_pd(y + 40, y3_1);
    _mm256_storeu_pd(y + 44, y3_2);


}

/* TODO: not finish
void tile_lu(double *a, int n, double *out) {  // tile a col major n*n matrix
    int end = 0;
    for (int c = 0; c < n; c+=N) {
        end = n * c;
        for (int c0 = 0; c0 < N; c0++)
            for (int r0 = 0; r0 < c; r0++) {
                out[end + GET_RMJ(r0, c0, c, N)] = a[end + GET_CMJ(r0, c0, n, N)];
            }

        end += c * N;

        for (int c1 = )

    }

}
*/

void trsm_l_scalar(double *l, double *y, int n, int m) {  // n*n, n*m, l col major, y row major
    for (int c = 1; c < n; c++) {
        for (int r = c; r < n; r++) {
            for (int i = 0; i < m; i++) {
                y[GET_RMJ(r, i, n, m)] -= (l[GET_CMJ(r, c - 1, n, n)] * y[GET_RMJ(c - 1, i, n, m)]);
            }
        }
    }
}


void trsm_u_scalar(double *l, double *y, int n, int m) {  // n*n, n*m, l col major, y row major
    for (int c = n - 2; c >= 0; c--) {
        for (int r = c; r >= 0; r--) {
            for (int i = 0; i < m; i++) {
                y[GET_RMJ(r, i, n, m)] -= (l[GET_CMJ(r, c + 1, n, n)] * y[GET_RMJ(c + 1, i, n, m)]);
            }
        }
    }
}

/*
int main() {
    srand(12
        // time(NULL)
        );
    double *l = malloc(N * N * sizeof(double)), *y_mine = malloc(N * M * sizeof(double));
    for (int i = 0; i < N * N; i++) {
        l[i] = rand() % 20;
    }
    for (int i = 0; i < N * M; i++) {
        y_mine[i] = rand() % 20;
    }
    double *y_real = malloc(N * M * sizeof(double));
    // memcpy(y_real, y_mine, 4 * 12 * sizeof(double));
    transpose_r2c(y_mine, y_real, N, M);
    print_matrix_rowmajor("mine", N, M, y_mine);
    print_matrix_colmajor("L", N, N, l);


    LAPACKE_dtrtrs(LAPACK_COL_MAJOR, 'U', 'N', 'U', N, M, l, N, y_real, N);
    // trsm_unblock_unit_l(l, y_mine);
    trsm_u_scalar(l, y_mine, N, M);

    print_matrix_rowmajor("mine", N, M, y_mine);
    print_matrix_colmajor("real", N, M, y_real);
    
    return 0;
}
*/
