# Setting the path for MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH 
export PATH=/usr/local/bin:$PATH 

##
# DELUXE-USR-LOCAL-BIN-INSERT
# (do not remove this comment)
##
echo $PATH | grep -q -s "/usr/local/bin"
if [ $? -eq 1 ] ; then
    PATH=$PATH:/usr/local/bin
    export PATH
fi

export HISTSIZE=10000

source ~/.bashrc
