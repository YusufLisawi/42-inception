#!/bin/bash
if [ ! -d "/home/${USER}/data" ] && [ ! -d "/Users/${USER}/data" ]
then
        mkdir ~/data
        mkdir ~/data/db
        mkdir ~/data/wp
fi