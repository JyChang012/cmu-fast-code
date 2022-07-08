
int GET_CMJ(int i, int j, int m, int n);
int GET_RMJ(int i, int j, int m, int n);
void* transpose_r2c(double *a, double *out, int m, int n);
void* transpose_c2r(double *a, double *out, int m, int n);
void print_matrix_rowmajor( char* desc, int m, int n, double* mat);
void print_matrix_colmajor( char* desc, int m, int n, double* mat);
