//
//  LoginViewController.h
//  LOGIN
//
//  Created by 古今 on 2016/11/9.
//  Copyright © 2016年 夜风易冷. All rights reserved.
//

#import <UIKit/UIKit.h>

//登录成功操作
typedef void(^LoginSuccessOption)();

@interface LoginViewController : UIViewController

//登录成功操作
@property (nonatomic, copy) LoginSuccessOption successOption;

@end
