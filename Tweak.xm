#import "VolumeSwap.h"

static float calculateVolume(float currentVolume) {
  if(isEnabled) {
    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
    BOOL defaultSwap = (deviceOrientation == UIDeviceOrientationLandscapeLeft || deviceOrientation == UIDeviceOrientationPortraitUpsideDown || deviceOrientation == UIDeviceOrientationFaceUp);
    if(defaultSwap ^ isReverse) {
      return -currentVolume;
    }
  }
  return currentVolume;
}

%group iOS13
%hook SBVolumeControl
-(float)volumeStepUp {
  return calculateVolume(%orig);
}
-(float)volumeStepDown {
  return calculateVolume(%orig);
}
%end
%end

%group iOS12
%hook VolumeControl
-(float)volumeStepUp {
  return calculateVolume(%orig);
}
-(float)volumeStepDown {
  return calculateVolume(%orig);
}
%end
%end

%ctor {
  if(@available(iOS 13, *)) %init(iOS13);
  else %init(iOS12);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) PreferencesChangedCallback, CFSTR("com.popsicletreehouse.volumeswap.prefschanged"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	refreshPrefs();
}