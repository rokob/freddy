//  Copyright (c) 2014 rokob. All rights reserved.

#import "RKAuthClientFirebaseBasicHandler.h"

#import <FirebaseSimpleLogin/FirebaseSimpleLogin.h>

#import "FAUser+RKAuthClient.h"

@implementation RKAuthClientFirebaseBasicHandler
{
  FirebaseSimpleLogin *_simpleLogin;
}

- (instancetype)initWithSimpleLogin:(FirebaseSimpleLogin *)simpleLogin
{
  if ((self = [super init])) {
    _simpleLogin = simpleLogin;
  }
  return self;
}

- (void)checkAuthStatusWithBlock:(RKAuthClientUserBlock)block callbackQueue:(dispatch_queue_t)callbackQueue
{
  NSAssert(callbackQueue, @"callback queue must not be nil");
  if (!block) {
    return;
  }
  block = [block copy];
  [_simpleLogin checkAuthStatusWithBlock:^(NSError *error, FAUser *user) {
    dispatch_async(callbackQueue, ^{
      NSError *errorResult = nil;
      if (!user) {
        if (!error) {
          errorResult = [NSError errorWithDomain:kRKAuthClientErrorDomain
                                            code:RKAuthClientEmailHandlerErrorUnknown
                                        userInfo:nil];
        } else {
          errorResult = [NSError errorWithDomain:kRKAuthClientErrorDomain
                                            code:RKAuthClientEmailHandlerErrorServiceError
                                        userInfo:@{kRKAuthClientServiceErrorKey: error}];
        }
      } else {
        errorResult = error;
      }
      block(user, errorResult);
    });
  }];
}

- (void)logout
{
  [_simpleLogin logout];
}

@end
