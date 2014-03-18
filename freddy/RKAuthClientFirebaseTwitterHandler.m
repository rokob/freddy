//  Copyright (c) 2014 rokob. All rights reserved.

#import "RKAuthClientFirebaseTwitterHandler.h"

#import <FirebaseSimpleLogin/FirebaseSimpleLogin.h>

#import "FAUser+RKAuthClient.h"

@implementation RKAuthClientFirebaseTwitterHandler
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

- (void)loginToTwitterWithAppId:(NSString *)appId
        multipleAccountsHandler:(int (^)(NSArray *))accountSelection
                     completion:(RKAuthClientUserBlock)completionBlock
                  callbackQueue:(dispatch_queue_t)callbackQueue
{
  NSAssert(callbackQueue, @"callback queue must not be nil");
  if (!completionBlock) {
    return;
  }
  [_simpleLogin loginToTwitterAppWithId:appId
                multipleAccountsHandler:accountSelection
                    withCompletionBlock:^(NSError *error, FAUser *user) {
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
                        completionBlock(user, errorResult);
                      });
                    }];
}

- (void)disconnectFromTwitterWithCompletion:(RKAuthClientSuccessBlock)completionBlock
                              callbackQueue:(dispatch_queue_t)callbackQueue
{
  NSAssert(callbackQueue, @"callback queue must not be nil");
  if (!completionBlock) {
    return;
  }
  dispatch_async(callbackQueue, ^{
    NSError *error = [NSError errorWithDomain:kRKAuthClientErrorDomain
                                         code:RKAuthClientFacebookHandlerErrorUnimplemented
                                     userInfo:nil];
    completionBlock(error, NO);
  });
}

@end
