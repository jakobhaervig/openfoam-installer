# OpenFOAM Installer

After having followed this guide you will be able to:
- WSL and Ubuntu: Easily switch between (source) different OpenFOAM versions
- WSL: You will have easier access to your simulation data because your OpenFOAM run folder (``$WM_PROJECT_USER_DIR``) will be changed to reside on the Windows partition

## Preparation

### Step 1 (WSL users only): Installing WSL
- First, follow the [official guide](https://learn.microsoft.com/en-gb/windows/wsl/install) to install WSL.
- Go to Microsoft Store and install Ubuntu.
- Open the Ubuntu App and go through the installation process, e.g. choose WSL Ubuntu username and password.
- When referred to a terminal throughout this guide, open a WSL terminal.

### Step 2: Installing OpenFOAM
Open a terminal:
```
curl https://dl.openfoam.com/add-debian-repo.sh | sudo bash 
```
```
sudo apt-get update 
```

To install the latest version of OpenFOAM, do:
```
sudo apt-get install openfoam-default
```

Alternatively, you may choose to install a specific version, e.g.:
```
sudo apt-get install openfoam2312-default 
```

### Step 3: Download the script to set OpenFOAM paths
From within a terminal, type (copy/paste):

```
wget -P $HOME https://raw.githubusercontent.com/jakobhaervig/openfoam-wsl-workflow/main/.bash_aliases
```
Next, source your .bashrc file (or reopen the terminal):
```
source $HOME/.bashrc
```

## Selecting (sourcing) your preferred OpenFOAM version
Let's assume we have the following setup:
- OpenFOAM version installed: ``latest``

In a terminal you can now source OpenFOAM with paths set correctly by typing:

```
of
```

If you want another version than the latest, you can type:

```
of 2312
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

Your simulation should be running. When it's done you can find the results in your home folder, e.g. ``$HOME/openfoam-data`` (linux) or ``C:\Users\jakob\openfoam-data`` (Windows).
