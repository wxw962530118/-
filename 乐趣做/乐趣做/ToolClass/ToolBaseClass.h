//
//  ToolBaseClass.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "BaseViewController.h"
#import "BaseNavigationController.h"
@interface ToolBaseClass : NSObject
+(instancetype )manager;
/**获取window*/
+(UIWindow *)getRootWindow;
/** *用颜色生成图片 */
+ (UIImage *)imageWithColor:(UIColor *)color;
/** *获取当前版本号 */
+ (NSString *)getCurrentVersion;
///** *获取最前端的控制器 */
//+ (BaseViewController *)getTheFrontViewController;
///** *获取Tab控制器 */
//+ (UITabBarController *)getTabBarController;
//
///** *获取根导航控制器 (仅限打开特殊推送界面时使用)*/
//+ (BaseViewController *)getRootNavController;

/** *获取最前端的导航控制器 */
+ (BaseNavigationController *)getTheFrontNavigationController;
/** *提示弹窗 快捷方式 otherButtonTitles类型:NSString或NSArray */
- (UIAlertView *)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(id)otherButtonTitles callBack:(void(^)(NSUInteger index))callBack;

/** *底部弹窗 快捷方式 otherButtonTitles类型:NSString或NSArray */
- (UIActionSheet *)actionSheetWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(id)otherButtonTitles callBack:(void (^)(NSUInteger))callBack;

@end

/** Tool: Alert快捷方式, otherButtonTitles类型:NSString或NSArray ,点击取消的返回值为 0 */
CG_INLINE UIAlertView *AlertView(NSString *title, NSString *message, NSString *cancelButtonTitle, id otherButtonTitle, void(^callBack)(NSUInteger index)){
    return [[ToolBaseClass manager] alertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle callBack:^(NSUInteger index) {
        callBack(index);
    }];
}

/** Tool: ActionSheet快捷方式, otherButtonTitles类型:NSString或NSArray */
CG_INLINE UIActionSheet *ActionSheet(NSString *title, NSString *cancelButtonTitle, NSString *destructiveButtonTitle, id otherButtonTitles, void(^callBack)(NSUInteger index)){
    return [[ToolBaseClass manager] actionSheetWithTitle:title cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:otherButtonTitles callBack:^(NSUInteger index) {
        callBack(index);
    }];
}


#define CurrVersion                 [ToolBaseClass getCurrentVersion]
#define APP_RootTabBarC             [ToolBaseClass getTabBarController]
#define APP_RootNavigationC         [ToolBaseClass getRootNavController]
#define App_TheFrontViewC           [ToolBaseClass getTheFrontViewController]
#define App_TheFrontNavC            [ToolBaseClass getTheFrontNavigationController]
