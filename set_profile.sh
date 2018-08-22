## command: . set_profile.sh

## profile setting
if [ ! -f ~/func_profile ]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    cp ${DIR}/scripts/func_profile ~/
fi

## profile
. ~/.bashrc
profile tazo
