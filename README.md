# Snakemake8x_slurm_example

With the introduction of Snakemake 8.x the slurm and cluster-config has changed drastically so that old snakemake 7.x and older workflows do not work anymore (at least for me...). This is a minimal example on how to setup a new workflow that uses slurm with default resources in a profile and then free to configure resources that can be used in rules. In case that no resources are provided in a rule, the default values are taken, otherwise the new predefined settings are picked. Hereby, I try to establish for me a best practise for configuring such a workflow (in the sense what I find most intuitively to use).

Also, the script is prepared such that it uses a shell wrapper script to trigger the workflow.

# Installation

For, clone the repository to your disc

```
git clone Snakemake8x_slurm_example
```

# Important files and folders

There are now a couple of important files in the repository

## Snakefile
The `Snakefile` contains the main functionality of the workflow and is located in the `workflow` folder. Obviously it defines a `rule all` to trigger the workflow and then I created three rules that the workflow consists of. Apparently the functionality is total non-sense, the important parts are the `resources`-section. You can see, I define here e.g. `time` or `partition` or keep it empty, depending on what I believe the rule needs.

## Profile
The cluster profile is stored in `profiles/Puhti/config.yaml`. Here it is important for own profiles, that the file need to be named `config.yaml`, only the folder where it is located in can change! The file itself defines then the executor I need, the default resource values as well as the submission command, using variables. 

Here, I define every singly argument that I want to pass to the server as a resource. This looks abit silly, but I have not found a better way to define e.g. the default input for `account`.

Further, the jobid uses global rule variables like `jobid` and `rule` to have more generic names for the jobs to help better error tracing in a real workflow. Also, please notice that the variable names in the default section do not need to be similar to the slurm variables, it is only important that the options in the call itself are exactly correct.

## Config
The configuration of the pipeline happens then in the file `config/config.yaml`. Here I would have now my whole pipeline configuration as well as the personal adjustments for the resource allocations, e.g for long running tasks, high memory and different partitions. 

## Starting wrapper
The `snakemake`-command itself is then wrapped into a shell script where I fist define important PATHs, e.g. where the pipeline is located and where the project is located (normally, I like to separate my pipeline installation and the configuration and starting parameters into the project folder). Also the path to the profile is given there. Here I give then the locations of the config file to `--configfile` and to the profile to `--profile`.

# Running the pipeline
After the parameters are adjusted to the local server environment, it should be possible to easly run the pipeline so that it submits the jobs to the slurm executor, just by typing

```
bash runExample.sh
```

In case no surm execution is wanted, it is enough to remove the `--profile`-option and all rules run locally. 

# Conclusion
At least for me that is currently the most intuitive way to use profiles and cluster configurations in Snakemake 8. In case you have questions, suggestions or comments, please feel free to reach out under daniel.fischer@luke.fi or by opening an issue here.
