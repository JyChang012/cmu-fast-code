#include "stdlib.h"
#include "transposes.h"
#include "immintrin.h"


void kernel8x8(double *a, double *b) {  // kernel size 8 * 8
    __m256d a0 = _mm256_load_pd(a + 0), a1 = _mm256_load_pd(a + 4), a2 = _mm256_load_pd(a + 8), a3 = _mm256_load_pd(a + 12), a4 = _mm256_load_pd(a + 16), a5 = _mm256_load_pd(a + 20), a6 = _mm256_load_pd(a + 24), a7 = _mm256_load_pd(a + 28), a8 = _mm256_load_pd(a + 32), a9 = _mm256_load_pd(a + 36), a10 = _mm256_load_pd(a + 40), a11 = _mm256_load_pd(a + 44), a12 = _mm256_load_pd(a + 48), a13 = _mm256_load_pd(a + 52), a14 = _mm256_load_pd(a + 56), a15 = _mm256_load_pd(a + 60);
    a0 = _mm256_permute4x64_pd(a0, (2 << 2) | (1 << 4) | (3 << 6));
    a1 = _mm256_permute4x64_pd(a1, (2 << 2) | (1 << 4) | (3 << 6));
    a2 = _mm256_permute4x64_pd(a2, (2 << 2) | (1 << 4) | (3 << 6));
    a3 = _mm256_permute4x64_pd(a3, (2 << 2) | (1 << 4) | (3 << 6));
    a4 = _mm256_permute4x64_pd(a4, (2 << 2) | (1 << 4) | (3 << 6));
    a5 = _mm256_permute4x64_pd(a5, (2 << 2) | (1 << 4) | (3 << 6));
    a6 = _mm256_permute4x64_pd(a6, (2 << 2) | (1 << 4) | (3 << 6));
    a7 = _mm256_permute4x64_pd(a7, (2 << 2) | (1 << 4) | (3 << 6));
    a8 = _mm256_permute4x64_pd(a8, (2 << 2) | (1 << 4) | (3 << 6));
    a9 = _mm256_permute4x64_pd(a9, (2 << 2) | (1 << 4) | (3 << 6));
    a10 = _mm256_permute4x64_pd(a10, (2 << 2) | (1 << 4) | (3 << 6));
    a11 = _mm256_permute4x64_pd(a11, (2 << 2) | (1 << 4) | (3 << 6));
    a12 = _mm256_permute4x64_pd(a12, (2 << 2) | (1 << 4) | (3 << 6));
    a13 = _mm256_permute4x64_pd(a13, (2 << 2) | (1 << 4) | (3 << 6));
    a14 = _mm256_permute4x64_pd(a14, (2 << 2) | (1 << 4) | (3 << 6));
    a15 = _mm256_permute4x64_pd(a15, (2 << 2) | (1 << 4) | (3 << 6));
    _mm256_store_pd(b + 0, a0);
    _mm256_store_pd(b + 4, a4);
    _mm256_store_pd(b + 8, a8);
    _mm256_store_pd(b + 12, a12);
    _mm256_store_pd(b + 16, a1);
    _mm256_store_pd(b + 20, a5);
    _mm256_store_pd(b + 24, a9);
    _mm256_store_pd(b + 28, a13);
    _mm256_store_pd(b + 32, a2);
    _mm256_store_pd(b + 36, a6);
    _mm256_store_pd(b + 40, a10);
    _mm256_store_pd(b + 44, a14);
    _mm256_store_pd(b + 48, a3);
    _mm256_store_pd(b + 52, a7);
    _mm256_store_pd(b + 56, a11);
    _mm256_store_pd(b + 60, a15);

}

void morton(double *a, double *b,  int N){
    int len = N * N;
    if (N != 8 && N > 2) {
        morton(a, b, N / 2);
        morton(a + len / 4, b + len / 2, N / 2);
        morton(a + len / 2, b + len / 4, N / 2);
        morton(a + len * 3 / 4, b + len * 3 / 4, N / 2);
    } else if (N == 8) {  // N == 8
        kernel8x8(a, b);
    } else {  // if mat is smaller than kernel size
        __m256d vec_a = _mm256_load_pd(a);
        vec_a = _mm256_permute4x64_pd(vec_a, (2 << 2) | (1 << 4) | (3 << 6));
        _mm256_store_pd(b, vec_a);
    }
}

