pipelineFolder="/users/fischerd/git/Snakemake8x_slurm_example"
projectFolder="/users/fischerd/git/Snakemake8x_slurm_example"
Profile=$projectFolder/config/Puhti

# Make Snakemake available 
################################################################################
module load snakemake/8.4.6

snakemake -s $pipelineFolder/workflow/Snakefile \
          --configfile $projectFolder/config/config.yaml \
          --profile $Profile \
          --cores 1 \
          --latency-wait 60 \
          --scheduler greedy \
          $@
