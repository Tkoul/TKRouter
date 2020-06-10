//
//  TKMethodTest.m
//  TKRouter
//
//  Created by Tkoul on 2019/3/26.
//  Copyright © 2019年 Tkoul. All rights reserved.
//

#import "TKMethodTest.h"

@implementation TKMethodTest
+ (NSString*)TestMethodOneWithObjectType:(NSDictionary*)dic andPar:(NSString*)strOne andPar:(NSNumber*)numTwo{
    
    NSLog(@"\n路由唤起方法 %@ \n入参 dic==%@ \n入参 strOne = %@ \n入参 numTwo = %@ \n\n\n",NSStringFromSelector(_cmd),dic,strOne,numTwo);
    
    return @"返回值自自定";
    
}

- (void)TestMethodTwoWithBasicType:(int)numberone  andSecond:(CGFloat)floatTwo{
    
     NSLog(@"\n路由唤起方法 %@ \n入参 numberone==%d \n入参 floatTwo = %f \n\n\n",NSStringFromSelector(_cmd),numberone,floatTwo);
}

- (BOOL)TestMethodTwoWithStructType:(CGRect)struOne and:(CGSize)struTwo{
    
    NSLog(@"\n路由唤起方法 %@ \n入参 struOne==%@ \n入参 struTwo = %@  \n\n\n",NSStringFromSelector(_cmd),NSStringFromCGRect(struOne),NSStringFromCGSize(struTwo));
    
    return YES;
}

- (NSString*)TestMethodTwoWithBlockType:(void(^)(NSString *str1))block{
    
    if (block) {
        
        block(@"block 回调执行 并传值");
    }
    
    return @"block方法执行完毕";
}
@end
