#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include "immintrin.h"
#include "mkl_lapacke.h"

// matrixA --> N*N
// tmp kernel --> 4 * 12
int lu_kernel(double *matrixA, int i, int m, int n, int N){
    __m256d a11 = _mm256_broadcast_sd(&matrixA[i*N + i]);

    __m256d a211 = _mm256_loadu_pd(&matrixA[i*N+m]); 
    __m256d a212 = _mm256_loadu_pd(&matrixA[i*N+m+4]);
    __m256d a213 = _mm256_loadu_pd(&matrixA[i*N+m+8]);

    // step1 -- division: a_21 = a_21 / a_11
    if (n==i+1){
        a211 = _mm256_div_pd (a211,a11);
        a212 = _mm256_div_pd (a212,a11);
        a213 = _mm256_div_pd (a213,a11);
    }

    // step2 -- load A22
    // A22 parts--12 registers

    __m256d A2211 = _mm256_loadu_pd(&matrixA[(n)*N+m]);
    __m256d A2212 = _mm256_loadu_pd(&matrixA[(n+1)*N+m]);
    __m256d A2213 = _mm256_loadu_pd(&matrixA[(n+2)*N+m]);
    __m256d A2214 = _mm256_loadu_pd(&matrixA[(n+3)*N+m]);

    __m256d A2221 = _mm256_loadu_pd(&matrixA[(n)*N+m+4]);
    __m256d A2222 = _mm256_loadu_pd(&matrixA[(n+1)*N+m+4]);
    __m256d A2223 = _mm256_loadu_pd(&matrixA[(n+2)*N+m+4]);
    __m256d A2224 = _mm256_loadu_pd(&matrixA[(n+3)*N+m+4]);

    __m256d A2231 = _mm256_loadu_pd(&matrixA[(n)*N+m+8]);
    __m256d A2232 = _mm256_loadu_pd(&matrixA[(n+1)*N+m+8]);
    __m256d A2233 = _mm256_loadu_pd(&matrixA[(n+2)*N+m+8]);
    __m256d A2234 = _mm256_loadu_pd(&matrixA[(n+3)*N+m+8]);
    
    // step3 -- outer product: a_21 * a_12^T
    
    __m256d a12t = _mm256_broadcast_sd(&matrixA[(n)*N+i]); // 

    A2211 = _mm256_fmsub_pd (a12t, a211, A2211);
    A2221 = _mm256_fmsub_pd (a12t, a212, A2221);
    A2231 = _mm256_fmsub_pd (a12t, a213, A2231);
    a12t = _mm256_broadcast_sd(&matrixA[(n+1)*N+i]);
    A2212 = _mm256_fmsub_pd (a12t, a211, A2212);
    A2222 = _mm256_fmsub_pd (a12t, a212, A2222);
    A2232 = _mm256_fmsub_pd (a12t, a213, A2232);
    a12t = _mm256_broadcast_sd(&matrixA[(n+2)*N+i]);
    A2213 = _mm256_fmsub_pd (a12t, a211, A2213);
    A2223 = _mm256_fmsub_pd (a12t, a212, A2223);
    A2233 = _mm256_fmsub_pd (a12t, a213, A2233);
    a12t = _mm256_broadcast_sd(&matrixA[(n+3)*N+i]);
    A2214 = _mm256_fmsub_pd (a12t, a211, A2214);
    A2224 = _mm256_fmsub_pd (a12t, a212, A2224);
    A2234 = _mm256_fmsub_pd (a12t, a213, A2234);
    
    // step4 -- * -1
    __m256d s =  _mm256_set_pd (-1.0, -1.0, -1.0, -1.0);

    A2211 = _mm256_mul_pd(A2211, s);
    A2221 = _mm256_mul_pd(A2221, s);
    A2231 = _mm256_mul_pd(A2231, s);

    A2212 = _mm256_mul_pd(A2212, s);
    A2222 = _mm256_mul_pd(A2222, s);
    A2232 = _mm256_mul_pd(A2232, s);

    A2213 = _mm256_mul_pd(A2213, s);
    A2223 = _mm256_mul_pd(A2223, s);
    A2233 = _mm256_mul_pd(A2233, s);

    A2214 = _mm256_mul_pd(A2214, s);
    A2224 = _mm256_mul_pd(A2224, s);
    A2234 = _mm256_mul_pd(A2234, s);
    
    // step5 -- save back
    
    _mm256_storeu_pd(&matrixA[i*N+m], a211);
    _mm256_storeu_pd(&matrixA[i*N+m+4], a212);
    _mm256_storeu_pd(&matrixA[i*N+m+8], a213);
    
    _mm256_storeu_pd(&matrixA[n*N+m], A2211);
    _mm256_storeu_pd(&matrixA[n*N+m+4], A2221);
    _mm256_storeu_pd(&matrixA[n*N+m+8], A2231);

    _mm256_storeu_pd(&matrixA[(n+1)*N+m], A2212);
    _mm256_storeu_pd(&matrixA[(n+1)*N+m+4], A2222);
    _mm256_storeu_pd(&matrixA[(n+1)*N+m+8], A2232);

    _mm256_storeu_pd(&matrixA[(n+2)*N+m], A2213);
    _mm256_storeu_pd(&matrixA[(n+2)*N+m+4], A2223);
    _mm256_storeu_pd(&matrixA[(n+2)*N+m+8], A2233);

    _mm256_storeu_pd(&matrixA[(n+3)*N+m], A2214);
    _mm256_storeu_pd(&matrixA[(n+3)*N+m+4], A2224);
    _mm256_storeu_pd(&matrixA[(n+3)*N+m+8], A2234);
    
}

