//
//  TKPushViewCtrl.h
//  TKRouter
//
//  Created by Tkoul on 2019/3/26.
//  Copyright © 2019年 Tkoul. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TKPushViewCtrl;

typedef enum : NSUInteger {
    TypeOne_RedColor,
    TypeTwo_CyColor,
    TypeThere_OranColor,
} TestColorType;

@protocol DelegeteTest <NSObject>

- (void)DelegeteTestMethod:(TKPushViewCtrl*)ctrl;

@end

@interface TKPushViewCtrl : UIViewController
//属性1 对象类型
@property(strong,nonatomic)NSDictionary *ProOne;
//属性2 -- 基本数据类型
@property(assign,nonatomic)BOOL TwoPro;

//属性3  block
@property(assign,nonatomic)void (^callBackBlock)(NSString* callBlockStr);

//属性4 delegete
@property(weak,nonatomic) id <DelegeteTest> delegete;


- (void)TestWithBackColorType:(TestColorType)colorType;


@end



NS_ASSUME_NONNULL_END
