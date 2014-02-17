//  Copyright (c) 2014 rokob. All rights reserved.

#import "RKAppDelegate.h"
#import <RKIntent/RKIntent.h>

@implementation RKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  // Override point for customization after application launch.
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];

  RKIntent *newIntent = [[RKIntent alloc] initWithData:@"dataz" type:RKIntentTypeObject source:nil];
  NSLog(@"%@ :: %d", [newIntent data], [newIntent type]);
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
