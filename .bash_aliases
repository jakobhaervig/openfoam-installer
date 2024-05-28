# expands directory when auto-completing
shopt -s direxpand

#function to source OpenFOAM installation. Usage e.g. "of 2312"
function of()
{
        if [ $# -eq 0 ]
        then
            source /usr/lib/openfoam/openfoam/etc/bashrc
            OFver=$WM_PROJECT_VERSION
        fi

        if [ $# -eq 1 ]
        then
            source /usr/lib/openfoam/openfoam$1/etc/bashrc
            OFver=$WM_PROJECT_VERSION
        fi

        # set path for user folder
        if [[ $(grep -i Microsoft /proc/version) ]]; 
        then
            user=$USER
            win_user=$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' 2>nul | sed -e 's/\r//g') 
            path=/mnt/c/Users/$win_user/openfoam-data/$user-$WM_PROJECT_VERSION
        else
            user=$USER
            path=$HOME/openfoam-data/$user-$WM_PROJECT_VERSION
        fi

        # sourcing openfoam
        source /usr/lib/openfoam/openfoam$1/etc/bashrc WM_PROJECT_USER_DIR=$path
        echo "Sourced OpenFOAM-$OFver with WM_PROJECT_USER_DIR=$path"
}