# expands directory when auto-completing
shopt -s direxpand

# function of source OpenFOAM installation. Usage e.g. "of 2212 jakob"
function of()
{
    if [ $# -eq 0 ]
    then
        echo "No OpenFOAM version specified as argument"
    fi

    if [ $# -eq 2 ]
    then
        user=$2
        win_user=$3
    else
        user=$USER
        win_user=$USER
    fi

    if ((${#1} == 4))
    then
        source /usr/lib/openfoam/openfoam$1/etc/bashrc WM_PROJECT_USER_DIR="/mnt/c/Users/$win_user/openfoam-data/$user-v$1"
    else
        source /opt/openfoam$1/etc/bashrc WM_PROJECT_USER_DIR="/mnt/c/Users/$win_user/openfoam-data/$user-$1"
    fi
}
