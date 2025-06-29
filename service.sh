#!/system/bin/sh

ORIG_XML="/system_ext/etc/oplus/media_config/oplus_media_controller_config_sp.xml"
MOD_XML="/data/adb/YT-Music-Island/oplus_media_controller_config_sp.xml"

mkdir -p /data/adb/YT-Music-Island

# Copy the latest version from the phone
cp -f "$ORIG_XML" "$MOD_XML"

# Check if our package is already in there; if not, add it before closing </package_list>
if ! grep -q 'com.google.android.apps.youtube.music' "$MOD_XML"; then
    sed -i '/<\/package_list>/ i\    <package name=\"com.google.android.apps.youtube.music\"/>' "$MOD_XML"
fi

# Bind mount our modified file over the original
mount -o bind "$MOD_XML" "$ORIG_XML"
