//  Copyright (c) 2014 rokob. All rights reserved.

#import <Foundation/Foundation.h>

#import "RKInvalidating.h"

@protocol RKUser;

@interface RKUserContext : NSObject <RKInvalidating>

+ (instancetype)contextWithUser:(id<RKUser>)user;
- (id<RKUser>)loggedInUser;

@end
