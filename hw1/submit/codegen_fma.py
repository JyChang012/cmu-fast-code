import numpy as np
import os
from numpy.core.fromnumeric import transpose

def main():
    head = \
        """
#include <stdio.h>
#include <stdlib.h>
#include "immintrin.h"

#define D256_FMA(src1, src2, dest) \\
__asm__ __volatile__ ( \\
    "vfmadd231pd %[rsrc1], %[rsrc2], %[rdest] \\n"\\
    :[rdest] "+x"(dest) \\
    :[rsrc1] "x"(src1), [rsrc2] "x"(src2) \\
);\n
        """
    
    tail = \
        """\n
//timing routine for reading the time stamp counter
static __inline__ unsigned long long rdtsc(void) {
    unsigned hi, lo;
    __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));
    return ((unsigned long long) lo) | (((unsigned long long) hi) << 32);
}


//replace these with appropriate frequencies on your machine
//used to scale timing as rdtsc measures clock cycle at base frequency.
#define MAX_FREQ    3.3
#define BASE_FREQ   2.4


void throughput(double a, double b, double c, int runs) {
    unsigned long long t0, t1;
    __m256d va[N_CHAINS], aa = _mm256_broadcast_sd(&a);
    for (int i = 0; i != N_CHAINS; i++)
        va[i] = aa;
    __m256d vb = _mm256_broadcast_sd(&b);
    __m256d vc = _mm256_broadcast_sd(&c);
    unsigned long long sum = 0;

    for (int i = 0; i != runs; i++) {
        t0 = rdtsc();
        CHAINS(vb, vc, va);
        t1 = rdtsc();

        sum += (t1 - t0);
    }

    printf("%lf", sum / runs * MAX_FREQ / BASE_FREQ);
    // printf("%lf", INS_PERCHAIN * NCHAINS / (sum / runs * MAX_FREQ / BASE_FREQ));
}


int main(int argc, char **argv) {
    int runs = atoi(argv[1]);

    double a = rand() % 128;
    double b = rand() % 128;
    double c = rand() % 128;

    throughput(
            a,
            b,
            c,
            runs
    );

    return 0;
}
        """

    head = [head]
    tail = [tail]
    chain_length = 3000
    n_chains = np.arange(1, 15)
    times = []

    for n in n_chains:
        mid = ['#define N_CHAINS {}\n#define CHAINS(src1, src2, dest)'.format(n)]
        for i in range(chain_length):
            for nn in range(n):
                mid.append('D256_FMA(src1, src2, dest[{}])'.format(nn))
        mid = head + mid + tail
        mid = ' '.join(mid)
        exe = 'throughput_simd_fma.{}.x'.format(n)
        src = 'throughput_simd_fma.{}.c'.format(n)
        with open(src, 'w') as f:
            f.write(mid)
        os.system('gcc -Wall -O1 -mavx {} -o {} -std=c99'.format(src, exe))
        # os.system('./{} 100'.format(exe))
        # print('\n')

    for n in n_chains:
        exe = 'throughput_simd_fma.{}.x'.format(n)
        os.system('./{} 100'.format(exe))
        print('')



if __name__ == '__main__':
    main()