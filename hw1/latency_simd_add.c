//
// Created by Jiayu Chang on 9/28/21.
//

#include <stdio.h>
#include <stdlib.h>
#include "immintrin.h"


// #define D256_ADD(dest, src) dest = _mm256_add_pd(dest, src);


#define D256_ADD(dest, src) \
__asm__ __volatile__ ( \
    "vaddpd %[rsrc1], %[rsrc2], %[rdest]\n"\
    :[rdest] "+x"(dest) \
    :[rsrc1] "x"(dest), [rsrc2] "x"(src) \
);


#define D256_ADD5(dest, src) \
    D256_ADD(dest, src) \
    D256_ADD(dest, src) \
    D256_ADD(dest, src) \
    D256_ADD(dest, src) \
    D256_ADD(dest, src)


#define D256_ADD25(dest, src) \
    D256_ADD5(dest, src) \
    D256_ADD5(dest, src) \
    D256_ADD5(dest, src) \
    D256_ADD5(dest, src) \
    D256_ADD5(dest, src)


#define D256_ADD125(dest, src) \
    D256_ADD25(dest, src) \
    D256_ADD25(dest, src) \
    D256_ADD25(dest, src) \
    D256_ADD25(dest, src) \
    D256_ADD25(dest, src)


#define D256_ADD625(dest, src) \
    D256_ADD125(dest, src) \
    D256_ADD125(dest, src) \
    D256_ADD125(dest, src) \
    D256_ADD125(dest, src) \
    D256_ADD125(dest, src)


#define D256_ADD3125(dest, src) \
    D256_ADD625(dest, src) \
    D256_ADD625(dest, src) \
    D256_ADD625(dest, src) \
    D256_ADD625(dest, src) \
    D256_ADD625(dest, src)

#define D256_ADD15625(dest, src) \
    D256_ADD3125(dest, src) \
    D256_ADD3125(dest, src) \
    D256_ADD3125(dest, src) \
    D256_ADD3125(dest, src) \
    D256_ADD3125(dest, src)

#define D256_ADD78125(dest, src) \
    D256_ADD15625(dest, src) \
    D256_ADD15625(dest, src) \
    D256_ADD15625(dest, src) \
    D256_ADD15625(dest, src) \
    D256_ADD15625(dest, src)


//timing routine for reading the time stamp counter
static __inline__ unsigned long long rdtsc(void) {
    unsigned hi, lo;
    __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));
    return ((unsigned long long) lo) | (((unsigned long long) hi) << 32);
}


//macro intrinsics for selected instruction
//replace the asm with the appropriate instruction
#define INSTRUCTION(dest, src)     \
   __asm__ __volatile__(           \
       "xor %[rsrc], %[rdest]\n"   \
   : [rdest] "+r"(dest)            \
   : [rsrc] "r"(src));


//replace these with appropriate frequencies on your machine
//used to scale timing as rdtsc measures clock cycle at base frequency.
#define MAX_FREQ    3.2
#define BASE_FREQ   2.4

//number of instructions in a dependent chain
#define NUM_INST    78125


void latency(
        double seed,
        double constant,
        int runs
) {
    unsigned long long t0, t1;
    __m256d x = _mm256_broadcast_sd(&seed);
    __m256d a = _mm256_broadcast_sd(&constant);
    unsigned long long sum = 0;

    for (int i = 0; i != runs; ++i) {
        //time instruction
        // You will need to replace INSTRUCTION with a chain of dependent instructions
        t0 = rdtsc();
        D256_ADD78125(x, a);
        t1 = rdtsc();

        sum += (t1 - t0);
    }
    printf("Verify: %llu\n", sum);  // required to prevent the compiler from optimizing it out
    printf("Latency: %lf\n",
           MAX_FREQ / BASE_FREQ * sum / (NUM_INST * runs));   //find the average latency over multiple runs
}

int main(int argc, char **argv) {
    int runs = atoi(argv[1]);

    double seed = rand() % 128;
    double constant = rand() % 128;

    latency(
            seed,
            constant,
            runs
    );
    return 0;
}

