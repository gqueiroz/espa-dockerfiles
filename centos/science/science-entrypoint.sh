#!/bin/bash
set -e

# THE_USER is defined in the Dockerfile

THE_GID=$1
shift # past the argument
THE_UID=$1
shift # past the argument

# Add the user and group to the system
groupadd --gid $THE_GID $THE_USER
useradd -r --gid $THE_GID --uid $THE_UID --system --create-home $THE_USER

# Add the espa runtime installation directory to the path
export PATH=$PREFIX/bin:$PATH

# Corectly set these environment variables for the user
export USER=$THE_USER
export HOME=/home/$THE_USER

# Activate the python virtual environment
. /python-env/bin/activate

# Fixup the home directory since it was created before the user was
cd $HOME
chown $THE_UID:$THE_GID $HOME
cp /etc/skel/.bash_logout .
cp /etc/skel/.bash_profile .
cp /etc/skel/.bashrc .
chown $THE_UID:$THE_GID .bash_logout .bash_profile .bashrc
chmod go=u,go-w .bash_logout .bash_profile .bashrc
chmod go= .

# Now execute as the user
exec gosu $THE_USER $@