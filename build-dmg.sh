#!/usr/bin/env bash

# Define variables
installer_dmg_path="build/release/Chechen-Keyboard-Installer.dmg"
dmg_contents_path="build/DMGContents"
dmg_background_file="build/dmg-background.png"
bundle_file="Chechen Latin Keyboard.bundle"

# Create directories for the DMG
mkdir -p "${dmg_contents_path}/${bundle_file}/Contents"
mkdir build/release

# Copy resources and plist files into the Chechen Latin Keyboard.bundle structure
cp -R Resources "${dmg_contents_path}/${bundle_file}/Contents/"
cp Info.plist "${dmg_contents_path}/${bundle_file}/Contents/"
cp version.plist "${dmg_contents_path}/${bundle_file}/Contents/"

# Create a symlink to the Keyboard Layouts directory in the DMGContents directory
ln -s "/Library/Keyboard Layouts" "${dmg_contents_path}/Keyboard Layouts"

# Command to create the DMG
create-dmg \
  --volname "Chechen Keyboard Installer" \
  --volicon "${dmg_contents_path}/${bundle_file}/Contents/Resources/Chechen (Latin, QWERTY, US).icns" \
  --background "${dmg_background_file}" \
  --window-pos 200 120 \
  --window-size 660 420 \
  --icon-size 150 \
  --icon "${bundle_file}" 165 170 \
  --icon "Keyboard Layouts" 495 170 \
  --hide-extension "${bundle_file}" \
  "${installer_dmg_path}" \
  "${dmg_contents_path}"/