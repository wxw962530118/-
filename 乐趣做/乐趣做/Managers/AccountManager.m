//
//  AccountManager.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "AccountManager.h"
#import "SDImageCache.h"
/** 是否第一次打开App */
NSString *const kIsFirstOpenApp = @"is_first_open_app";

/** 未登录状态下 记录的user_id值 */
static NSInteger kNoLoginUserID = 0;

#define USER_SEARCH_SVAE_KEY    [NSString stringWithFormat:@"%ld_userSearchHisttory.archive",kUserCommonMode]

#define DOUCUMENT_ACCOUNT_ARCHIVE   @"account.archive"

#define DOUCUMENT_LOCATION_ARCHIVE  @"location.archive"

#define kAccountNewsStatusList      @"Account_News_status_List"     // NSUserDefaults - 存储某个用户的是否有未读消息


#define kCurrLoginPhoneNumberDefaults @"textFieldTextDefaults"// NSUserDefaults - 存储用户输入的手机号码

static AccountManager * manager = nil;

@implementation AccountManager

+ (instancetype)manager{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

+ (Account *)getUser{
    // 沙盒路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:DOUCUMENT_ACCOUNT_ARCHIVE];
    
    Account *account = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    return account;
}

+ (void)signOutUser{
    Account * account = [AccountManager getUser];
//    AFHTTPRequestOperationManager * manage = [AFHTTPRequestOperationManager manager];
//    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
//    NSLog(@"%@",account.auth_token);
//    if (!account) {
//        return;
//    }
//    [manage DELETE:[NSString stringWithFormat:@"%@/api/users/sign_out.json?auth_token=%@&current_version=%@",TCInterFaceNet,account.auth_token,[TCToolBaseClass getCurrentVersion]] parameters:@{@"auth_token":account.auth_token} success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        // 登出成功处理
//        [TCAccountManager signOutEven];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (operation.response.statusCode == 401) {
//            // 401 <没有权限>, 登出失败情况的处理
//            [TCAccountManager signOutEven];
//        }
//        
//    }];
    
}
+(BOOL)saveUserWithAccount:(Account *)account{
    // 沙盒路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:DOUCUMENT_ACCOUNT_ARCHIVE];
    // 将返回的账号字典数据 --> 模型，存进沙盒
    return [NSKeyedArchiver archiveRootObject:account toFile:path];
}

// 登出成功操作
+ (BOOL)signOutEven{
    [[NSUserDefaults standardUserDefaults] setObject:@(NO) forKey:@"login"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:DOUCUMENT_ACCOUNT_ARCHIVE];
    NSString *pathImage = [doc stringByAppendingPathComponent:@"head.png"];
    NSString * pathPhone = [doc stringByAppendingPathComponent:@"phoneAndToken.archive"];
    NSFileManager* fileManager=[NSFileManager defaultManager];
    
    BOOL blDeleImage=[[NSFileManager defaultManager] fileExistsAtPath:pathImage];
    if (!blDeleImage) {
        NSLog(@"blDele Imageno  have");
    }else {
        NSLog(@"blDele Image have");
        BOOL blDele= [fileManager removeItemAtPath:pathImage error:nil];
        if (blDele) {
            NSLog(@"blDeleImage dele success");
        }else {
            NSLog(@"blDeleImage dele fail");
        }
    }
    
    BOOL blHave=[[NSFileManager defaultManager] fileExistsAtPath:path];
    if (!blHave) {
        NSLog(@"blHave no  have");
    }else {
        NSLog(@"blHave have");
        BOOL blDele= [fileManager removeItemAtPath:path error:nil];
        if (blDele) {
            
            NSLog(@"blHave dele success");
        }else {
            NSLog(@"blHave dele fail");
        }
    }
    
    BOOL blDelePhone=[[NSFileManager defaultManager] fileExistsAtPath:pathImage];
    if (!blDelePhone) {
        NSLog(@"blDelePhone no  have");
    }else {
        NSLog(@"blDelePhone have");
        BOOL blDele= [fileManager removeItemAtPath:pathPhone error:nil];
        if (blDele) {
            NSLog(@"blDelePhone dele success");
        }else {
            NSLog(@"blDelePhone dele fail");
        }
    }
   // TCPOST_NOTIFICATION_NAMED_OBJECT(TCNOTIFICATION_DID_LOGOUT_SUCCEED, nil);
    return [self clearCache];
}

+ (BOOL)clearCache:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            BOOL result = [fileManager removeItemAtPath:absolutePath error:nil];
            if (!result) return NO;
        }
    }
    [[SDImageCache sharedImageCache]clearDiskOnCompletion:nil];
    return YES;
}

+ (BOOL)clearCache {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            BOOL result = [fileManager removeItemAtPath:absolutePath error:nil];
            if (!result) return NO;
        }
    }
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    return YES;
}


