//
//  TKPushViewCtrl.m
//  TKRouter
//
//  Created by 刘豆 on 2019/3/26.
//  Copyright © 2019年 liudouA. All rights reserved.
//

#import "TKPushViewCtrl.h"

@interface TKPushViewCtrl ()

@end

@implementation TKPushViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
