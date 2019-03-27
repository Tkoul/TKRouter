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
    
    //万能路由API调用，解决耦合！
    //1. 组件+组件。组件之间相互调用,不需要强依赖,不需要引入头文件 ， 调用其它组件的任意方法！非常适合多组件的开发
    
    //2. 路由采用指针传值的方式，保证了值的正确性。
    
    //3. pod开发 多sdk - 依赖第三方sdk！ 比如 项目中用到组件sdk——A 依赖了第三方AFNetWorking， 项目中用到组件sdk——B 依赖了第三方AFNetWorking，那么集成到一起，如果AFNetWorking版本不一致，那样就会报错！逼迫我们下掉其中一个sdk的AFNetWorking，比如去掉A的AFNetWorking，让A和B共用AFNetWorking，这个时候，在A单独开发的时候，我么引入虚拟的AFNetWorking，调用api的时候，不要引入AFNetWorking的头文件，因为最终要和B集成，A执行pod repo push 的时候，不能带上AFNetWorking，那么引入头文件就会因为不含邮AFNetWorking而报错，所以用万能路由就可以解决！顺利的吧A repo push 到pod库！另外pod依赖的版本必须是一致的。我们知道在大版本甚至一个sdk的api是不会变更的！ 那么我们就不用关心AFNetWorking的版本，以及冲突问题，直接使用路由，也不需要关心引入头文件，直接使用B的组件AFNetWorking，直接调用方法!
    
    NSArray  *titleArry = @[@"获取类",@"调用类方法-对象类型",@"初始化实例对象",@"实例方法-基本数据类型",@"实例方法-基结构体",@"实例方法-block块",@"push视图+例子",@"sdddd"];
    for (int i=0; i<titleArry.count; i++) {
        UIButton  *btnTest = [UIButton buttonWithType:UIButtonTypeCustom];
        btnTest.frame = CGRectMake((UIScreen.mainScreen.bounds.size.width-180)/2, 80+60*i, 180, 50);
        [btnTest setBackgroundColor:UIColor.cyanColor];
        [btnTest  setTitle:titleArry[i] forState:UIControlStateNormal];
        [btnTest.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [btnTest setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [btnTest.layer setCornerRadius:25];
        btnTest.tag = i;
        [btnTest addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnTest];
    }
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)btnAction:(UIButton*)sender{
    
    switch (sender.tag) {
        case 0:
        {
            // step 一 :AOP 获取类 不需要引入头文件
            Class TKMethodTestClass = [[TKRouter router] routerClassName:@"TKMethodTest"];
            NSLog(@"通过路由获取的类==%@ \n\n\n",TKMethodTestClass);
            
        }
            break;
        case 1:
        {
            Class TKMethodTestClass = [[TKRouter router] routerClassName:@"TKMethodTest"];
            //step 二： AOP 调用+ 方法。即类方法
            NSDictionary *par1 =@{@"key1":@"Hello:TKRouter",@"key2":@"SayHi"};
            NSString     *par2 = @"字符串类型参数";
            NSNumber     *par3 = [NSNumber numberWithInt:1688];
            [TKMethodTestClass classMethodSelect:@"TestMethodOneWithObjectType:andPar:andPar:" parameter:&par1,&par2,&par3, nil];
            
        }
            break;
        case 2:
        {
            //step 三： AOP 初始化实例对象
            NSObject  *object = [[TKRouter router] routerGetInstanceWithClassName:@"TKMethodTest"];
            NSLog(@"\n初始化的实例对象是===%@\n\n\n",object);
        }
            break;
        case 3:
        {
            
            //step 四-： 实例对象调用- 方法 - 传入基本数据类型
            NSObject  *object = [[TKRouter router] routerGetInstanceWithClassName:@"TKMethodTest"];
            int  par4 = 8888;
            CGFloat par5 = 88.88;
            ReturnStruct returnOne = [object instanceMethodSelect:@"TestMethodTwoWithBasicType:andSecond:" parameter:&par4,&par5, nil];
            NSLog(@"\n返回值结构体的实例对象==%@ \n返回值结构体的返回值=%@\n\n\n",returnOne.instanceObject,returnOne.returnValue);
            
        }
            break;
        case 4:
        {
            
            //step 四二： 实例对象调用- 方法 - 传入结构体
            NSObject  *object = [[TKRouter router] routerGetInstanceWithClassName:@"TKMethodTest"];
            CGRect par6 = CGRectMake(100, 100, 200.5, 200);
            CGSize par7 = CGSizeMake(666.0, 888.5);
            ReturnStruct returnTwo = [object instanceMethodSelect:@"TestMethodTwoWithStructType:and:" parameter:&par6,&par7, nil];
            NSLog(@"\n返回值结构体的实例对象==%@ \n返回值结构体的返回值=%@\n\n\n",returnTwo.instanceObject,returnTwo.returnValue);
            
        }
            break;
        case 5:
        {
            //step 四三： 实例对象调用- 方法 - 传入block块
            NSObject  *object = [[TKRouter router] routerGetInstanceWithClassName:@"TKMethodTest"];
            void(^parblock8)(NSString *str1) = ^(NSString *str1){
                NSLog(@"\n block 得到的值回调。==%@\n\n\n",str1);
            };
            ReturnStruct returnThere = [object instanceMethodSelect:@"TestMethodTwoWithBlockType:" parameter:&parblock8, nil];
            NSLog(@"\n返回值结构体的实例对象==%@ \n返回值结构体的返回值=%@\n\n\n",returnThere.instanceObject,returnThere.returnValue);
            
        }
            break;
        case 6:
        {
            
            //step 五： 实例对象属性赋值。  实例方法执行调用实战
            UIViewController *pushCtrl = [[TKRouter router] routerGetInstanceWithClassName:@"TKPushViewCtrl"];
            void(^parblock9)(NSString *str1) = ^(NSString *str1){
                
                NSLog(@"\n PushCtrl回调block==%@\n\n\n",str1);
            };
            //设置属性
            [pushCtrl  setPropertyParameter:@{@"ProOne":@{@"key1":@"say",@"key2":@"Tkoul"},@"TwoPro":[NSNumber numberWithBool:YES],@"callBackBlock":parblock9}];
            
            //设置代理
            [pushCtrl setPropertyParameter:@{@"delegete":self}];
            
            NSInteger type = 0; //对应各个枚举值
            [pushCtrl instanceMethodSelect:@"TestWithBackColorType:" parameter:&type, nil];
            
            BOOL  animation = YES;
            [self instanceMethodSelect:@"presentViewController:animated:completion:" parameter:&pushCtrl,&animation,nil, nil];
            
        }
            break;
            
        default:
            break;
    }
    
    
    
}

/**
 代理方法  使用路由h实现！ 参数使用UIViewController
 1.为解决耦合。不引入头文件
 2.因为显式转换，UIViewController 少了TKPushViewCtrl的属性，方法，使用kvc来获取属性，万能路由调用方法

 @param ctrl 显式转换TKPushViewCtrl类型到UIViewController  如果用到ctrl的方法或者属性，万能路由即可解决！
 */
- (void)DelegeteTestMethod:(UIViewController*)ctrl{
    
    NSLog(@"执行了代理  代理传过来的值是 ===%@",ctrl);
    //1.获取TKPushViewCtrl 属性 --KVC
    NSDictionary  *ProOne = [ctrl valueForKey:@"ProOne"];
    NSLog(@"TKPushViewCtrl 的属性 ProOne 的值是==%@",ProOne);
    
    //2.TKPushViewCtrl 调用方法 改变颜色
    NSInteger  type = 2;
    [ctrl instanceMethodSelect:@"TestWithBackColorType:" parameter:&type, nil];
    
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
