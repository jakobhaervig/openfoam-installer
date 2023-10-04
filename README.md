# OpenFOAM workflow with WSL

After having installed on WSL (Windows Subsystem Linux) you may go ahead a follow this guide. After following this guide you will be able to:
- Easily switch (source) different OpenFOAM versions
- Easily access your simulation data because your openfoam run folder will be changed to reside on the Windows partition

## Preparation

### Step 1: Installing WSL
- First, follow the [official guide ](https://learn.microsoft.com/en-gb/windows/wsl/install) to install WSL.
- Go to Microsoft Store and install Ubuntu.
- Open the Ubuntu App and go through the installation process, e.g. choose WSL Ubuntu username and password.

### Step 2: Installing OpenFOAM
In a Ubuntu WSL terminal type:
```
curl https://dl.openfoam.com/add-debian-repo.sh | sudo bash 
```
```
sudo apt-get update 
```
```
sudo apt-get install openfoam2306-default 
```

### Step 3: Download the script to set OpenFOAM paths
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
- OpenFOAM version installed: ``2306``
- WSL Ubuntu username: ``jakob``
- Windows username: ``jakobhaervig``

Then we can source OpenFOAM with paths set correctly by:

```
of <of version> <WSL Ubuntu username> <Windows username>
```

e.g.

```
of 2306 jakob jakobhaervig
```

Now, if all is set up correctly, you can type:

```
run
```

```
cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/squareBend .
```

```
./Allrun
```

You simulation should be running.