# expands directory when auto-completing
shopt -s direxpand

#function of source OpenFOAM installation. Usage e.g. "of 2212 jakob Jakob"
function of()
{
    if [ $# -eq 0 ]
    then
        echo "No OpenFOAM version specified as argument"
    fi

    if ! [ $# -eq 0 ]
    then
        if [ $# -eq 1 ]
        then
            user=$USER
            win_user=$USER
        elif [ $# -eq 2 ]
        then
            user=$2
            win_user=$2
        elif [ $# -eq 3 ]
        then
            user=$2
            win_user=$3
        fi

        path=/mnt/c/Users/$win_user/openfoam-data/$user-v$1
        echo Sourcing OpenFOAM v$1 with WM_PROJECT_USER_DIR=$path

        if [ ! -d $path ]
        then
            echo Creates $path/run
            mkdir -p $path/run
            echo Creates $path/applications
            mkdir -p $path/applications
        fi

        if ((${#1} == 4))
        then
            source /usr/lib/openfoam/openfoam$1/etc/bashrc WM_PROJECT_USER_DIR=$path
        else
            source /opt/openfoam$1/etc/bashrc WM_PROJECT_USER_DIR=$path
        fi
    fi
}