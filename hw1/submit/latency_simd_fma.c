//
// Created by Jiayu Chang on 9/28/21.
//

#include <stdio.h>
#include <stdlib.h>
#include "immintrin.h"


// #define D256_FMA(src1, src2, dest) _mm256_fmadd_pd(src1, src2, dest);


#define D256_FMA(src1, src2, dest) \
__asm__ __volatile__ ( \
    "vfmadd231pd %[rsrc1], %[rsrc2], %[rdest]\n"\
    :[rdest] "+x"(dest) \
    :[rsrc1] "x"(src1), [rsrc2] "x"(src2) \
);

/*
#define D256_FMA(src1, src2, dest) \
__asm__ __volatile__ ( \
    "vfmadd231pd %[rsrc1], %[rsrc2], %[rdest]\n"\
    :[rdest] "+x"(dest) \
    :[rsrc1] "x"(src1), [rsrc2] "x"(src2) \
);
*/


#define D256_FMA5(src1, src2, dest) \
    D256_FMA(src1, src2, dest) \
    D256_FMA(src1, src2, dest) \
    D256_FMA(src1, src2, dest) \
    D256_FMA(src1, src2, dest) \
    D256_FMA(src1, src2, dest)


#define D256_FMA25(src1, src2, dest) \
    D256_FMA5(src1, src2, dest) \
    D256_FMA5(src1, src2, dest) \
    D256_FMA5(src1, src2, dest) \
    D256_FMA5(src1, src2, dest) \
    D256_FMA5(src1, src2, dest)


#define D256_FMA125(src1, src2, dest) \
    D256_FMA25(src1, src2, dest) \
    D256_FMA25(src1, src2, dest) \
    D256_FMA25(src1, src2, dest) \
    D256_FMA25(src1, src2, dest) \
    D256_FMA25(src1, src2, dest)


#define D256_FMA625(src1, src2, dest) \
    D256_FMA125(src1, src2, dest) \
    D256_FMA125(src1, src2, dest) \
    D256_FMA125(src1, src2, dest) \
    D256_FMA125(src1, src2, dest) \
    D256_FMA125(src1, src2, dest)


#define D256_FMA3125(src1, src2, dest) \
    D256_FMA625(src1, src2, dest) \
    D256_FMA625(src1, src2, dest) \
    D256_FMA625(src1, src2, dest) \
    D256_FMA625(src1, src2, dest) \
    D256_FMA625(src1, src2, dest)

#define D256_FMA15625(src1, src2, dest) \
    D256_FMA3125(src1, src2, dest) \
    D256_FMA3125(src1, src2, dest) \
    D256_FMA3125(src1, src2, dest) \
    D256_FMA3125(src1, src2, dest) \
    D256_FMA3125(src1, src2, dest)

#define D256_FMA78125(src1, src2, dest) \
    D256_FMA15625(src1, src2, dest) \
    D256_FMA15625(src1, src2, dest) \
    D256_FMA15625(src1, src2, dest) \
    D256_FMA15625(src1, src2, dest) \
    D256_FMA15625(src1, src2, dest)


//timing routine for reading the time stamp counter
static __inline__ unsigned long long rdtsc(void) {
    unsigned hi, lo;
    __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));
    return ((unsigned long long) lo) | (((unsigned long long) hi) << 32);
}


//replace these with appropriate frequencies on your machine
//used to scale timing as rdtsc measures clock cycle at base frequency.
#define MAX_FREQ    3.2
#define BASE_FREQ   2.4

//number of instructions in a dependent chain
#define NUM_INST    78125


void latency(
        double a,
        double b,
        double c,
        int runs
) {
    unsigned long long t0, t1;
    __m256d va = _mm256_broadcast_sd(&a);
    __m256d vb = _mm256_broadcast_sd(&b);
    __m256d vc = _mm256_broadcast_sd(&c);
    unsigned long long sum = 0;

    for (int i = 0; i != runs; ++i) {
        //time instruction
        // You will need to replace INSTRUCTION with a chain of dependent instructions
        t0 = rdtsc();
        D256_FMA78125(va, vb, vc);
        t1 = rdtsc();

        sum += (t1 - t0);
    }
    printf("Verify: %llu\n", sum);  // required to prevent the compiler from optimizing it out
    printf("Latency: %lf\n",
           MAX_FREQ / BASE_FREQ * sum / (NUM_INST * runs));   //find the average latency over multiple runs
}

int main(int argc, char **argv) {
    int runs = atoi(argv[1]);

    double a = rand() % 128;
    double b = rand() % 128;
    double c = rand() % 128;

    latency(
            a,
            b,
            c,
            runs
    );

    return 0;
}

