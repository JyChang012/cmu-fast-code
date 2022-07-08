cmake_minimum_required(VERSION 2.8)
project(hw1 C)

set(CMAKE_C_STANDARD 99)

add_executable(hw1 latency_simd_add.c latency_simd_fma.c)
