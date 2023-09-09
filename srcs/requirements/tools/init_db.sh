#!/bin/bash
if [ ! -d "/home/${USER}/data" ] && [ ! -d "/Users/${USER}/data" ]
then
        mkdir -p ~/data/db
        mkdir -p ~/data/wp
fi