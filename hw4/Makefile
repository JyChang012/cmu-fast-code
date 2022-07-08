run_small:
	gcc -O2 triangle.c -o triangle.x -std=c99 -DN=6474 -DNUM_A=25144 -fopenmp
	cat small_IA.txt small_JA.txt | ./triangle.x 100

run_medium:
	gcc -O2 triangle.c -o triangle.x -std=c99 -DN=9877 -DNUM_A=51946 -fopenmp
	cat medium_IA.txt medium_JA.txt | ./triangle.x 100

run_large:
	gcc -O2 triangle.c -o triangle.x -std=c99 -DN=22687 -DNUM_A=109410 -fopenmp
	cat large_IA.txt large_JA.txt | ./triangle.x 100


run_small_for:
	gcc -O2 tri_for.c -o tri_for.x -std=c99 -DN=6474 -DNUM_A=25144 -fopenmp
	cat small_IA.txt small_JA.txt | ./tri_for.x 100

run_medium_for:
	gcc -O2 tri_for.c -o tri_for.x -std=c99 -DN=9877 -DNUM_A=51946 -fopenmp
	cat medium_IA.txt medium_JA.txt | ./tri_for.x 100

run_large_for:
	gcc -O2 tri_for.c -o tri_for.x -std=c99 -DN=22687 -DNUM_A=109410 -fopenmp
	cat large_IA.txt large_JA.txt | ./tri_for.x 100

run_small_par:
	gcc -O2 tri_par.c -o tri_par.x -std=c99 -lm -DN=6474 -DNUM_A=25144 -fopenmp
	cat small_IA.txt small_JA.txt | ./tri_par.x 100

run_medium_par:
	gcc -O2 tri_par.c -o tri_par.x -std=c99 -lm -DN=9877 -DNUM_A=51946 -fopenmp
	cat medium_IA.txt medium_JA.txt | ./tri_par.x 100

run_large_par:
	gcc -O2 tri_par.c -o tri_par.x -std=c99 -lm -DN=22687 -DNUM_A=109410 -fopenmp
	cat large_IA.txt large_JA.txt | ./tri_par.x 100

run_small_task:
	gcc -O2 tri_task.c -o tri_task.x -std=c99 -DN=6474 -DNUM_A=25144 -fopenmp
	cat small_IA.txt small_JA.txt | ./tri_task.x 100

run_medium_task:
	gcc -O2 tri_task.c -o tri_task.x -std=c99 -DN=9877 -DNUM_A=51946 -fopenmp
	cat medium_IA.txt medium_JA.txt | ./tri_task.x 100

run_large_task:
	gcc -O2 tri_task.c -o tri_task.x -std=c99 -DN=22687 -DNUM_A=109410 -fopenmp
	cat large_IA.txt large_JA.txt | ./tri_task.x 100


run_small_dyn:
	gcc -O2 tri_dyn.c -o tri_dyn.x -std=c99 -DN=6474 -DNUM_A=25144 -fopenmp
	cat small_IA.txt small_JA.txt | ./tri_dyn.x 100

run_medium_dyn:
	gcc -O2 tri_dyn.c -o tri_dyn.x -std=c99 -DN=9877 -DNUM_A=51946 -fopenmp
	cat medium_IA.txt medium_JA.txt | ./tri_dyn.x 100

run_large_dyn:
	gcc -O2 tri_dyn.c -o tri_dyn.x -std=c99 -DN=22687 -DNUM_A=109410 -fopenmp
	cat large_IA.txt large_JA.txt | ./tri_dyn.x 100

run_small_one:
	gcc -O2 tri_one.c -o tri_one.x -std=c99 -DN=6474 -DNUM_A=25144 -fopenmp
	cat small_IA.txt small_JA.txt | ./tri_one.x 100

run_medium_one:
	gcc -O2 tri_one.c -o tri_one.x -std=c99 -DN=9877 -DNUM_A=51946 -fopenmp
	cat medium_IA.txt medium_JA.txt | ./tri_one.x 100

run_large_one:
	gcc -O2 tri_one.c -o tri_one.x -std=c99 -DN=22687 -DNUM_A=109410 -fopenmp
	cat large_IA.txt large_JA.txt | ./tri_one.x 100

run_small_Noverp:
	gcc -O2 tri_Noverp.c -o tri_Noverp.x -std=c99 -DN=6474 -DNUM_A=25144 -fopenmp
	cat small_IA.txt small_JA.txt | ./tri_Noverp.x 100

run_medium_Noverp:
	gcc -O2 tri_Noverp.c -o tri_Noverp.x -std=c99 -DN=9877 -DNUM_A=51946 -fopenmp
	cat medium_IA.txt medium_JA.txt | ./tri_Noverp.x 100

run_large_Noverp:
	gcc -O2 tri_Noverp.c -o tri_Noverp.x -std=c99 -DN=22687 -DNUM_A=109410 -fopenmp
	cat large_IA.txt large_JA.txt | ./tri_Noverp.x 100


cleanup:
	rm -rf *~
	rm -rf *.x

