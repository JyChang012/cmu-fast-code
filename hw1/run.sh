rm rst.txt

./throughput_simd_add.1.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_add.2.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_add.3.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_add.4.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_add.5.x 100 >> rst.txt
echo >> rst.txt
./throughput_simd_add.6.x 100 >> rst.txt
echo >> rst.txt
cat rst.txt
