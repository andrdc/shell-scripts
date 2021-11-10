#!/bin/bash

# update-mozilla - Update mozilla thunderbird and mozilla firefox

user=$(whoami)
DIR="/home/$user/Downloads"
DIR_OPT="/opt"
DIR_FIREFOX="/opt/firefox/"
DIR_FIREFOX_OLD="/opt/firefox_old"
DIR_THUNDERBIRD="/opt/thunderbird/"
DIR_THUNDERBIRD_OLD="/opt/thunderbird_old"
FILE_FIREFOX="firefox.tar.bz2"
FILE_THUNDERBIRD="thunderbird.tar.bz2"
URL_THUNDERBIRD="https://download.mozilla.org/?product=thunderbird-latest-ssl&os=linux64&lang=en-US"
URL_FIREFOX="https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"

# Change directory to downloads
cd $DIR

# Check if files alredy exists, if so delete them
if [ -e $FILE_FIREFOX ]; then
	rm $FILE_FIREFOX
fi

if [ -e $FILE_THUNDERBIRD ]; then
	rm $FILE_THUNDERBIRD
fi

# Download latest
wget -O $FILE_THUNDERBIRD "$URL_THUNDERBIRD"
wget -O $FILE_FIREFOX "$URL_FIREFOX"

# Make backup of old versions
if [[ -d $DIR_FIREFOX && -d $DIR_THUNDERBIRD ]]; then
	if [[ -d $DIR_FIREFOX_OLD && -d $DIR_THUNDERBIRD_OLD ]]; then
		rm -r $DIR_FIREFOX_OLD
		rm -r $DIR_THUNDERBIRD_OLD
		cp -r $DIR_FIREFOX $DIR_FIREFOX_OLD
		cp -r $DIR_THUNDERBIRD $DIR_THUNDERBIRD_OLD
	fi
fi

# Update
tar xjf $FILE_FIREFOX -C $DIR_OPT
tar xjf $FILE_THUNDERBIRD -C $DIR_OPT
