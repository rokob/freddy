//  Copyright (c) 2014 rokob. All rights reserved.

#import <Foundation/Foundation.h>

#import <RKAuthClient/RKAuthClient.h>

@class Firebase;

@interface RKAuthClientFirebase : NSObject

+ (RKAuthClient *)firebaseAuthClientWithFirebase:(Firebase *)firebase;

@end
