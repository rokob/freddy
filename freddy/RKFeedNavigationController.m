//  Copyright (c) 2014 rokob. All rights reserved.

#import "RKFeedNavigationController.h"
#import "RKFeedViewController.h"

#import <RKIntent/RKIntent.h>
#import <RKIntent/RKIntentSource.h>

@interface RKFeedNavigationController ()

@end

@implementation RKFeedNavigationController

- (id)init
{
  if ((self = [super init])) {
  }
  return self;
}

- (BOOL)handleIntent:(id<RKIntent>)intent
{
  id payload = [intent payload];
  if ([payload isKindOfClass:[NSDictionary class]]) {
    NSInteger row = [[(NSDictionary *)payload objectForKey:@"row"] integerValue];
    NSInteger section = [[(NSDictionary *)payload objectForKey:@"section"] integerValue];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    UILabel *rowLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 400, 200)];
    UILabel *sectionLaebl = [[UILabel alloc] initWithFrame:CGRectMake(5, 210, 400, 200)];
    rowLabel.text = [NSString stringWithFormat:@"ROW %d", row];
    sectionLaebl.text = [NSString stringWithFormat:@"SECTION %d", section];
    [view addSubview:rowLabel];
    [view addSubview:sectionLaebl];
    UIViewController *vc = [[UIViewController alloc] init];
    [vc setView:view];
    [self pushViewController:vc animated:YES];
    [[intent source] didHandleIntent:intent withHandler:self];
    return YES;
  }
  [[intent source] failedToHandleIntent:intent];
  return NO;
}

+ (id)configuredFeedController
{
  RKFeedNavigationController *navController = [[RKFeedNavigationController alloc] init];
  RKFeedViewController *viewController = [[RKFeedViewController alloc] initWithIntentHandler:navController];
  [navController setViewControllers:@[viewController]];

  return navController;
}

@end
