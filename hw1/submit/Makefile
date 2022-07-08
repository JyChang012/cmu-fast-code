all:
	# latency of add
	gcc -Wall -O1 -mavx latency_simd_add.c -o latency_simd_add.x -std=c99
	./latency_simd_add.x 100

	# latency of fma
	gcc -Wall -O1 -mavx latency_simd_fma.c -o latency_simd_fma.x -std=c99
	./latency_simd_fma.x 100

	# find throughput of add
	python codegen.py

	# find throughput of fma
	python codegen_fma.py

	# testing kernel...
	gcc -Wall -O3 kernel_driver.c kernel.c -o kernel.x -mavx -mfma -std=c99
	./kernel.x

clean:
	rm -rf *.x *~
