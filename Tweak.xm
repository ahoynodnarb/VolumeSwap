#import "VolumeSwap.h"

%hook SBVolumeControl
-(float)volumeStepUp {
  float orig = %orig;
  if(isEnabled) {
    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
    BOOL defaultSwap = (deviceOrientation == UIDeviceOrientationLandscapeLeft || deviceOrientation == UIDeviceOrientationPortraitUpsideDown || deviceOrientation == UIDeviceOrientationFaceUp);
    if((defaultSwap && !isReverse) || (!defaultSwap && isReverse)) {
      return -orig;
    }
  }
  return orig;
}
-(float)volumeStepDown {
  float orig = %orig;
  if(isEnabled) {
    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
    BOOL defaultSwap = (deviceOrientation == UIDeviceOrientationLandscapeLeft || deviceOrientation == UIDeviceOrientationPortraitUpsideDown || deviceOrientation == UIDeviceOrientationFaceUp);
    if((defaultSwap && !isReverse) || (!defaultSwap && isReverse)) {
      return -orig;
    }
  }
  return orig;
}
%end

%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) PreferencesChangedCallback, CFSTR("com.popsicletreehouse.volumeswap.prefschanged"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	refreshPrefs();
}