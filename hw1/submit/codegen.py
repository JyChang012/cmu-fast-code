import numpy as np
import os

def main():
    head = \
        """
#include <stdio.h>
#include <stdlib.h>
#include "immintrin.h"

#define D256_ADD(dest, src) \\
__asm__ __volatile__ ( \\
    "vaddpd %[rsrc1], %[rsrc2], %[rdest]\\n"\\
    :[rdest] "+x"(dest) \\
    :[rsrc1] "x"(dest), [rsrc2] "x"(src) \\
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


void throughput(double seed, double constant, int runs) {
    unsigned long long t0, t1;
    __m256d x[N_CHAINS], xx = _mm256_broadcast_sd(&seed);
    for (int i = 0; i != N_CHAINS; i++)
        x[i] = xx;
    __m256d a = _mm256_broadcast_sd(&constant);
    unsigned long long sum = 0;

    for (int i = 0; i != runs; i++) {
        t0 = rdtsc();
        CHAINS(x, a);
        t1 = rdtsc();

        sum += (t1 - t0);
    }

    printf("%lf", sum / runs * MAX_FREQ / BASE_FREQ);
    // printf("%lf", INS_PERCHAIN * NCHAINS / (sum / runs * MAX_FREQ / BASE_FREQ));
}


int main(int argc, char **argv) {
    int runs = atoi(argv[1]);

    double seed = rand() % 128;
    double constant = rand() % 128;

    throughput(
            seed,
            constant,
            runs
    );

    return 0;
}
        """

    head = [head]
    tail = [tail]
    chain_length = 3000
    n_chains = np.arange(1, 10)
    times = []

    for n in n_chains:
        mid = ['#define N_CHAINS {}\n#define CHAINS(dest, src)'.format(n)]
        for i in range(chain_length):
            for nn in range(n):
                mid.append('D256_ADD(dest[{}], src)'.format(nn))
        mid = head + mid + tail
        mid = ' '.join(mid)
        src = 'throughput_simd_add.{}.c'.format(n)
        exe = 'throughput_simd_add.{}.x'.format(n)
        with open(src, 'w') as f:
            f.write(mid)
        os.system('gcc -Wall -O1 -mavx {} -o {} -std=c99'.format(src, exe))
        # stream = os.popen('./{} 100'.format(exe))
        # times.append(float(stream.read()))
    for n in n_chains:
        exe = 'throughput_simd_add.{}.x'.format(n)
        os.system('./{} 100'.format(exe))
        print('')
        


if __name__ == '__main__':
    main()