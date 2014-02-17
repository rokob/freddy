//  Copyright (c) 2014 rokob. All rights reserved.

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Specta/Specta.h>

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>

@interface RKExample : NSObject
@property (nonatomic, readwrite, copy) NSString *name;
- (NSInteger)what:(NSString *)string;
- (void)waitAndCallback:(void(^)(void))callback;
@end
@implementation RKExample
- (NSInteger)what:(NSString *)string
{
  if ([string isEqualToString:_name]) {
    return 1;
  } else {
    return 0;
  }
}
- (void)waitAndCallback:(void (^)(void))callback
{
  double delayInSeconds = 1.0;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    if (callback) {
      callback();
    }
  });
}
@end

SpecBegin(Thing)

describe(@"some thing", ^{

  sharedExamplesFor(@"all examples", ^(NSDictionary *data) {
    it(@"should know their own name", ^{
      expect(data[@"name"]).to.equal(@1);
    });

    it(@"should know what is not their name", ^{
      expect(data[@"not_name"]).toNot.equal(@1);
    });
  });

  __block NSDictionary *data;
  __block int testCount = 0;
  __block RKExample *example;
  beforeAll(^{
    data = @{@"a": @1, @"b": @2};
  });

  beforeEach(^{
    testCount++;
    example = [[RKExample alloc] init];
    example.name = @"a";
  });

  it(@"should be in the dictionary", ^{
    expect([data objectForKey:example.name]).notTo.beNil();
    expect(testCount).to.equal(1);
  });

  it(@"should have right count", ^{
    expect(testCount).to.equal(2);
  });

  itShouldBehaveLike(@"all examples", ^{
    return @{@"name": @([example what:example.name]),
             @"not_name": @([example what:[example.name stringByAppendingString:@"NOTNOT"]])
             };
  });

  it(@"should do the right callback", ^AsyncBlock {
    [example waitAndCallback:^{
      done();
    }];
  });

});

SpecEnd

SpecBegin(OtherThing);

pending(@"some other thing");

describe(@"other thing", ^{
  it(@"should be true", ^{
    expect(YES).to.beTruthy;
  });
});

SpecEnd
