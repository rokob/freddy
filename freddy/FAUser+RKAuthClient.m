//  Copyright (c) 2014 rokob. All rights reserved.

#import "FAUser+RKAuthClient.h"

@implementation FAUser (RKAuthClient)

- (NSString *)token
{
  return [self authToken];
}

- (BOOL)isNew
{
  return NO;
}

@end
