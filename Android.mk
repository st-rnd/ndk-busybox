LOCAL_PATH := $(call my-dir)
VERSION = 1
PATCHLEVEL = 30
SUBLEVEL = 1
EXTRAVERSION = -topjohnwu
BB_VER = $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)

include $(CLEAR_VARS)
LOCAL_MODULE := busybox
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_LDFLAGS := -static
LOCAL_CFLAGS := \
-w -include include/autoconf.h -D__USE_BSD \
-DBB_VER=\"$(BB_VER)\" -DBB_BT=AUTOCONF_TIMESTAMP \
-D'wait3(wstatus, options, rusage)=wait4(-1, wstatus, options, rusage)'
LOCAL_DISABLE_FORMAT_STRING_CHECKS := true
include $(LOCAL_PATH)/Android_src.mk
include $(BUILD_EXECUTABLE)