+ (void)setAccountHasNews:(BOOL)hasNews{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSDictionary *accountNewsList = [df objectForKey:kAccountNewsStatusList];
    NSMutableDictionary *accountNews;
    
    if (accountNewsList) {
        accountNews = [NSMutableDictionary dictionaryWithDictionary:accountNewsList];
    }
    else {
        accountNews = [NSMutableDictionary dictionary];
    }
    
    Account *account = [self getUser];
    if (account == nil) return;
    
    [accountNews setObject:@(hasNews) forKey:account.ID];
    [df setObject:accountNews forKey:kAccountNewsStatusList];
    [df synchronize];
}

+ (BOOL)getAccountHasNews
{
    if ([self getUser] == nil) return NO;
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kAccountNewsStatusList] == nil) return NO;
    return [[[[NSUserDefaults standardUserDefaults] objectForKey:kAccountNewsStatusList] objectForKey:[self getUser].ID] boolValue];
}

+ (BOOL)saveRegistrationID:(NSString *)registrationID
{
    [[NSUserDefaults standardUserDefaults] setObject:registrationID forKey:TCJpushRegistrationID];
    return [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getRegistrationID
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:TCJpushRegistrationID];
}

//+ (void)saveUserLastLocation:(CLLocation *)location
//{
//    // 沙盒路径
//    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSString *path = [doc stringByAppendingPathComponent:DOUCUMENT_LOCATION_ARCHIVE];
//    
//    [NSKeyedArchiver archiveRootObject:location toFile:path];
//}

//+ (CLLocation *)getUserLastLocation{
//    CLLocation *location;
//    
//    // 沙盒路径
//    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    
//    // 开始的经纬度
//    NSString *locationPath = [doc stringByAppendingPathComponent:DOUCUMENT_LOCATION_ARCHIVE];
//    
//    // 从沙盒里取出来
//    location = [NSKeyedUnarchiver unarchiveObjectWithFile:locationPath];
//    
//    // 默认值 <上海人民广场>
//    if (!location) {
//        CLLocation *defaultLocation = [[CLLocation alloc] initWithLatitude:31.230416 longitude:121.473701];
//        location = defaultLocation;
//    }
//    return location;
//}

//+ (NSDictionary *)getUserLocationGeocode
//{
//    return [[NSUserDefaults standardUserDefaults] objectForKey:TCCurrentUserLocationDetailAddress];
//}
//
//+ (void)saveUserSerarchHistory:(TCSearchModle *)searchModle
//{
//    // 沙盒路径
//    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSString *path = [doc stringByAppendingPathComponent:USER_SEARCH_SVAE_KEY];
//    
//    NSMutableArray *historyArray = [self getUserSerarchHistory];
//    
//    if (!historyArray ) {
//        historyArray = [[NSMutableArray alloc] init];
//    }
//    for (TCSearchModle *object in historyArray) {
//        if ([object.name isEqualToString:searchModle.name] && ([object.district isEqualToString:searchModle.district] || (object.district == nil && searchModle.district == nil))) {
//            [historyArray removeObject:object];
//            break;
//        }
//    }
//    [historyArray insertObject:searchModle atIndex:0];
//    
//    if (historyArray.count > 10) {
//        [historyArray removeLastObject];
//    }
//    [NSKeyedArchiver archiveRootObject:historyArray toFile:path];
//}
//
//+ (NSMutableArray *)getUserSerarchHistory{
//    // 沙盒路径
//    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    
//    NSString *path = [doc stringByAppendingPathComponent:USER_SEARCH_SVAE_KEY];
//    
//    // 从沙盒里取出来
//    NSMutableArray *historyArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
//    
//    return historyArray;
//}

//+ (void)clearUserSearchHistory
//{
//    NSFileManager* fileManager=[NSFileManager defaultManager];
//    
//    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    
//    NSString *uniquePath = [doc stringByAppendingPathComponent:USER_SEARCH_SVAE_KEY];
//    
//    BOOL blHave=[[NSFileManager defaultManager] fileExistsAtPath:uniquePath];
//    if (!blHave) {
//        NSLog(@"no  have");
//        return ;
//    }else {
//        NSLog(@" have");
//        BOOL blDele= [fileManager removeItemAtPath:uniquePath error:nil];
//        if (blDele) {
//            NSLog(@"dele success");
//        }else {
//            NSLog(@"dele fail");
//        }
//    }
//}


//+ (void)reSetCarVerifyStatue
//{
//    Account *account = [self getUser];
//    if ([account.car.state isEqualToString:@"认证成功"] || [account.car.state isEqualToString:@"已通过"]) {
//        account.car.state = @"已认证";
//        [self setComeFromCarInfo:account.car.state];
//    }
//    if ([account.car.state isEqualToString:@"认证失败"]) {
//        account.car.state = @"去认证";
//        [self setComeFromCarInfo:account.car.state];
//    }
//    [TCAccountManager saveUserWithAccount:account];
//
//}


+(BOOL )setLoginPhoneNumber:(NSString *)phoneNumber{
    [[NSUserDefaults standardUserDefaults] setObject:phoneNumber forKey:kCurrLoginPhoneNumberDefaults];
    return [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)getLoginPhoneNumber{
    return  [[NSUserDefaults standardUserDefaults] objectForKey:kCurrLoginPhoneNumberDefaults];
}

+(void)removeLoginPhoneNumber{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:kCurrLoginPhoneNumberDefaults];
}


@end

