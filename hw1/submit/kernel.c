#include <stdio.h>
#include <stdlib.h>
#include "immintrin.h"
#define RMIDX(r, c, m, n) r *n + c
#define CMIDX(r, c, m, n) c *m + r

#define M 4
#define N 12

void kernel(
    int m,
    int n,
    int k,
    double *restrict a,
    double *restrict b,
    double *restrict c)
{
  __m256d vc0_0 = _mm256_load_pd(c + RMIDX(0, 0, M, N));
  __m256d vc0_1 = _mm256_load_pd(c + RMIDX(0, 4, M, N));
  __m256d vc0_2 = _mm256_load_pd(c + RMIDX(0, 8, M, N));
  __m256d vc1_0 = _mm256_load_pd(c + RMIDX(1, 0, M, N));
  __m256d vc1_1 = _mm256_load_pd(c + RMIDX(1, 4, M, N));
  __m256d vc1_2 = _mm256_load_pd(c + RMIDX(1, 8, M, N));
  __m256d vc2_0 = _mm256_load_pd(c + RMIDX(2, 0, M, N));
  __m256d vc2_1 = _mm256_load_pd(c + RMIDX(2, 4, M, N));
  __m256d vc2_2 = _mm256_load_pd(c + RMIDX(2, 8, M, N));
  __m256d vc3_0 = _mm256_load_pd(c + RMIDX(3, 0, M, N));
  __m256d vc3_1 = _mm256_load_pd(c + RMIDX(3, 4, M, N));
  __m256d vc3_2 = _mm256_load_pd(c + RMIDX(3, 8, M, N));
  for (int i = 0; i != k; ++i)
  {
    __m256d vb0 = _mm256_load_pd(b + RMIDX(i, 0, k, N));
    __m256d vb1 = _mm256_load_pd(b + RMIDX(i, 4, k, N));
    __m256d vb2 = _mm256_load_pd(b + RMIDX(i, 8, k, N));
    __m256d va = _mm256_broadcast_sd(a + CMIDX(0, i, M, k));
    vc0_0 = _mm256_fmadd_pd(va, vb0, vc0_0);
    vc0_1 = _mm256_fmadd_pd(va, vb1, vc0_1);
    vc0_2 = _mm256_fmadd_pd(va, vb2, vc0_2);
    va = _mm256_broadcast_sd(a + CMIDX(1, i, M, k));
    vc1_0 = _mm256_fmadd_pd(va, vb0, vc1_0);
    vc1_1 = _mm256_fmadd_pd(va, vb1, vc1_1);
    vc1_2 = _mm256_fmadd_pd(va, vb2, vc1_2);
    va = _mm256_broadcast_sd(a + CMIDX(2, i, M, k));
    vc2_0 = _mm256_fmadd_pd(va, vb0, vc2_0);
    vc2_1 = _mm256_fmadd_pd(va, vb1, vc2_1);
    vc2_2 = _mm256_fmadd_pd(va, vb2, vc2_2);
    va = _mm256_broadcast_sd(a + CMIDX(3, i, M, k));
    vc3_0 = _mm256_fmadd_pd(va, vb0, vc3_0);
    vc3_1 = _mm256_fmadd_pd(va, vb1, vc3_1);
    vc3_2 = _mm256_fmadd_pd(va, vb2, vc3_2);
  }
  _mm256_store_pd(c + RMIDX(0, 0, M, N), vc0_0);
  _mm256_store_pd(c + RMIDX(0, 4, M, N), vc0_1);
  _mm256_store_pd(c + RMIDX(0, 8, M, N), vc0_2);
  _mm256_store_pd(c + RMIDX(1, 0, M, N), vc1_0);
  _mm256_store_pd(c + RMIDX(1, 4, M, N), vc1_1);
  _mm256_store_pd(c + RMIDX(1, 8, M, N), vc1_2);
  _mm256_store_pd(c + RMIDX(2, 0, M, N), vc2_0);
  _mm256_store_pd(c + RMIDX(2, 4, M, N), vc2_1);
  _mm256_store_pd(c + RMIDX(2, 8, M, N), vc2_2);
  _mm256_store_pd(c + RMIDX(3, 0, M, N), vc3_0);
  _mm256_store_pd(c + RMIDX(3, 4, M, N), vc3_1);
  _mm256_store_pd(c + RMIDX(3, 8, M, N), vc3_2);
}