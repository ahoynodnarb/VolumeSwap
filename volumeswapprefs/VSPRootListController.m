#include "VSPRootListController.h"

@implementation VSPRootListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
   return _specifiers;
}
@end
