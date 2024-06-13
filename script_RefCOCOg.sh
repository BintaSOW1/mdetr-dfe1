#!/bin/bash
#SBATCH --job-name=RefCOCOg  # Nom de votre job
#SBATCH --output=output_RefCOCOg.txt  # Fichier de sortie
#SBATCH --error=error_RefCOCOg.txt    # Fichier d'erreur
#SBATCH --partition=GPU-A100  # Spécifier la partition GPU-A100 
#SBATCH --cpus-per-task=1    # Nombre de CPU par tâche
#SBATCH --gres=gpu:1         # Nombre de GPU requis
#SBATCH --mem=62GB           # Mémoire requise
#SBATCH --time=infinite       # Temps d'exécution maximal (hh:mm:ss)

# Chargez les modules nécessaires, activez votre environnement virtuel, etc.



source ../ad_mdetr_env/bin/activate
# Définissez CUDA_VISIBLE_DEVICES si nécessaire
export CUDA_VISIBLE_DEVICES=5

export TORCH_USE_CUDA_DSA=1
export CUDA_LAUNCH_BLOCKING=1

# Exécutez votre commande ou script Python
export SUBMITIT_EXECUTOR=slurm

# Commande Python pour exécuter le deuxième script sur Flickr
python -m torch.distributed.launch --nproc_per_node=2 --master_port=29507 --use_env main.py --output-dir RefCOCOg --dataset_config configs/refcocog.json --batch_size 4 --load pretrained_resnet101_checkpoint.pth --ema --text_encoder_lr 1e-5 --lr 5e-5

