#!/bin/bash
if [ ! -d "/home/${USER}/data" ] && [ ! -d "/Users/${USER}/data" ]
then
        mkdir -p /home/${USER}/data/db
        mkdir -p /home/${USER}/data/wp
        mkdir -p /home/${USER}/data/portainer
        mkdir -p /home/${USER}/data/portfolio
        mkdir -p /home/${USER}/data/adminer
fi