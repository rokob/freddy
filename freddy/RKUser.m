//  Copyright (c) 2014 rokob. All rights reserved.

#import "RKUser.h"

@interface RKUser ()
@property (nonatomic, readwrite, copy) NSString *token;
@property (nonatomic, readwrite, copy) NSString *userId;
@property (nonatomic, readwrite, copy) NSString *email;

@property (nonatomic, readwrite, assign) BOOL isNew;
@property (nonatomic, readwrite, strong) ACAccount *thirdPartyUserAccount;
@property (nonatomic, readwrite, copy) NSDictionary *thirdPartyUserData;
@end

@implementation RKUser

- (instancetype)initWithToken:(NSString *)token
                       userId:(NSString *)userId
                        email:(NSString *)email
                        isNew:(BOOL)isNew
        thirdPartyUserAccount:(ACAccount *)thirdPartyUserAccount
            thirdPartUserData:(NSDictionary *)thirdPartyUserData
{
  if ((self = [super init])) {
    _token = [token copy];
    _userId = [userId copy];
    _email = [email copy];
    _isNew = isNew;
    _thirdPartyUserAccount = thirdPartyUserAccount;
    _thirdPartyUserData = [thirdPartyUserData copy];
  }
  return self;
}

- (id)copyWithZone:(NSZone *)zone
{
  return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
  return [[RKMutableUser alloc] initWithToken:_token
                                       userId:_userId
                                        email:_email
                                        isNew:_isNew
                        thirdPartyUserAccount:_thirdPartyUserAccount
                            thirdPartUserData:_thirdPartyUserData];
}

@end

@implementation RKMutableUser

- (instancetype)initWithToken:(NSString *)token
                       userId:(NSString *)userId
                        email:(NSString *)email
                        isNew:(BOOL)isNew
        thirdPartyUserAccount:(ACAccount *)thirdPartyUserAccount
            thirdPartUserData:(NSDictionary *)thirdPartyUserData
{
  if ((self = [super init])) {
    self.token = [token copy];
    self.userId = [userId copy];
    self.email = [email copy];
    self.isNew = isNew;
    self.thirdPartyUserAccount = thirdPartyUserAccount;
    self.thirdPartyUserData = [thirdPartyUserData copy];
  }
  return self;
}

- (id)copyWithZone:(NSZone *)zone
{
  return [[RKUser alloc] initWithToken:self.token
                                userId:self.userId
                                 email:self.email
                                 isNew:self.isNew
                 thirdPartyUserAccount:self.thirdPartyUserAccount
                     thirdPartUserData:self.thirdPartyUserData];
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
  return [[self copy] mutableCopyWithZone:zone];
}

@end
