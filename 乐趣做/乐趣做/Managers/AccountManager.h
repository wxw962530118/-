//
//  AccountManager.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
@interface AccountManager : NSObject

+ (instancetype)manager;
/**
 *  获取用户信息 */
+ (Account *)getUser;

/**
 *  退出登录 */
+ (void)signOutUser;

/**
 *  存储用户信息 */
+ (BOOL)saveUserWithAccount:(Account *)account;

/**
 *  清除用户信息 */
+ (BOOL)signOutEven;

/**
 *  清除缓存 */
+ (BOOL)clearCache:(NSString *)path;

+ (BOOL)clearCache;

/**
 *  记录用户的未读消息状态
 *  [已对不同的登录用户 进行区分]
 */
+ (void)setAccountHasNews:(BOOL)hasNews;

/**
 *  获取用户是否有未读消息状态
 *  [已对不同的登录用户 进行区分]
 */
+ (BOOL)getAccountHasNews;

/**
 *  存储用户设备的RegistrationID
 */
+ (BOOL)saveRegistrationID:(NSString *)registrationID;

//+ (void)reSetCarVerifyStatue;

/**
 *  获取用户设备的RegistrationID
 */
+ (NSString *)getRegistrationID;

///**
// *  保存用户位置 */
//+ (void)saveUserLastLocation:(CLLocation *)location;
//
///**
// *  获取用户位置 */
//+ (CLLocation *)getUserLastLocation;

/**
 *  获取用户地理位置编码 */
+ (NSDictionary *)getUserLocationGeocode;

///**
// *  保存用户搜索历史 */
//+ (void)saveUserSerarchHistory:(TCSearchModle *)searchModle;

/**
 *  获取用户搜索历史 */
+ (NSMutableArray *)getUserSerarchHistory;

/**
 *  清除用户搜索历史 */
+ (void)clearUserSearchHistory;

/**
 *  设置我的页面 车辆的状态信息
 */
+ (NSAttributedString *)setComeFromCarInfo:(NSString *)state;

/**
 *  存储当前位置下最近站点的ID值 */
+ (BOOL)saveRecentlyStationID:(NSString *)ID;

/**
 *  获取当前位置下最近站点的ID值 */
+ (NSString *)getRecentlyStationID;

/**
 设置当前绑定的小队长卡数量 */
+ (BOOL)setBindingBicycleCardNumber:(NSUInteger)cardNumber;

/**
 获取当前绑定的小队长卡数量 */
+ (NSUInteger)getBindingCurrentBicycleCardNumber;
/**
 设置当前输入的手机号码 */
+(BOOL )setLoginPhoneNumber:(NSString *)phoneNumber;
/**
 获取当前输入的手机号码*/
+(NSString *)getLoginPhoneNumber;
/**
 清除当前输入的手机号码*/
+(void)removeLoginPhoneNumber;

/**
 保存chargeId
 @param chargeId 充电记录的id
 */
+ (void)saveUserChargeIdWith:(NSString *)chargeId;

/**
 获取用户存储的chargeId
 */
+ (NSString *)getUserChargeId;

#pragma mark - App级操作

@end


