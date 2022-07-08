#include <stdio.h>
#include <lapacke.h>
#include "lapacke_example_aux.h"


int main() {
    double *mat = {1., 3.};
    lapack_int ipiv[2];
    lapack_int info, m = 2, n = 2;
    print_matrix_rowmajor("mat is", m, n, mat, m);
    info = LAPACKE_dgetrf(LAPACK_ROW_MAJOR, m, n, mat, m, ipiv);
    info = LAPACKE_dgetri(LAPACK_ROW_MAJOR, m, mat, n, ipiv);
    print_matrix_rowmajor("inv of mat is", m, n, mat, m);

}


