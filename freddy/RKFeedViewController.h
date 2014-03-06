//  Copyright (c) 2014 rokob. All rights reserved.

#import <UIKit/UIKit.h>

@protocol RKIntentHandler;

@interface RKFeedViewController : UITableViewController

- (instancetype)initWithIntentHandler:(id<RKIntentHandler>)handler;

@end
