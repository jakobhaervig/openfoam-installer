# expands directory when auto-completing
shopt -s direxpand

#function to source OpenFOAM installation. Usage e.g. "of 2212 Jakob"
function of()
{
        if [ $# -eq 0 ]
        then
            echo "Sourcing OpenFOAM latest with WM_PROJECT_USER_DIR=$path"
        fi

            then
                if [ $# -eq 1 ]
                then
                    user=$USER
                    win_user=$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')
                elif [ $# -eq 2 ]
                then
                    user=$USER
                    win_user=$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')
                fi

                if [[ $(grep -i Microsoft /proc/version) ]]; 
                then
                    echo "Bash seems to be running on Windows Subsystem for Linux (WSL)."
                    path=/mnt/c/Users/$win_user/openfoam-data/$user-v$1
                else
                    echo "Bash seems to running natively on Linux"
                    path=$HOME/openfoam-data/$user-v$1
                fi
                echo "Home folder expected at $path"                 
                echo "Sourcing OpenFOAM v$1 with WM_PROJECT_USER_DIR=$path"

                if [ ! -d $path ]
                then
                    echo "Creates $path/run"
                    mkdir -p $path/run
                    echo "Creates $path/applications"
                    mkdir -p $path/applications
                fi

                if ((${#1} == 4))
                then
                    source /usr/lib/openfoam/openfoam$1/etc/bashrc WM_PROJECT_USER_DIR=$path
                else
                    source /opt/openfoam$1/etc/bashrc WM_PROJECT_USER_DIR=$path
                fi
            fi
    fi




    
}