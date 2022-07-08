with open('run_fma.sh', 'w') as f:
    for i in range(1, 12):
        f.write('./throughput_simd_fma.{}.x 100\necho\n'.format(i))

