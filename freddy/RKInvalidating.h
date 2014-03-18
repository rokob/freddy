//  Copyright (c) 2014 rokob. All rights reserved.

#import <Foundation/Foundation.h>

@protocol RKInvalidating <NSObject>
- (void)invalidate;
- (BOOL)isValid;
@end
