//  Copyright (c) 2014 rokob. All rights reserved.

#import "RKLoginViewController.h"

@interface RKLoginViewController ()

@end

@implementation RKLoginViewController

- (id)init
{
  if ((self = [super init])) {
  }
  return self;
}

- (void)loadView
{
  UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
  [view setBackgroundColor:[UIColor greenColor]];
  self.view = view;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
