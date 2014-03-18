//  Copyright (c) 2014 rokob. All rights reserved.

#import "RKUserContext.h"

#import <atomic>

@interface RKUserContext ()
{
  id<RKUser> _user;
  std::atomic<BOOL> _isValid;
}
- (instancetype)initWithLoggedInUser:(id<RKUser>)user;
@end

@implementation RKUserContext

#pragma mark -
#pragma mark Lifecycle

- (instancetype)init
{
  return [self initWithLoggedInUser:nil];
}

- (instancetype)initWithLoggedInUser:(id<RKUser>)user
{
  if (user) {
    return [self initWithLoggedInUser:user valid:YES];
  }
  return [self initWithLoggedInUser:user valid:NO];
}

- (instancetype)initWithLoggedInUser:(id<RKUser>)user valid:(BOOL)valid
{
  if ((self = [super init])) {
    _user = user;
    _isValid.store(valid);
  }
  return self;
}

#pragma mark -
#pragma mark Public API

+ (instancetype)contextWithUser:(id<RKUser>)user
{
  return [[self alloc] initWithLoggedInUser:user];
}

- (id<RKUser>)loggedInUser
{
  if (_isValid.load()) {
    return _user;
  }
  return nil;
}

#pragma mark -
#pragma mark RKInvalidating

- (BOOL)isValid
{
  return _isValid.load();
}

- (void)invalidate
{
  _isValid.store(NO);
}

@end
