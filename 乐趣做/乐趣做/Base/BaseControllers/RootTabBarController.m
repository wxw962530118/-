//
//  RootTabBarController.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "RootTabBarController.h"
#import "BaseNavigationController.h"
#import "BaseViewController.h"
#import "RootTabItemModel.h"
#import "MJExtension.h"
/** TabBar根控制器目录 */
#define TabControllerCatalog @"TabCatalog"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

/** 从本地获取Tabbar根控制器目录 */
- (NSArray<RootTabItemModel *> *)fetchTabCatalogFromBundle
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:TabControllerCatalog ofType:@"plist"];
    NSArray *tabConCatalog = [[NSArray alloc] initWithContentsOfFile:plistPath];
    NSMutableArray *tabModels = [RootTabItemModel mj_objectArrayWithKeyValuesArray:tabConCatalog];
    for (RootTabItemModel *model in tabModels) {
        model.rIcon_normal = [UIImage imageNamed:model.icon_normal];
        model.rIcon_selected = [UIImage imageNamed:model.icon_selected];
    }
    return tabModels;
}

/** 从网络获取Tabbar根控制器目录 */
- (NSArray<RootTabItemModel *> *)fetchTabCatalonFromNet
{
    return @[];
}

/** 解析数据创建Tab的子控制器 */
- (NSArray *)foundTabBarControllers
{
    NSMutableArray *arrayTabControllers = [NSMutableArray array];
    
    for (RootTabItemModel *tabModel in [self fetchTabCatalogFromBundle]) {
        UIViewController *tabController = [[[NSClassFromString(tabModel.class_name) class] alloc] init];
        tabController.title = tabModel.title;
        tabController.tabBarItem = [[UITabBarItem alloc] initWithTitle:tabModel.title image:tabModel.rIcon_normal selectedImage:tabModel.rIcon_selected];
        [tabController.tabBarItem setTitlePositionAdjustment:(UIOffset){0, 20}];
        [tabController.tabBarItem setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
        
        [arrayTabControllers addObject:[[BaseNavigationController alloc] initWithRootViewController:tabController]];
    }
    
    return arrayTabControllers;
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static RootTabBarController *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configAttribute];
        self.viewControllers = [self foundTabBarControllers];
        [self resetTabBarItems];
    }
    return self;
}

- (void)configAttribute
{
    //    self.view.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    //    [self setTabBarHidden:YES animated:YES];
}

- (void)resetTabBarItems
{
    for (UIView *barBtn in self.tabBar.subviews) {
        if ([barBtn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (UIView *barBtnView in barBtn.subviews) {
                if ([barBtnView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                    // 无需设置 该参数, 图片可自适应
                    //                    barBtnView.size = (CGSize){20, 36};
                }
                if ([barBtnView isKindOfClass:NSClassFromString(@"UITabBarButtonLabel")]) {
                    [barBtnView removeFromSuperview];
                    barBtnView.hidden = YES;
                }
            }
        }
    }
}

@end
