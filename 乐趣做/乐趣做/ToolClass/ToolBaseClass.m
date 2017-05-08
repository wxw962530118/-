//
//  ToolBaseClass.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "ToolBaseClass.h"
#import "AppDelegate.h"
static ToolBaseClass * manager = nil;

@interface ToolBaseClass ()<UIAlertViewDelegate,UIActionSheetDelegate>

@property (nonatomic, copy) void(^callBack)(NSUInteger index);


@end


@implementation ToolBaseClass

+ (instancetype)manager{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[self alloc] init];
    });
    return manager;
}


// 颜色转换为背景图片
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

////获取当前屏幕显示的viewcontroller
//+ (BaseViewController *)getTheFrontViewController{
//    UINavigationController * rootNavC = [self getRootNavController];
//    if (![rootNavC isKindOfClass:[UINavigationController class]]) return [[BaseViewController alloc] init]; //防止闪退
//    if (1 < rootNavC.viewControllers.count) {
//        return rootNavC.viewControllers.lastObject;
//    }
//    else {
//        UINavigationController *subNavC = [[self getTabBarController] selectedViewController];
//        for (UIViewController *vc in subNavC.viewControllers) {
//            NSLog(@"%@", vc);
//        }
//        if (![subNavC.viewControllers.lastObject isKindOfClass:[BaseViewController class]]) return [[BaseViewController alloc] init]; //防止未继承BaseVC的控制器的闪退
//        return subNavC.viewControllers.lastObject;
//    }
//}
//
//+ (BaseNavigationController *)getTheFrontNavigationController{
//    if (1 < APP_RootNavigationC.viewControllers.count) {
//        return APP_RootNavigationC;
//    }else {
//        return [[self getTabBarController] selectedViewController];
//    }
//}
//
//+ (UITabBarController *)getTabBarController{
//    return APP_RootNavigationC.viewControllers.firstObject;
//}
//
//+ (BaseNavigationController *)getRootNavController{
//    return (BaseNavigationController *)[[[UIApplication sharedApplication].delegate window] rootViewController];
//}


- (UIAlertView *)alertWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable id)otherButtonTitles callBack:(void (^)(NSUInteger))callBack{
    self.callBack = callBack;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles: nil];
    if ([otherButtonTitles isKindOfClass:[NSArray class]]) {
        for (NSString *otherTitle in otherButtonTitles) {
            [alert addButtonWithTitle:otherTitle];
        }
    }
    else if ([otherButtonTitles isKindOfClass:[NSString class]]) {
        [alert addButtonWithTitle:otherButtonTitles];
    }
    [alert show];
    return alert;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.callBack) {
        self.callBack(buttonIndex);
    }
}

- (UIActionSheet *)actionSheetWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(id)otherButtonTitles callBack:(void (^)(NSUInteger))callBack
{
    self.callBack = callBack;
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles: nil];
    //    sheet.cancelButtonIndex = 0;
    //    sheet.destructiveButtonIndex = 1;
    if ([otherButtonTitles isKindOfClass:[NSArray class]]) {
        for (NSString *otherTitle in otherButtonTitles) {
            [sheet addButtonWithTitle:otherTitle];
        }
    }
    else if ([otherButtonTitles isKindOfClass:[NSString class]]) {
        [sheet addButtonWithTitle:otherButtonTitles];
    }
    [sheet showInView:[UIApplication sharedApplication].keyWindow];
    return sheet;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.callBack) {
        self.callBack(buttonIndex);
    }
}

+ (NSString *)getCurrentVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (UIWindow *)getRootWindow{
    NSArray *windows = [UIApplication sharedApplication].windows;
    AppDelegate *delegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds)&&window==delegate.window)
            
            return window;
    }
    return [[UIApplication sharedApplication].delegate window];
}


@end
