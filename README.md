# [runit](http://smarden.org/runit)  
## runit scripts

installing runit per user service
---------------------------------
replace your username on the first line `export USERNAME=satoshy`!

```bash
export USERNAME=satoshy
cd /opt
git clone https://github.com/robotamer/runit.git
cd /opt/runit/new-user-runit/
chmod +x newUser.sh; ./newUser.sh
```


installing syncthing
--------------------
1 [find latest release](https://github.com/syncthing/syncthing/releases)  
2- replace your username!  
3- edit user name in "run"  

```bash
export USERNAME='satoshy'
cd /tmp
wget https://github.com/syncthing/syncthing/releases/download/v1.20.2/syncthing-linux-amd64-v1.20.2.tar.gz
tar -xf syncthing-linux-amd64-v1.20.2.tar.gz
md -p /srv
mv syncthing-linux-amd64-v1.20.2 /srv/syncthing
ls -Alh /srv/syncthing/
cd /opt/runit/syncthing
chmod +x newUser.sh
nano ./run
./newUser.sh
rm /tmp/syncthing-linux-amd64-v1.20.2.tar.gz
```
