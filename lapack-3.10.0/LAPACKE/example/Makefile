TOPSRCDIR = ../..
include $(TOPSRCDIR)/make.inc

.SUFFIXES: .c .o
.c.o:
	$(CC) $(CFLAGS) -I. -I../include -c -o $@ $<

.PHONY: all
all: xexample_DGESV_rowmajor \
     xexample_DGESV_colmajor \
     xexample_DGELS_rowmajor \
     xexample_DGELS_colmajor \
	 xexample_DGETRI_rowmajor

LIBRARIES = $(LAPACKELIB) $(LAPACKLIB) $(BLASLIB)

# Double Precision Examples
xexample_DGETRI_rowmajor: example_DGETRI_rowmajor.o lapacke_example_aux.o $(LIBRARIES)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $@ $^
	./$@


xexample_DGESV_rowmajor: example_DGESV_rowmajor.o lapacke_example_aux.o $(LIBRARIES)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $@ $^
	./$@

xexample_DGESV_colmajor: example_DGESV_colmajor.o lapacke_example_aux.o $(LIBRARIES)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $@ $^
	./$@

xexample_DGELS_rowmajor: example_DGELS_rowmajor.o lapacke_example_aux.o $(LIBRARIES)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $@ $^
	./$@

xexample_DGELS_colmajor: example_DGELS_colmajor.o lapacke_example_aux.o $(LIBRARIES)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $@ $^
	./$@

.PHONY: clean cleanobj cleanexe
clean: cleanobj cleanexe
cleanobj:
	echo $(LIBRARIES)
	rm -f *.o
cleanexe:
	rm -f x*
print:
	echo $(LAPACKELIB)
	echo $(LAPACKLIB)
	echo $(BLASLIB)
	echo $(CFLAGS)
	echo $(FC)
	echo $(FFLAGS)
	echo $(LDFLAGS)
