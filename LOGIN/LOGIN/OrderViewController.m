//
//  OrderViewController.m
//  LOGIN
//
//  Created by 古今 on 2016/11/9.
//  Copyright © 2016年 夜风易冷. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    
}

- (IBAction)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {    
    NSLog(@"填写订单页面已销毁");
}


@end
