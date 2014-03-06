//  Copyright (c) 2014 rokob. All rights reserved.

#import <UIKit/UIKit.h>

#import <RKIntent/RKIntentHandler.h>

@interface RKFeedNavigationController : UINavigationController <RKIntentHandler>

+ (instancetype)configuredFeedController;

@end
