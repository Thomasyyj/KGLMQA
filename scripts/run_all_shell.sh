#!/bin/bash

# Array of file names to execute
files=(
    run_greaselm_exp28_36.sh
    run_greaselm_exp3.sh
    run_greaselm_exp3_14.sh
    run_greaselm_exp28_37.sh
    run_greaselm_exp33.sh
    run_greaselm_exp3_14_nocat.sh
    run_greaselm_exp28_38.sh
    run_greaselm_exp33_29.sh
    run_greaselm_exp3_4.sh
    run_greaselm_exp19.sh
    run_greaselm_exp28_39.sh
    run_greaselm_exp33_30.sh
    run_greaselm_exp3_5.sh
    run_greaselm_exp2.sh
    run_greaselm_exp2_10.sh
    run_greaselm_exp33_31.sh
    run_greaselm_exp3_6.sh
    run_greaselm_exp20.sh
    run_greaselm_exp2_11.sh
    run_greaselm_exp33_32.sh
    run_greaselm_exp3_7.sh
    run_greaselm_exp21.sh
    run_greaselm_exp2_12.sh
    run_greaselm_exp33_34.sh
    run_greaselm_exp3_8.sh
    run_greaselm_exp22.sh
    run_greaselm_exp2_13.sh
    run_greaselm_exp33_35.sh
    run_greaselm_exp3_9.sh
    run_greaselm_exp23.sh
    run_greaselm_exp2_13_nocat.sh
    run_greaselm_exp33_36.sh
    run_greaselm_exp43.sh
    run_greaselm_exp24.sh
    run_greaselm_exp2_14.sh
    run_greaselm_exp33_37.sh
    run_greaselm_exp44.sh
    run_greaselm_exp28.sh
    run_greaselm_exp2_14_nocat.sh
    run_greaselm_exp33_38.sh
    run_greaselm_exp45.sh
    run_greaselm_exp28_29.sh
    run_greaselm_exp2_4.sh
    run_greaselm_exp33_39.sh
    run_greaselm_exp46.sh
    run_greaselm_exp28_30.sh
    run_greaselm_exp2_5.sh
    run_greaselm_exp3_10.sh
    run_greaselm_exp47.sh
    run_greaselm_exp28_31.sh
    run_greaselm_exp2_6.sh
    run_greaselm_exp3_11.sh
    run_greaselm_exp48.sh
    run_greaselm_exp28_32.sh
    run_greaselm_exp2_7.sh
    run_greaselm_exp3_12.sh
    run_greaselm_exp28_34.sh
    run_greaselm_exp2_8.sh
    run_greaselm_exp3_13.sh
    run_greaselm_exp28_35.sh
    run_greaselm_exp2_9.sh
    run_greaselm_exp3_13_nocat.sh
)

# Array of GPU device IDs (0-7)
gpu_ids=(0 1 2 3 4 5 6 7)

# Counter for GPU IDs
gpu_counter=0

# Counter for waiting
wait_counter=0

# Iterate through the 48 shell files
for i in {1..63}; do
  # Get the current GPU device IDs
  gpu1=${gpu_ids[gpu_counter]}
  gpu2=${gpu_ids[(gpu_counter + 1) % 8]}  # Wrap around if we reach the end

  # Launch the shell file with CUDA_VISIBLE_DEVICES set in the background
  CUDA_VISIBLE_DEVICES="$gpu1,$gpu2" ./${files[i-1]} csqa --data_dir ../data/ &
  
  # Increment the GPU counter
  ((gpu_counter = (gpu_counter + 2) % 8))
  
  # Increment the wait counter
  ((wait_counter++))

  # If 4 processes have been launched, wait for them to finish
  if [ $wait_counter -eq 4 ]; then
    wait  # Wait for all background processes to finish
    wait_counter=0  # Reset the wait counter
  fi
done

# Wait for any remaining background processes to finish
wait

