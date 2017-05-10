//
//  RootNavigationController.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "RootNavigationController.h"
#import "LoginViewController.h"
@interface RootNavigationController ()

@end

@implementation RootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.navigationBarHidden = YES;
        
        // 注册通知 （一些基础的通知， 在这里注册）
        [self registObserverForLoginController];
    }
    return self;
}

- (void)registObserverForLoginController{
    /* 登录界面 弹出通知 */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(presentLoginController:) name:NOTIFICATION_SHOULD_LOGIN object:nil];
}

- (void)presentLoginController:(NSNotification *)not{
    LoginViewController *login = [[LoginViewController alloc] init];
    [self presentViewController:[[BaseNavigationController alloc] initWithRootViewController:login] animated:YES completion:nil];
}

@end
