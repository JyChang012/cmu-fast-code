
void pack_kernel(double *a, double *b, int k) {  // 6 * 4 kernel
    __m256d a0 = _mm256_load_pd(a), a1 = _mm256_load_pd(a + k), a2 = _mm256_load_pd(a + k * 2), a3 = _mm256_load_pd(a + k * 3), a4 = _mm256_load_pd(a + k * 4), a5 = _mm256_load_pd(a + k * 5);
    __m256d b0, b1, b2, b3, b4, b5, tmp;

    b0 = _mm256_shuffle_pd(a0, a1, 0);
    tmp = _mm256_shuffle_pd(a2, a3, 0);
    b0 = _mm256_permute2f128_pd(b0, tmp, 2 << 4);

    b1 = _mm256_shuffle_pd(a4, a5, 0);
    tmp = _mm256_shuffle_pd(a0, a1, 1 | 1 << 1);
    b1 = _mm256_permute2f128_pd(b1, tmp, 2 << 4);

    b2 = _mm256_shuffle_pd(a2, a3, 1 | 1 << 1);
    tmp = _mm256_shuffle_pd(a4, a5, 1 | 1 << 1);
    b2 = _mm256_permute2f128_pd(b2, tmp, 2 << 4);

    b3 = _mm256_shuffle_pd(a2, a3, 0);
    tmp = _mm256_shuffle_pd(a0, a1, 0);
    b3 = _mm256_permute2f128_pd(b3, tmp, 3 | 1 << 4);

    b4 = _mm256_shuffle_pd(a0, a1, 1 << 2| 1 << 3);
    tmp = _mm256_shuffle_pd(a4, a5, 0);
    b4 = _mm256_permute2f128_pd(b4, tmp, 3 | 1 << 4);

    b5 = _mm256_shuffle_pd(a4, a5, 1 << 2 | 1 << 3);
    tmp = _mm256_shuffle_pd(a2, a3, 1 << 2 | 1 << 3);
    b5 = _mm256_permute2f128_pd(b5, tmp, 3 | 1 << 4);

    _mm256_store_pd(b + 0, b0);
    _mm256_store_pd(b + 4, b1);
    _mm256_store_pd(b + 8, b2);
    _mm256_store_pd(b + 12, b3);
    _mm256_store_pd(b + 16, b4);
    _mm256_store_pd(b + 20, b5);
}

// pack a row major order matrix (mc x k) into
// (mc / m) panels that are each (m x k), and column major order
// m = 6
void pack(double* pack_a, double* a, int mc, int m, int k)
{
    for (int r = 0; r < mc; r += m) {
        for (int c = 0; c < k; c += 4) {
            pack_kernel(a + r * k + c, pack_a + r * k + c * m, k);
        }
    }
}
