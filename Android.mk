# OrangeFox Recovery - Sony Xperia 1 III / 5 III
LOCAL_PATH := $(call my-dir)

ifneq ($(filter pdx215 pdx214,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif