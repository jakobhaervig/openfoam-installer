# OpenFOAM workflow with WSL

After having installed on WSL (Windows Subsystem Linux) you may go ahead a follow this guide. After following this guide you will be able to:
- Easily switch (source) different OpenFOAM versions
- Easily access your simulation data because your openfoam run folder will be changed to reside on the Windows partition

## Preparation
From within the WSL terminal, type (copy/paste):

```
wget -P $HOME https://raw.githubusercontent.com/jakobhaervig/openfoam-wsl-workflow/main/.bash_aliases
```
Next, source your .bashrc file (or reopen the terminal):
```
source $HOME/.bashrc
```

## Sourcing your preferred OpenFOAM environment
Let's assume we have the following setup:
- OpenFOAM versions installed: ``2212``
- WSL Ubuntu username: ``jakob``
- Windows username: ``jakobhaervig``

Then we can source OpenFOAM with paths set correctly by:

`` of <of versions> <WSL Ubuntu username> <Windows username>``

e.g.

`` of 2212 jakob jakobhaervig ``

which 

