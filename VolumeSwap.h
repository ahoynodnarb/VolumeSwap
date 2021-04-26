#import <UIKit/UIKit.h>

BOOL isEnabled = YES;
BOOL isReverse = NO;

void refreshPrefs() {
    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.popsicletreehouse.volumeswapprefs"];
    isEnabled = [bundleDefaults objectForKey:@"isEnabled"] ? [[bundleDefaults objectForKey:@"isEnabled"] boolValue] : YES;
    isReverse = [bundleDefaults objectForKey:@"isReversed"] ? [[bundleDefaults objectForKey:@"isReversed"] boolValue] : NO;
}

void PreferencesChangedCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    refreshPrefs();
}