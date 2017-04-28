linux-scripts
configsys
	"Script to install the HT-versions of Cog and Spur on a Ubuntu 14.04 system."

"Removed installation of libgl1-mesa-glx:i386 because it caused a package dependency failure on Ubuntu 14.04.02 LTS Desktop.  Was able to eliminate it and still install Spur, not sure if its needed for Ubuntu Server Edition though..."

	^ 'sudo dpkg-reconfigure tzdata
# sudo timedatectl set-timezone America/Chicago
echo adding 32-bit libraries to support Smalltalk VM
sudo dpkg --add-architecture i386
sudo apt-get -qq update
sudo apt-get install libuuid1:i386 libglu1-mesa:i386 libsm6:i386

echo installing Smalltalk VMs
./upgradespurht' -> [ ]