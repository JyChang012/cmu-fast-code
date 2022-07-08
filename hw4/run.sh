THREADS=('1' '2' '4' '8' '16' '24')
DATASET=('small' 'medium' 'large')
KEY=("for" "par" "task" "dyn" "one" "Noverp")


for para in "${KEY[@]}"; do
    for data in "${DATASET[@]}"; do
        for p in "${THREADS[@]}"; do
            export OMP_NUM_THREADS=$p
            make "run_${data}_${para}" -s
            echo
        done
    done
done