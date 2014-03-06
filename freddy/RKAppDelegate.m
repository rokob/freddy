//  Copyright (c) 2014 rokob. All rights reserved.

#import "RKAppDelegate.h"
#import <RKIntent/RKIntent.h>

#import "RKFeedNavigationController.h"

@implementation RKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

  RKFeedNavigationController *navController = [RKFeedNavigationController configuredFeedController];

  [self.window setRootViewController:navController];

  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];

  return YES;
}

@end
