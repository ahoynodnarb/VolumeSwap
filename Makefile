PREFIX=$(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = VolumeSwap

VolumeSwap_FILES = Tweak.xm
VolumeSwap_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += volumeswapprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
