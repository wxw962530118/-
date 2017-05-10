//
//  BaseViewController.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)setNeedsStatusBarAppearanceUpdate{
    [super setNeedsStatusBarAppearanceUpdate];
}

- (void)viewDidLoad {
    [super viewDidLoad];   
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavigationBar];
}

- (void)setNavigationBar {
    if (1 == self.navigationController.viewControllers.count) {
        self.navigationItem.leftBarButtonItem = nil;
        return;
    }
    /* 设置导航栏上面的内容 */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    // 设置尺寸
    backBtn.frame = (CGRect){{0,0}, backBtn.currentBackgroundImage.size};
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
