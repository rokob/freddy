//  Copyright (c) 2014 rokob. All rights reserved.

#import "RKFeedView.h"

@implementation RKFeedView

- (id)initWithFrame:(CGRect)frame
{
  if ((self = [super initWithFrame:frame])) {
    _event = [[UILabel alloc] initWithFrame:CGRectZero];
    _opponent = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:_event];
    [self addSubview:_opponent];
  }
  return self;
}

- (void)layoutSubviews
{
  CGRect bounds = self.bounds;
  CGSize sizeOfEvent = [_event sizeThatFits:CGSizeMake(bounds.size.width, CGFLOAT_MAX)];
  CGSize sizeOfOpponent = [_opponent sizeThatFits:CGSizeMake(bounds.size.width, CGFLOAT_MAX)];
  CGSize sizeToUse = CGSizeMake(MAX(sizeOfEvent.width, sizeOfOpponent.width), MAX(sizeOfEvent.height, sizeOfOpponent.height));
  [_event setFrame:(CGRect){ .origin = { .x = 5, .y = 5},
    .size = { .width = sizeToUse.width, .height = sizeOfEvent.height}
  }];
  CGFloat yOffset = CGRectGetMaxY(_event.frame);
  [_opponent setFrame:(CGRect){ .origin = {.x = 5, .y = 5 + yOffset},
    .size = {. width = sizeToUse.width, .height = sizeOfOpponent.height}
  }];
}

@end
