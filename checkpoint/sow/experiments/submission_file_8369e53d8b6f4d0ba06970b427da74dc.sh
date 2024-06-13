#!/bin/bash

# Parameters
#SBATCH --cpus-per-task=10
#SBATCH --error=/nfs/homes/sow/mdetr_frugal/mdetr/checkpoint/sow/experiments/%j/%j_0_log.err
#SBATCH --gpus-per-node=1
#SBATCH --job-name=detectransformer
#SBATCH --mem=62GB
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --open-mode=append
#SBATCH --output=/nfs/homes/sow/mdetr_frugal/mdetr/checkpoint/sow/experiments/%j/%j_0_log.out
#SBATCH --signal=USR2@120
#SBATCH --time=4300
#SBATCH --wckey=submitit

# command
export SUBMITIT_EXECUTOR=slurm
srun --unbuffered --output /nfs/homes/sow/mdetr_frugal/mdetr/checkpoint/sow/experiments/%j/%j_%t_log.out --error /nfs/homes/sow/mdetr_frugal/mdetr/checkpoint/sow/experiments/%j/%j_%t_log.err /nfs/homes/sow/mdetr_frugal/my_mdetr_env/bin/python -u -m submitit.core._submit /nfs/homes/sow/mdetr_frugal/mdetr/checkpoint/sow/experiments/%j
