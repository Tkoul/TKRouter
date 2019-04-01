//
//  TKPushViewCtrl.m
//  TKRouter
//
//  Created by Tkoul on 2019/3/26.
//  Copyright © 2019年 Tkoul. All rights reserved.
//

#import "TKPushViewCtrl.h"

@interface TKPushViewCtrl ()

@end

@implementation TKPushViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray  *titileArry = @[@"代理测试",@"返回"];
    for (int i=0; i<2; i++) {
        UIButton  *btnTest = [UIButton buttonWithType:UIButtonTypeCustom];
        btnTest.frame = CGRectMake((UIScreen.mainScreen.bounds.size.width-150)/2, 100+100*i, 150, 50);
        [btnTest setBackgroundColor:UIColor.cyanColor];
        [btnTest  setTitle:titileArry[i] forState:UIControlStateNormal];
        [btnTest.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [btnTest setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [btnTest.layer setCornerRadius:25];
        btnTest.tag = i;
        [btnTest addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnTest];
    }
    // Do any additional setup after loading the view.
}

- (void)btnAction:(UIButton*)sender{
    
    switch (sender.tag) {
        case 0:
            if ([_delegete respondsToSelector:@selector(DelegeteTestMethod:)]) {
                [_delegete  DelegeteTestMethod:self];
            }
            break;
        case 1:
            [self  dismissViewControllerAnimated:YES completion:nil];
            break;
            
        default:
            break;
    }
    
    
}
    


- (void)TestWithBackColorType:(TestColorType)colorType{
    
    if (self.callBackBlock) {
        self.callBackBlock(@"TestWithBackColorType:方法f调用成功，设置完背景色");
    }
    
    switch (colorType) {
            case TypeOne_RedColor:
            [self.view setBackgroundColor:UIColor.redColor];
            NSLog(@"背景色彩是 红色");
            break;
            
            case TypeTwo_CyColor:
            [self.view setBackgroundColor:UIColor.cyanColor];
            NSLog(@"背景色彩是 cyanColor");
            break;
            
            case TypeThere_OranColor:
            [self.view setBackgroundColor:UIColor.orangeColor];
            NSLog(@"背景色彩是 orangeColor");
            break;
            
        default:
            break;
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
