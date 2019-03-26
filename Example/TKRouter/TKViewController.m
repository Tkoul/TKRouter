//
//  TKViewController.m
//  TKRouter
//
//  Created by liudouA on 03/26/2019.
//  Copyright (c) 2019 liudouA. All rights reserved.
//

#import "TKViewController.h"
#import <TKRouter/TKRouter.h>
@interface TKViewController ()

@end

@implementation TKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
#pragma --mark  类方法
    // step 一 :AOP 获取类 不需要引入头文件
    Class TKMethodTestClass = [[TKRouter router] routerClassName:@"TKMethodTest"];
    NSLog(@"通过路由获取的类==%@ \n\n\n",TKMethodTestClass);
    //step 二： AOP 调用+ 方法。即类方法
    NSDictionary *par1 =@{@"key1":@"Hello:TKRouter",@"key2":@"SayHi"};
    NSString     *par2 = @"字符串类型参数";
    NSNumber     *par3 = [NSNumber numberWithInt:1688];
    [TKMethodTestClass classMethodSelect:@"TestMethodOneWithObjectType:andPar:andPar:" parameter:&par1,&par2,&par3, nil];
    
#pragma --mark 实例方法
    
    //step 三： AOP 初始化实例对象
    NSObject  *object = [[TKRouter router] routerGetInstanceWithClassName:@"TKMethodTest"];
    NSLog(@"\n初始化的实例对象是===%@\n\n\n",object);
    
    //step 四-： 实例对象调用- 方法 - 传入基本数据类型
    int  par4 = 8888;
    CGFloat par5 = 88.8888;
   ReturnStruct returnOne = [object instanceMethodSelect:@"TestMethodTwoWithBasicType:andSecond:" parameter:&par4,&par5, nil];
    NSLog(@"\n返回值结构体的实例对象==%@ \n返回值结构体的返回值=%@\n\n\n",returnOne.instanceObject,returnOne.returnValue);
    
    
    //step 四二： 实例对象调用- 方法 - 传入结构体
    CGRect par6 = CGRectMake(100, 100, 200.5, 200);
    CGSize par7 = CGSizeMake(666.0, 888.5);
    ReturnStruct returnTwo = [object instanceMethodSelect:@"TestMethodTwoWithStructType:and:" parameter:&par6,&par7, nil];
    NSLog(@"\n返回值结构体的实例对象==%@ \n返回值结构体的返回值=%@\n\n\n",returnTwo.instanceObject,returnTwo.returnValue);
    
    //step 四三： 实例对象调用- 方法 - 传入block块
    void(^parblock8)(NSString *str1) = ^(NSString *str1){
        NSLog(@"\n block 得到的值回调。==%@\n\n\n",str1);
    };
    ReturnStruct returnThere = [object instanceMethodSelect:@"TestMethodTwoWithBlockType:" parameter:&parblock8, nil];
    NSLog(@"\n返回值结构体的实例对象==%@ \n返回值结构体的返回值=%@\n\n\n",returnThere.instanceObject,returnThere.returnValue);
    
    
    //step 五： 实例对象属性赋值。  实例方法执行调用实战
    
    UIButton  *btnTest = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTest.frame = CGRectMake((UIScreen.mainScreen.bounds.size.width-150)/2, 100, 150, 50);
    btnTest.center = self.view.center;
    [btnTest setBackgroundColor:UIColor.cyanColor];
    [btnTest  setTitle:@"push_TKPushViewCtrl" forState:UIControlStateNormal];
    [btnTest.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [btnTest addTarget:self action:@selector(psuNextVctrl) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:btnTest];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)psuNextVctrl{
    //step 五： 实例对象属性赋值。  实例方法执行调用实战
    
//    UINavigationController *navCtrl= [[TKRouter router] routerGetInstanceWithClassName:@"UINavigationController"];
    UIViewController *pushCtrl = [[TKRouter router] routerGetInstanceWithClassName:@"TKPushViewCtrl"];
    void(^parblock9)(NSString *str1) = ^(NSString *str1){
        NSLog(@"\n PushCtrl回调block==%@\n\n\n",str1);
    };
    [pushCtrl  setPropertyParameter:@{@"ProOne":@{@"key1":@"say",@"key2":@"Tkoul"},@"TwoPro":[NSNumber numberWithBool:YES],@"callBackBlock":parblock9}];
    
    int type = 0; //对应各个枚举值
    [pushCtrl instanceMethodSelect:@"TestWithBackColorType:" parameter:&type, nil];
    
    BOOL  animation = YES;
    [self instanceMethodSelect:@"presentViewController:animated:completion:" parameter:&pushCtrl,&animation,nil, nil];
    
    //[self presentViewController:pushCtrl animated:YES completion:nil];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
