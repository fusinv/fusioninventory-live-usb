#!/bin/sh -e
###################################################################################
# FusionInventory  Live USB                                                       #
# one line to give the program's name and an idea of what it does.                #
# Copyright (C) 2010  Henon Valentin valentin.henon@gmail.com                     #
#                     Blot  Aurélie  blot.aurelie@gmail.com                       #
#                                                                                 #
# This program is free software; you can redistribute it and/or                   #
# modify it under the terms of the GNU General Public License                     #
# as published by the Free Software Foundation; either version 2                  #
# of the License, or (at your option) any later version.                          #
#                                                                                 #
# This program is distributed in the hope that it will be useful,                 #
# but WITHOUT ANY WARRANTY; without even the implied warranty of                  #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                   #
# GNU General Public License for more details.                                    #
#                                                                                 #
# You should have received a copy of the GNU General Public License               #   
# along with this program; if not, write to the Free Software                     #
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA. #
###################################################################################
DIALOG=$1
Commande=$2
file_path=$3


### Creation of the temp file for the responses ###
fichierTemp=/tmp/fichierTempFusionInventory.$$
### Trap for deleting the temp file ###
trap "rm -f $fichierTemp" 0 1 2 5 15

#########################################################
# Function for launch a shell                           #
#########################################################
launch_shell()
{
    $DIALOG --title "Fusion Inventory" --clear --no-label "Reboot" \
	--yesno "Do you want a shell?" 10 50
    
    valRet=$?
    
    case $valRet in
	0)
            # Lancement d'un shell
	    ;;
	*)
	    # Redémarrage
	    echo "reboot"
	    ;;
    esac
}

### Debug mode ###
Commande=$Commande" --debug"

### Run ###
echo $Commande
`echo $Commande`
launch_shell