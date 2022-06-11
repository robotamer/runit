#!/bin/bash

if [[ "$(whoami)" != root ]]
then
  echo "Only user root can run this script."
  exit 1
fi

if [[ -z "${USERNAME}" ]] 
then
    echo 'chmod +x newUser.sh; export USERNAME=tamer; ./newUser.sh'
	echo replace username !!!
    exit 1
fi

BASEDIR="/etc/sv/users-${USERNAME}"
SUPERVISE="/var/service/users-${USERNAME}/supervise"

sv stop users-${USERNAME}

mkdir -p ${BASEDIR}
cp run ${BASEDIR}/
chmod +x ${BASEDIR}/run

if [[ -h /var/service/users-${USERNAME} ]]
then
	echo '[OK] simlink already exists, skipping' 
else
	echo "[OK] crating simlink: /var/service/users-${USERNAME}" 
	ln -s ${BASEDIR} /var/service
fi

sv start users-${USERNAME}

sleep 3 &

chmod 755 $SUPERVISE
chown ${USERNAME}  ${SUPERVISE}/ok ${SUPERVISE}/control ${SUPERVISE}/status
 