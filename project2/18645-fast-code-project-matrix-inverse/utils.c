#include <stdio.h>
#include <stdlib.h>
#include "utils.h"


void* transpose_r2c(double *a, double *out, int m, int n) {
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            out[GET_CMJ(i, j, m, n)] = a[GET_RMJ(i, j, m, n)];
        }
    }
}

void* transpose_c2r(double *a, double *out, int m, int n) {
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            out[GET_RMJ(i, j, m, n)] = a[GET_CMJ(i, j, m, n)];
        }
    }
}

/* Auxiliary routine: printing a matrix */
void print_matrix_rowmajor( char* desc, int m, int n, double* mat) {
        int i, j;
        printf( "\n %s\n", desc );

        for( i = 0; i < m; i++ ) {
                for( j = 0; j < n; j++ ) printf( " %6.4f", mat[GET_RMJ(i, j, m, n)] );
                printf( "\n" );
        }
}


/* Auxiliary routine: printing a matrix */
void print_matrix_colmajor( char* desc, int m, int n, double* mat) {
        int i, j;
        printf( "\n %s\n", desc );

        for( i = 0; i < m; i++ ) {
                for( j = 0; j < n; j++ ) printf( " %6.4f", mat[GET_CMJ(i, j, m, n)]);
                printf( "\n" );
        }
}


int GET_CMJ(int i, int j, int m, int n) {
    return i + j * m;
}

int GET_RMJ(int i, int j, int m, int n) {
    return i * n + j;
}


