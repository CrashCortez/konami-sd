#!/bin/bash
#
#=============================================================================
#title:         menu.sh
#description:   Menu which allows multiple items to be selected, for the Controls for Steamdeck
#author:        Crash
#created:       June 24 2019
#updated:       Feb 18 2020
#version:       1.0
#usage:         ./menu.sh
#==============================================================================
export NCURSES_NO_UTF8_ACS=1
#IFS=';'
#  Welcome
# dialog --backtitle "Konami MENU" --title "The Controls Menu Utility" \
#   --yesno "\nDo you want to proceed?" \
#    28 110 2>&1 > /dev/tty \
#    || exit

function main_menu() {

    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "What action would you like to perform?" 25 75 20 \

            1 "Install BIOS" \
            2 "Controller Type" \
            3 "Update Controls PS4" \
            4 "Update this menu" \
            5 "System Reboot" \
            6 "System Shutdown" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) install_bios  ;;
            2) gui_controllertools  ;;
            3) controls_ps4  ;;
            4) update_menu  ;;
            5) system_reboot  ;;
            6) system_shutdown  ;;
            *)  break ;;
        esac
    done
}

######################
# Functions for menu #
######################

function validate_url(){
    if [[ `wget -S --spider $1  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
        return 0
    else
        return 1
    fi
}
function gui_controllertools() {
    while true; do
        local cmd=(dialog --backtitle "$__backtitle" --menu "Choose Your Controller" 22 76 16)
        local options=(
            1 "XBOX 360"
            2 "PS3"
            3 "PS4"
            4 "GPi"
            5 "SN30"
			6 "AUTO"
            7 "TEST"
        )
        local choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        if [[ -n "$choice" ]]; then
            case "$choice" in
            1) controls_xbox_360  ;;
            2) controls_ps3  ;;
            3) controls_ps4  ;;
            4) controls_gpi ;;
	        5) controls_sn30 ;;
            6) controls_auto ;; 
            7) controls_test ;;
            esac
        else
            break
        fi
}

function install_bios() {
    if validate_url https://archive.org/download/bios_20220525/bios.zip; then
        cd
        cd /run/media/mmcblk0p1/Emulation/
        sudo wget -O https://archive.org/download/bios_20220525/bios.zip
		unzip bios.zip
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}
function controls_ps4() {
    if validate_url https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS4/xboxdrvstart.sh; then
        cd
        cd /opt/retropie/configs/all
        sudo wget -O xboxdrvend.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS4/xboxdrvend.sh
        sudo wget -O xboxdrvstart.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS4/xboxdrvstart.sh
        sudo chmod 644 *.sh
        cd
        cd /opt/retropie/supplementary/xboxdrv/bin
        sudo wget -O quit.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS4/quit.sh
        sudo chmod a+x quit.sh
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}
function controls_ps3() {
    if validate_url https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS3/xboxdrvstart.sh; then
        cd
        cd /opt/retropie/configs/all
        sudo wget -O xboxdrvend.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS3/xboxdrvend.sh
        sudo wget -O xboxdrvstart.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS3/xboxdrvstart.sh
        sudo chmod 644 *.sh
        cd
        cd /opt/retropie/supplementary/xboxdrv/bin
        sudo wget -O quit.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS3/quit.sh
        sudo chmod a+x quit.sh
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}
function controls_sn30() {
    if validate_url https://raw.githubusercontent.com/CrashCortez/RetroMPV/sn30/xboxdrvstart.sh; then
        cd
        cd /opt/retropie/configs/all
        sudo wget -O xboxdrvend.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/sn30/xboxdrvend.sh
        sudo wget -O xboxdrvstart.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/GPi/xboxdrvstart.sh
        sudo chmod 644 *.sh
        cd
        cd /opt/retropie/supplementary/xboxdrv/bin
        sudo wget -O quit.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/sn30/quit.sh
        sudo chmod a+x quit.sh
        cd
        cd /home/pi/RetroPie/retropiemenu/icons
        sudo cp /home/pi/RetroMPV/8bitdotools.png /home/pi/RetroPie/retropiemenu/icons/controllertools.png
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}
function controls_gpi() {
    if validate_url https://raw.githubusercontent.com/CrashCortez/RetroMPV/GPi/xboxdrvstart.sh; then
        cd
        cd /opt/retropie/configs/all
        sudo wget -O xboxdrvend.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/Gpi/xboxdrvend.sh
        sudo wget -O xboxdrvstart.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/GPi/xboxdrvstart.sh
        sudo chmod 644 *.sh
        cd
        cd /opt/retropie/supplementary/xboxdrv/bin
        sudo wget -O quit.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/GPi/quit.sh
        sudo chmod a+x quit.sh
        cd
        cd /home/pi/RetroPie/retropiemenu/icons
        sudo cp /home/pi/RetroMPV/gpitools.png /home/pi/RetroPie/retropiemenu/icons/controllertools.png
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}
function controls_auto() {
    if validate_url https://raw.githubusercontent.com/CrashCortez/RetroMPV/auto/xboxdrvstart.sh; then
        cd
        cd /opt/retropie/configs/all
        sudo wget -O xboxdrvend.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/auto/xboxdrvend.sh
        sudo wget -O xboxdrvstart.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/auto/xboxdrvstart.sh
        sudo chmod 644 *.sh
        cd
        cd /opt/retropie/supplementary/xboxdrv/bin
        sudo wget -O quit.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/GPi/quit.sh
        sudo chmod a+x quit.sh
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}
function controls_test() {
    if validate_url https://raw.githubusercontent.com/CrashCortez/RetroMPV/test/xboxdrvstart.sh; then
        cd
        cd /opt/retropie/configs/all
        sudo wget -O xboxdrvend.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/test/xboxdrvend.sh
        sudo wget -O xboxdrvstart.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/test/xboxdrvstart.sh
        sudo chmod 644 *.sh
        cd
        cd /opt/retropie/supplementary/xboxdrv/bin
        sudo wget -O quit.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/test/quit.sh
        sudo chmod a+x quit.sh
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}

function system_shutdown() {
    sudo shutdown -P now
}

function system_reboot() {
    sudo reboot
}

function update_menu() {
    if validate_url https://raw.githubusercontent.com/CrashCortez/konami-sd/main/konami.sh; then
        cd
        cd "/run/media/mmcblk0p1/Emulation/roms/ports/"
		wget "https://raw.githubusercontent.com/CrashCortez/konami-sd/main/konami.sh"
		chmod 777 "konami.sh"
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
        exit 1
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}

# Main
main_menu
