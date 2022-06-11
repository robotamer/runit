#!/bin/bash

if [[ "$(whoami)" != root ]]
then
  echo "Only user root can run this script."
  exit 1
fi

if [ -z "${USERNAME}" ] || [ "${USERNAME}" == "" ]
then
    echo 'chmod +x newUser.sh; export USERNAME=tamer; ./newUser.sh'
	echo replace username !!!
    exit 1
fi

APP=syncthing
BASEDIR="/home/${USERNAME}/service"

mkdir -p ${BASEDIR}/${APP}
cp run ${BASEDIR}/${APP}/

find ${BASEDIR}/${APP} -type d -exec chmod 750 {} \;
find ${BASEDIR}/${APP} -type f -exec chmod 640 {} \;

chown --preserve-root -R ${USERNAME}:users /home/${USERNAME} 
chmod +x ${BASEDIR}/${APP}/run
