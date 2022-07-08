#include <stdio.h>
#include <stdlib.h>

int main() {
    unsigned int n = 4;
//    float matrixA[3][3] = {
//        {1, 2, 4},
//        {9, 4, 14},
//        {2, 6, 3} 
//    };
    
    float matrixA[4][4] = {
        {1, 2, 4, 5},
        {9, 4, 14, 7},
        {2, 6, 3, 12},
        {35, 15, 9, 50}
    };
    
    printf("MatrixA:\n");
    for(int i=0; i<n; i++) {
        for(int j=0;j<n;j++) {
            printf("%f ", matrixA[i][j]);
            if(j==n-1){
                printf("\n");
            }
        }
    }
    
    /* LU Calculation */
    /* Start with N by N matrix */
    int count = 0;
    
    while (count < n) {
        float a11 = matrixA[count][count];
        
        for (int i = 1; i + count < n; i++) {
            /* a21 := a21/alpha11 */
            matrixA[count+i][count] = matrixA[count+i][count] / a11;
            
            /* A22 := A22 - a21 * aT12 */
            for (int j = 1; j + count < n; j++) {
                matrixA[count+i][count+j] = matrixA[count+i][count+j] - matrixA[count+i][count] * matrixA[count][count+j];
            }
        }
        
        count += 1;
    }
    
    printf("LU Result:\n");
    for(int i=0; i<n; i++) {
        for(int j=0;j<n;j++) {
            printf("%f ", matrixA[i][j]);
            if(j==n-1){
                printf("\n");
            }
        }
    }
}
