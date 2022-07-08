cmake_minimum_required(VERSION 3.20)
project(project)

set(CMAKE_CXX_STANDARD 14)

include_directories(lapack-3.10.0/LAPACKE/include)

add_executable(project example_DGETRI_rowmajor.c lapacke_example_aux.h lapacke_example_aux.c)
