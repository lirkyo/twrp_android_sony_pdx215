#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2019-2024 The OrangeFox Recovery Project
#	
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
# 	
# 	Please maintain this if you use this script or any part of it
#

FOX_MANIFEST_ROOT=$(gettop)
export OF_MAINTAINER="Sony-Xperia-1III"
export FOX_TARGET_DEVICES="pdx215,pdx214"
export TARGET_DEVICE_ALT="pdx215,pdx214"

if [ -f $FOX_MANIFEST_ROOT/bootable/recovery/orangefox_defaults.go -a -f $FOX_MANIFEST_ROOT/bootable/recovery/orangefox.mk ]; then
	export OF_KEEP_FORCED_ENCRYPTION=1
	export OF_PATCH_AVB20=1
	export OF_USE_MAGISKBOOT=1
	export FOX_AB_DEVICE=1
	export FOX_VIRTUAL_AB_DEVICE=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_USE_GREEN_LED=0
	export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
	export OF_DISABLE_DECRYPTION_PROMPT=1
	export OF_DISABLE_OTA_MENU=0

	# Toolchain & binary features
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_ZIP_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_REPLACE_BUSYBOX_PS=1
	export OF_USE_NEW_MAGISKBOOT=1

	# OTA for custom ROMs (OF_SUPPORT_ALL_BLOCK_OTA_UPDATES removed: not compatible with VANILLA builds)
	export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1

	# -- OrangeFox R11.1 settings --
	export FOX_R11=1
	export FOX_MAINTAINER_PATCH_VERSION="2"
	export OF_MAINTAINER_AVATAR="${DEVICE_PATH}/recovery/root/system/etc/fox_avatar.png"
	export OF_QUICK_BACKUP_LIST="/boot;/data;/super"
	export FOX_ENABLE_APP_MANAGER=1
	export OF_ADVANCED_SECURITY=1
	export FOX_DELETE_AROMAFM=1

	# Display settings for Xperia 1 III (4K, portrait HDPI)
	export OF_SCREEN_H=2520
	export OF_SCREEN_W=1080
	export OF_STATUS_H=96
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
	export OF_CLOCK_POS=1

	# Flash & backup paths
	export OF_FL_PATH1="/sdcard"
	export OF_FL_PATH2="/sdcard1"

	# Dynamic partition support
	export OF_DYNAMIC_FULL_SIZE=14495514624

	# Vendor boot header v3
	export FOX_VENDOR_BOOT_RECOVERY=1

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
	fi
fi
#