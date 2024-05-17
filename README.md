# Snakemake8x_slurm_example

With the introduction of Snakemake8 the slurm and cluster-config has changed drastically so that old snakemake 7.x and older workflows do not work anymore. This is a minimal example on how to setup a new workflow. Further, I try to establish a best practise for configuring such a workflow (in the sense of best practise for me, what I find most intuitively to use).

Also, the script is prepared such that it uses a shell wrapper script to trigger the workflow.

# Installation

For, clone the repository to your disc

```
git clone XXX
```

# Setting up the profile
We will setup a default profile called "Puhti". For that, we create in our user folder a corresponding folder

```
mkdir -p ~/.config/snakemake/Puhti
```

The reason we put it there is, that Snakemake checks per default from that path for the existence of a profile. It is also possible to generate workflow specific profiles, then you could e.g. link the --profile address to another location, but I want to keep it as generic as possible, meaning once we have the profile created on the server, we can use it for any other workflow as well...

CHECK THAT THE SLURM LOG FOLDER IS CREATED; I DID IT NOW MANUALLY!!!!