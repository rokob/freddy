//  Copyright (c) 2014 rokob. All rights reserved.

#import <Foundation/Foundation.h>

#import <RKAuthClient/RKAuthClientTypes.h>

@interface RKUser : NSObject <RKUser, NSCopying, NSMutableCopying>

- (instancetype)initWithToken:(NSString *)token
                       userId:(NSString *)userId
                        email:(NSString *)email
                        isNew:(BOOL)isNew
        thirdPartyUserAccount:(ACAccount *)thirdPartyUserAccount
            thirdPartUserData:(NSDictionary *)thirdPartyUserData;

@property (nonatomic, readonly, copy) NSString *token;
@property (nonatomic, readonly, copy) NSString *userId;
@property (nonatomic, readonly, copy) NSString *email;

@property (nonatomic, readonly, assign) BOOL isNew;
@property (nonatomic, readonly, strong) ACAccount *thirdPartyUserAccount;
@property (nonatomic, readonly, copy) NSDictionary *thirdPartyUserData;

@end

@interface RKMutableUser : RKUser

- (instancetype)initWithToken:(NSString *)token
                       userId:(NSString *)userId
                        email:(NSString *)email
                        isNew:(BOOL)isNew
        thirdPartyUserAccount:(ACAccount *)thirdPartyUserAccount
            thirdPartUserData:(NSDictionary *)thirdPartyUserData;

@property (nonatomic, readwrite, copy) NSString *token;
@property (nonatomic, readwrite, copy) NSString *userId;
@property (nonatomic, readwrite, copy) NSString *email;

@property (nonatomic, readwrite, assign) BOOL isNew;
@property (nonatomic, readwrite, strong) ACAccount *thirdPartyUserAccount;
@property (nonatomic, readwrite, copy) NSDictionary *thirdPartyUserData;

@end
