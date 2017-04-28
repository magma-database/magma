linux-scripts
configsys
	"Part of initial set up of a new server to handle Magma."
	^ super configsys key ,
	'
# magma servers run under user magma which only has access to its own files.
echo creating magma user
sudo adduser --disabled-login --gecos "" magma

# but primary user (ubuntu) must have access to magma files
echo granting the primary user access to magma files
sudo usermod -aG magma `whoami`

echo ensure no public access to anything in work
sudo chmod o-rwx ~/work ~/work/magma
sudo chgrp magma ~/work ~/work/magma

echo installing daemontools...
sudo apt-get -qqy install daemontools daemontools-run
sudo mkdir -p /etc/service
sudo ln -s /etc/service /service'
		-> [ ]