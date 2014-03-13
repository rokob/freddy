//  Copyright (c) 2014 rokob. All rights reserved.

#import "RKFeedViewController.h"
#import "RKFeedView.h"
#import <RKIntent/RKIntent.h>
#import <RKIntent/RKIntentHandler.h>
#import <RKIntent/RKIntentSource.h>

@interface RKFeedViewController ()

@end

@implementation RKFeedViewController
{
  id<RKIntentHandler> _handler;
}

- (id)initWithIntentHandler:(id<RKIntentHandler>)handler
{
  if ((self = [super init])) {
    _handler = handler;
  }
  return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    RKFeedView *feedView = [[RKFeedView alloc] init];
    [cell.contentView addSubview:feedView];
  }
  // Pretty sure I was drunk when I wrote this vvvvvv
  ((RKFeedView *)(cell.contentView).subviews[0]).event.text = [NSString stringWithFormat:@"%lu CELL", indexPath.row];
  ((RKFeedView *)(cell.contentView).subviews[0]).opponent.text = [NSString stringWithFormat:@"%lu detail", indexPath.section];

  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 88.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  RKIntentSource *source = [[RKIntentSource alloc] initWithIdentifier:NSStringFromClass([self class])
                                                        callbackQueue:dispatch_get_main_queue()
                                                         successBlock:^(id<RKIntent> intent, id<RKIntentHandler> handler) {
                                                           NSLog(@"handled %@", intent);
                                                           return;
                                                         } failureBlock:NULL];

  RKIntent *intent = [[RKIntent alloc] initWithAction:RKIntentActionNavigate
                                                 type:RKIntentTypeObject
                                               source:source
                                              payload:@{@"row": @(indexPath.row),
                                                        @"section": @(indexPath.section)}
                      ];
  [_handler handleIntent:intent];
}

@end
