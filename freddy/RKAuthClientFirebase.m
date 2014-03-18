//  Copyright (c) 2014 rokob. All rights reserved.

#import "RKAuthClientFirebase.h"

#import <Firebase/Firebase.h>
#import <FirebaseSimpleLogin/FirebaseSimpleLogin.h>

#import "RKAuthClientFirebaseBasicHandler.h"
#import "RKAuthClientFirebaseEmailHandler.h"
#import "RKAuthClientFirebaseFacebookHandler.h"
#import "RKAuthClientFirebaseTwitterHandler.h"

@implementation RKAuthClientFirebase

+ (RKAuthClient *)firebaseAuthClientWithFirebase:(Firebase *)firebase
{
  return [[RKAuthClient alloc] initWithConfiguration:[self defaultConfigurationWithFirebase:firebase]];
}

+ (RKAuthClientConfigurationBlock)defaultConfigurationWithFirebase:(Firebase *)firebase
{
  FirebaseSimpleLogin *simpleLogin = [[FirebaseSimpleLogin alloc] initWithRef:firebase];
  id<RKAuthClientBasic> basicHandler = [[RKAuthClientFirebaseBasicHandler alloc] initWithSimpleLogin:simpleLogin];
  id<RKAuthClientEmail> emailHandler = [[RKAuthClientFirebaseEmailHandler alloc] initWithSimpleLogin:simpleLogin];
  id<RKAuthClientFacebook> facebookHandler = [[RKAuthClientFirebaseFacebookHandler alloc] initWithSimpleLogin:simpleLogin];
  id<RKAuthClientTwitter> twitterHandler = [[RKAuthClientFirebaseTwitterHandler alloc] initWithSimpleLogin:simpleLogin];

  return [^(id<RKAuthClientConfiguration> configuration) {
    [configuration setBasicHandler:basicHandler];
    [configuration setEmailHandler:emailHandler];
    [configuration setFacebookHandler:facebookHandler];
    [configuration setTwitterHandler:twitterHandler];
  } copy];
}

@end
