//
//  DetailViewController.m
//  LOGIN
//
//  Created by 古今 on 2016/11/9.
//  Copyright © 2016年 夜风易冷. All rights reserved.
//

#import "DetailViewController.h"
#import "LoginViewController.h"
#import "OrderViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
//当前登录状态: YES=已登录；NO=未登录
@property (nonatomic, assign, readonly) BOOL currentLoginStatus;

@end

@implementation DetailViewController

- (BOOL)currentLoginStatus {
    return self.loginBtn.selected;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.loginBtn.selected = !self.loginBtn.selected;
    
    if (self.loginBtn.selected) {
        NSLog(@"登录成功!");
    } else {
        NSLog(@"注销成功!");
    }
}

- (IBAction)loginAction:(UIButton *)button {
    
    OrderViewController *orderVC = [[OrderViewController alloc] initWithNibName:@"OrderViewController" bundle:nil];
    orderVC.title = @"填写订单";
    
    [self automaticallyLoginPushWithDestVC:orderVC];
}

/**
 自动登录并推出目标VC
 
 @param destVC 目标VC
 */
- (void)automaticallyLoginPushWithDestVC:(UIViewController *)destVC {
    //校验
    if ((!destVC) ||(![destVC isKindOfClass:[UIViewController class]])) {
        return;
    }
    
    //------>已登录
    if (self.currentLoginStatus) {
        [self.navigationController pushViewController:destVC animated:YES];
        return;
    }
    
    //------>未登录
    //1.获取视图控制器数据源
    NSArray *vcArray = self.navigationController.viewControllers;
    
    //2.1实例化登录VC
    LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    loginVC.title = @"登录";
    //2.2 添加登录成功操作
    loginVC.successOption = ^(){
        //2.2.1释放登录VC
        self.navigationController.viewControllers = vcArray;
        //2.2.2.推出下一VC
        [self.navigationController pushViewController:destVC animated:YES];
    };
    
    //3.推出登录VC
    [self.navigationController pushViewController:loginVC animated:YES];
}



@end
