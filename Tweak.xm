#import "VolumeSwap.h"

%group iOS13
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
%end

%group iOS12
%hook VolumeControl
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
%end

%ctor {
  if(@available(iOS 13, *)) %init(iOS13);
  else %init(iOS12);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) PreferencesChangedCallback, CFSTR("com.popsicletreehouse.volumeswap.prefschanged"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	refreshPrefs();
}