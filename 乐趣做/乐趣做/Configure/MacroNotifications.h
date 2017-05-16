//
//  MacroNotifications.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import <Foundation/Foundation.h>

CG_INLINE void NotificationRegister(NSString *name, id observer, SEL selector, id object) {
    
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:name object:object];
}

CG_INLINE void NotificationPost(NSString *name, id object, NSDictionary *userInfo) {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
}

CG_INLINE void NotificationRemove(NSString *name, id observer, id object) {
    
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:name object:object];
}

CG_INLINE void NotificationRemoveAll(id observer) {
    
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}


/* 宏定义__发送通知 */
#define POST_NOTIFICATION_NAMED_(n)           [[NSNotificationCenter defaultCenter] postNotificationName:n object:nil]
#define POST_NOTIFICATION_NAMED_OBJECT(n, o)  [[NSNotificationCenter defaultCenter] postNotificationName:n object:o]


/* 通知类型 */

/**
 通知: 启动页延时页面已经结束 */
UIKIT_EXTERN NSString *const NOTIFICATION_LANCH_DID_FINISHED;

/** 通知: 弹出登录界面 */
UIKIT_EXTERN NSString *const NOTIFICATION_SHOULD_LOGIN;
/** 通知: 退下登录界面 */
UIKIT_EXTERN NSString *const NOTIFICATION_DISMISS_LOGIN;
/** 通知: 重新进入我的优惠券刷新列表 */
UIKIT_EXTERN  NSString *const NOTIFICATION_DID_REFRESHDATA;
/** 通知: 用户已经使用三方登录 */
UIKIT_EXTERN NSString *const NOTIFICATION_DID_THRID_LOGIN;
/** 通知: 用户没有进行三方登录 */
UIKIT_EXTERN NSString *const NOTIFICATION_DID_THRID_LOGIN_CANCEL;
/** 通知: 用户已经登录成功 */
UIKIT_EXTERN NSString *const NOTIFICATION_DID_LOGIN_SUCCEED;
/** 通知: 用户已经登录失败 */
UIKIT_EXTERN NSString *const NOTIFICATION_DID_LOGIN_FAILD;
/** 通知: 用户已经登出成功 */
UIKIT_EXTERN NSString *const NOTIFICATION_DID_LOGOUT_SUCCEED;
/** 通知: 用户已经登出失败 */
UIKIT_EXTERN NSString *const NOTIFICATION_DID_LOGOUT_FAILD;
/** 通知: 用户已经取消登录 */
UIKIT_EXTERN NSString *const NOTIFICATION_DID_CANCEL_LOGIN;


/** 通知: 网络类型已经改变 */
UIKIT_EXTERN NSString *const NOTIFICATION_NETWORK_CHANGED;

/** 通知: 重新定位成功 && 反地理编码成功 */
UIKIT_EXTERN NSString *const NOTIFICATION_REVERSE_GEOCODE_SUCCEED;
/** 通知: 重新定位失败 */
UIKIT_EXTERN NSString *const NOTIFICATION_RELOCATION_FAILD;


/** 通知: 收到推送消息 */
UIKIT_EXTERN NSString *const NOTIFICATION_RECEIVED_REMOTE_PUSH;
/** 通知: 重置密码成功通知 */
UIKIT_EXTERN NSString *const NOTIFICATION_RESETPAYPASSWORD;
/** 通知: 滑动 下面 collectionView的通知 改变 标题的选中文字*/
UIKIT_EXTERN NSString *const NOTIFICATION_SLIDERBOTTOMSEND;
/** 通知: 点击item的通知*/
UIKIT_EXTERN NSString * const NOTIFICATION_TOUCHTOPSENDNOTI;

@interface MacroNotifications : NSObject

@end
