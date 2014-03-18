//  Copyright (c) 2014 rokob. All rights reserved.

#import "RKAuthClientFirebaseEmailHandler.h"

#import <FirebaseSimpleLogin/FirebaseSimpleLogin.h>

#import "FAUser+RKAuthClient.h"

@implementation RKAuthClientFirebaseEmailHandler
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

- (void)createUserWithEmail:(NSString *)email
                   password:(NSString *)password
                 completion:(RKAuthClientUserBlock)completionBlock
              callbackQueue:(dispatch_queue_t)callbackQueue
{
  NSAssert(callbackQueue, @"callback queue must not be nil");
  if (!completionBlock) {
    return;
  }
  completionBlock = [completionBlock copy];
  [_simpleLogin createUserWithEmail:email
                           password:password
                 andCompletionBlock:^(NSError *error, FAUser *user) {
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

- (void)loginWithEmail:(NSString *)email
              password:(NSString *)password
            completion:(RKAuthClientUserBlock)completionBlock
         callbackQueue:(dispatch_queue_t)callbackQueue
{
  NSAssert(callbackQueue, @"callback queue must not be nil");
  if (!completionBlock) {
    return;
  }
  completionBlock = [completionBlock copy];
  [_simpleLogin loginWithEmail:email
                   andPassword:password
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

- (void)removeUserWithEmail:(NSString *)email
                   password:(NSString *)password
                 completion:(RKAuthClientSuccessBlock)completionBlock
              callbackQueue:(dispatch_queue_t)callbackQueue
{
  NSAssert(callbackQueue, @"callback queue must not be nil");
  if (!completionBlock) {
    return;
  }
  completionBlock = [completionBlock copy];
  [_simpleLogin removeUserWithEmail:email
                           password:password
                 andCompletionBlock:^(NSError *error, BOOL success) {
                   dispatch_async(callbackQueue, ^{
                     NSError *errorResult = nil;
                     if (!success) {
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
                     completionBlock(errorResult, success);
                   });
                 }];
}

- (void)changePasswordForEmail:(NSString *)email
                   oldPassword:(NSString *)oldPassword
                   newPassword:(NSString *)newPassword
                    completion:(RKAuthClientSuccessBlock)completionBlock
                 callbackQueue:(dispatch_queue_t)callbackQueue
{
  NSAssert(callbackQueue, @"callback queue must not be nil");
  if (!completionBlock) {
    return;
  }
  completionBlock = [completionBlock copy];
  [_simpleLogin changePasswordForEmail:email
                           oldPassword:oldPassword
                           newPassword:newPassword
                       completionBlock:^(NSError *error, BOOL success) {
                         dispatch_async(callbackQueue, ^{
                           NSError *errorResult = nil;
                           if (!success) {
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
                           completionBlock(errorResult, success);
                         });
                       }];
}

- (void)sendPasswordResetForEmail:(NSString *)email
                       completion:(RKAuthClientSuccessBlock)completionBlock
                    callbackQueue:(dispatch_queue_t)callbackQueue
{
  NSAssert(callbackQueue, @"callback queue must not be nil");
  if (!completionBlock) {
    return;
  }
  completionBlock = [completionBlock copy];
  [_simpleLogin sendPasswordResetForEmail:email
                       andCompletionBlock:^(NSError *error, BOOL success) {
                         dispatch_async(callbackQueue, ^{
                           NSError *errorResult = nil;
                           if (!success) {
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
                           completionBlock(errorResult, success);
                         });
                       }];
}

@end
