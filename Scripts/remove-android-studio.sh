#!/usr/bin/env bash

#
# Script: remove-android-studio.sh
# Usage: ./remove-android-studio.sh
#
# Remove Android Studio from the macOSX file system.
# Ref: https://stackoverflow.com/questions/17625622/how-to-completely-uninstall-android-studio-on-mac
#

# Set defaults
set -o nounset -o errexit -o errtrace -o pipefail

# Prompt user to confirm they want to execute this script
read -r -p "Are you sure you want to remove Android Studio? [y/N] " response
if [[ !("$response" =~ ^([yY][eE][sS]|[yY])$) ]]; then
    echo "Aborting" >&2
    exit 1
fi

# Deletes the Android Studio application
# Note that this may be different depending on what you named the application as, or whether you downloaded the preview version
rm -rf /Applications/Android\ Studio.app

# Delete All Android Studio related preferences
# The asterisk here should target all folders/files beginning with the string before it
rm -rf ~/Library/Preferences/AndroidStudio*
rm -rf ~/Library/Preferences/Google/AndroidStudio*

# Deletes the Android Studio's plist file
rm -rf ~/Library/Preferences/com.google.android.*

# Deletes the Android Emulator's plist file
rm -rf ~/Library/Preferences/com.android.*

# Deletes mainly plugins (or at least according to what mine (Edric) contains)
rm -rf ~/Library/Application\ Support/AndroidStudio*
rm -rf ~/Library/Application\ Support/Google/AndroidStudio*

# Deletes all logs that Android Studio outputs
rm -rf ~/Library/Logs/AndroidStudio*
rm -rf ~/Library/Logs/Google/AndroidStudio*

# Deletes Android Studio's caches
rm -rf ~/Library/Caches/AndroidStudio*

# Deletes older versions of Android Studio
rm -rf ~/.AndroidStudio*

# Remove gradle related files (caches & wrapper)
rm -rf ~/.gradle

# Delete all Android Virtual Devices(AVDs) and keystores
rm -rf ~/.android

# Delete Android SDK tools
rm -rf ~/Library/Android*

# Delete local SDK
rm -rf /usr/local/var/lib/android-sdk/

# Emulator Console Auth Token
rm -rf ~/.emulator_console_auth_token