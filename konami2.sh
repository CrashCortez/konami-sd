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
IFS=';'
  Welcome
 dialog --backtitle "Konami MENU" --title "The Lonami Menu Utility" \
   --yesno "\nDo you want to proceed?" \
    28 110 2>&1 > /dev/tty \
    || exit

function main_menu() {

    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "What action would you like to perform?" 25 75 20 \

            1 "Install BIOS" \
            2 "Update this menu" \
            3 "System Reboot" \
            4 "System Shutdown" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) install_bios  ;;
            2) update_menu  ;;
            3) system_reboot  ;;
            4) system_shutdown  ;;
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
#function gui_controllertools() {
#    while true; do
#        local cmd=(dialog --backtitle "$__backtitle" --menu "Choose Your Controller" 22 76 16)
#        local options=(
#            1 "XBOX 360"
#            2 "PS3"
#            3 "PS4"
#            4 "GPi"
#            5 "SN30"
#	     6 "AUTO"
#            7 "TEST"
#        )
#        local choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
#        if [[ -n "$choice" ]]; then
#            case "$choice" in
#            1) controls_xbox_360  ;;
#            2) controls_ps3  ;;
#            3) controls_ps4  ;;
#            4) controls_gpi ;;
#	     5) controls_sn30 ;;
#            6) controls_auto ;; 
#            7) controls_test ;;
#            esac
#        else
#            break
#        fi
#}

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
