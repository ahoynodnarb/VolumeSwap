export PREFIX=$(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = volumeswapprefs

volumeswapprefs_FILES = VSPRootListController.m
volumeswapprefs_INSTALL_PATH = /Library/PreferenceBundles
volumeswapprefs_FRAMEWORKS = UIKit
volumeswapprefs_PRIVATE_FRAMEWORKS = Preferences
volumeswapprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/volumeswapprefs.plist$(ECHO_END)