int main(int argc, char** argv) {
    srand(time(NULL)); // randomize seed
    int N = atoi(argv[1]);

    double *matrixA, *correct;
    posix_memalign((void**) &matrixA, 64, N * N * sizeof(double));
    posix_memalign((void**) &correct, 64, N * N * sizeof(double));
    int *ipiv;
    // posix_memalign((void**) &ipiv, 256, 4 * sizeof(double));

    // col major
    for (int j=0;j<N;j++){
        for (int i=0;i<N;i++){
            matrixA[j*N+i] = rand()%(N*N);
        }
    }
    memcpy(correct, matrixA, N*N*sizeof(double));

    LAPACKE_dgetrf(LAPACK_COL_MAJOR, N, N, correct, N, ipiv);
    /*
    printf("Correct LU Result:\n");
    for(int i=0; i<N; i++) {
        for(int j=0;j<N;j++) {
            printf("%lf ", correct[j*N+i]);
            if(j==N-1){
                printf("\n");
            }
        }
    }
    */

    // row major print
    
    printf("MatrixA:\n");
    for(int i=0; i<N; i++) {
        for(int j=0;j<N;j++) {
            printf("%lf ", matrixA[j*N+i]);
            if(j==N-1){
                printf("\n");
            }
        }
    }
    
    
    /* LU Calculation */
    int rows_left = 0;
    int cols_left = 0;
  
    /* Start with N by N matrix */
    for (int i = 0; i < N; i++) {
        if (i<N-12){
            // kernel case
            for (int n = i+1; n < N; n+=4) {
                for (int m = i+1; m < N; m+=12) {
                    //printf("kernel!");
                    rows_left = fmin(4, N-n);
                    cols_left = fmin(12, N-m);
                    if (rows_left==4 && cols_left==12){
                        lu_kernel(matrixA, i, m, n, N);
                    } else if (cols_left<12 && n==i+1){
                        // scalar case
                        for (int m = N-cols_left; m < N; m++){
                            matrixA[i * N + m] = matrixA[i * N + m] / matrixA[i * N + i]; // n--col major
                            for (int n = i+1; n<N; n++){
                                matrixA[n * N + m] = matrixA[n * N + m] - matrixA[i * N + m] * matrixA[n * N + i];
                            }
                        }
                    } else if (rows_left<4 && cols_left<12){
                        for (int m = i+1; m < N-cols_left; m++){
                            for (int n = N-rows_left; n < N; n++) {
                                matrixA[n * N + m] = matrixA[n * N + m] - matrixA[i * N + m] * matrixA[n * N + i];
                            }
                        }
                    }
                }
            }
        } else {
            for (int m = i+1; m < N; m++) {
                matrixA[i * N + m] = matrixA[i * N + m] / matrixA[i * N + i]; // n--col major
                for (int n = i+1; n < N; n++) {
                    matrixA[n * N + m] = matrixA[n * N + m] - matrixA[i * N + m] * matrixA[n * N + i];
                }
            }
        }
    }

    /* naive correctness */
    for (int i=0; i<N; i++){
            for (int m = i+1; m < N; m++) {
                correct[i * N + m] = correct[i * N + m] / correct[i * N + i]; // n--col major
                for (int n = i+1; n < N; n++) {
                    correct[n * N + m] = correct[n * N + m] - correct[i * N + m] * correct[n * N + i];
                }
            }
        }
    
    /*
    printf("correctness:\n");
    for(int i=0; i<N; i++) {
        for(int j=0;j<N;j++) {
            printf("%lf ", matrixA[j*N+i] - correct[j*N+i]);
            if(j==N-1){
                printf("\n");
            }
        }
    }
    */
    
    
    
    printf("LU Result:\n");
    for(int i=0; i<N; i++) {
        for(int j=0;j<N;j++) {
            printf("%lf ", matrixA[j*N+i]);
            if(j==N-1){
                printf("\n");
            }
        }
    }
    
}
