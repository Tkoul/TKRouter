//
//  TKMethodTest.h
//  TKRouter
//
//  Created by 刘豆 on 2019/3/26.
//  Copyright © 2019年 liudouA. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TKMethodTest : NSObject

+ (NSString*)TestMethodOneWithObjectType:(NSDictionary*)dic andPar:(NSString*)strOne andPar:(NSNumber*)numTwo;

- (void)TestMethodTwoWithBasicType:(int)numberone  andSecond:(CGFloat)floatTwo;

- (BOOL)TestMethodTwoWithStructType:(CGRect)struOne and:(CGSize)struTwo;

- (NSString*)TestMethodTwoWithBlockType:(void(^)(NSString *str1))block;


@end

NS_ASSUME_NONNULL_END
