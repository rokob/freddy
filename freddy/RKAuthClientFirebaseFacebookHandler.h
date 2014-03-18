//  Copyright (c) 2014 rokob. All rights reserved.

#import <Foundation/Foundation.h>

#import <RKAuthClient/RKAuthClientServices.h>

@class FirebaseSimpleLogin;

@interface RKAuthClientFirebaseFacebookHandler : NSObject <RKAuthClientFacebook>

- (instancetype)initWithSimpleLogin:(FirebaseSimpleLogin *)simpleLogin;

@end
