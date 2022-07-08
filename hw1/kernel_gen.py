def main():
    m = 4
    n = 12

    head = """
#include <stdio.h>
#include <stdlib.h>
#include "immintrin.h"
#define RMIDX(r, c, m, n) r *n + c
#define CMIDX(r, c, m, n) c *m + r

#define M {}
#define N {}

void kernel(
    int m,
    int n,
    int k,
    double *restrict a,
    double *restrict b,
    double *restrict c)
{{
    {}
    for (int i = 0; i != k; ++i){{
        {}
    }}
    {}
}}

    """
    output = []
    add= []
    store = []

    for nn in range(n // 4):
        add.append('__m256d vb{} = _mm256_load_pd(b + RMIDX(i, {}, k, N));'.format(nn, nn * 4))

    for mm in range(m):
        add.append('va = _mm256_broadcast_sd(a + CMIDX({}, i, M, k));'.format(mm))
        if mm == 0:
            add[-1] = '__m256d ' + add[-1]
        for nn in range(n // 4):
            output.append('__m256d vc{}_{} = _mm256_load_pd(c + RMIDX({}, {}, M, N));'.format(mm, nn, mm, 4 * nn))
            
            add.append('vc{}_{} = _mm256_fmadd_pd(va, vb{}, vc{}_{});'.format(mm, nn, nn, mm, nn))

            store.append('_mm256_store_pd(c + RMIDX({}, {}, M, N), vc{}_{});'.format(mm, nn * 4, mm, nn))
    
    output = '\n'.join(output)
    add = '\n'.join(add)
    store = '\n'.join(store)

    print(head.format(m, n, output, add, store))

        

if __name__ == '__main__':
    main()