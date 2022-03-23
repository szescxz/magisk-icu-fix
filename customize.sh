SKIPUNZIP=1

if [ "$API" != "27" ]; then
  abort "This module is for Android 8.1 (API 27) only!"
fi

REPLACE="
/system/usr/icu
"

ui_print "- Extracting files"
unzip -o "$ZIPFILE" 'module.prop'  -d "$MODPATH"
unzip -o "$ZIPFILE" "system/*"     -d "$MODPATH"

ui_print "- Setting permissions"
set_perm_recursive  $MODPATH                              0 0 0755 0644
set_perm            $MODPATH/system/usr/icu               0 0 0755 u:object_r:system_file:s0
set_perm            $MODPATH/system/usr/icu/icudt58l.dat  0 0 0644 u:object_r:system_file:s0
