TOPSRCDIR = ./lapack/lapack-3.10.0/
include $(TOPSRCDIR)/make.inc

LIBRARIES = $(LAPACKELIB) $(LAPACKLIB) $(BLASLIB)

all:
	gcc main.c lapacke_example_aux.c lapacke_example_aux.h -I./lapack/lapack-3.10.0/LAPACKE/include -L$(LIBRARIES) --output inv_test.o