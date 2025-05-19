#!/system/bin/sh

MODDIR=${0%/*}

mkdir -p /data/user_de/0/com.android.systemui/shared_prefs

mount -o bind "$MODDIR/system/etc/oplus_media_controller_config_sp.xml" \
              "/data/user_de/0/com.android.systemui/shared_prefs/oplus_media_controller_config_sp.xml"
