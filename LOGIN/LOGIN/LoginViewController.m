//
//  LoginViewController.m
//  LOGIN
//
//  Created by 古今 on 2016/11/9.
//  Copyright © 2016年 夜风易冷. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginSuccessBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    if (self.loginSuccessBtn.selected) {
//        [self.navigationController popViewControllerAnimated:YES];
//    }
}

- (IBAction)okAction {
    
    self.loginSuccessBtn.selected = !self.loginSuccessBtn.selected;
    
    if (self.successOption) {
        self.successOption();
    }
}

- (void)dealloc {
    self.successOption = nil;
    NSLog(@"登录页面已销毁");
}

@end
