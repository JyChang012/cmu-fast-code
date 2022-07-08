
rm rst.txt

./throughput_simd_fma.1.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_fma.2.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_fma.3.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_fma.4.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_fma.5.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_fma.6.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_fma.7.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_fma.8.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_fma.9.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_fma.10.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_fma.11.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_fma.12.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_fma.13.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_fma.14.x 100 >> rst.txt
echo >> rst.txt

cat rst.txt

