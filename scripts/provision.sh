#!/bin/bash
# Provision the vm

ALL_PROVISIONERS="install"

if [[ $@ ]]; then
    PROVISIONERS=$@
else
    PROVISIONERS=$ALL_PROVISIONERS
fi

for p in $PROVISIONERS
do
    case "$p" in 
        install)
            # provisioning script converts to oracle linux
            /vagrant/scripts/provision_install.sh
            ;;     
	    *)	    
            echo "Invalid provisioning arg $p.  Valid args are: $ALL_PROVISIONERS"
    esac
done

