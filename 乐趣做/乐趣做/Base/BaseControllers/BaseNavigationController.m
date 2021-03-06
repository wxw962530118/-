//
//  BaseNavigationController.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        // 设置全部导航栏透明度 26 160 239
//        [self.navigationBar setBackgroundColor:SCColor(26 ,160 ,239)]; // 设置导航栏背景颜色
//        [self.navigationBar setBackgroundColor:[UIColor redColor]];
        [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:FontSize18}];
        self.navigationBar.barTintColor = ColorMain;
        [self.navigationBar setTranslucent:YES];
    }
    return self;
}

+ (void)initialize{
    // 获取当前类下面的UIBarButtonItem
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    // 设置导航条按钮的文字颜色
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor redColor];
    [item setTitleTextAttributes:titleAttr forState:UIControlStateNormal];
    // 注意导航条上按钮不可能，用模型的文字属性设置是不好使
    // 设置不可用
    titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:titleAttr forState:UIControlStateHighlighted];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (![viewController isKindOfClass:NSClassFromString(@"PakingsListController")]) self.delegate = nil;
    if (self.viewControllers.count){
        viewController.hidesBottomBarWhenPushed = YES;
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ShowTabViewController" ofType:@"plist"];
        NSArray *showTabVCArr = [[NSArray alloc] initWithContentsOfFile:path];
        for (NSString *vcStr in showTabVCArr) {
            if ([NSStringFromClass([viewController class]) isEqualToString:vcStr]) {
                //处理某些页面需要滚动tabbleView 时 动画隐藏tabbar
                viewController.hidesBottomBarWhenPushed = NO;
            }
        }
    }
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    return [super popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.delegate = nil;
    return [super popToViewController:viewController animated:animated];
}

@end
