cmake_minimum_required(VERSION 3.20)
project(hw3 C)

set(CMAKE_C_STANDARD 99)
find_package(MPI)


add_executable(allgather_long allgather_long.c)
