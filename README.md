Saltstack configuration for swipe-technololgies

This project currently works on Ubuntu as a salt minion only project. It is 
not managed through salt master. To install salt minion, run the installation 
script as a super user. Then change your /etc/salt/minion file as follows:

file_client local

file_roots:
  base:
    - /absolute/path/to/salt/project


These variables are already included in the config file, so you need to 
uncomment them and assign them new values. 

After making these changes, restart salt minion, but running:

pkill salt-minion
salt-minion -d


After that, to install the salt configuration, run the following command as a 
super user:

sudo salt-call --local state.highstate -l debug

The 'debug' option, is of course, optional. This installs everything that is 
specified in the top.sls file.
