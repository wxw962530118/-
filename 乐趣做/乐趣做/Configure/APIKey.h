//
//  APIKey.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#ifndef APIKey_h
#define APIKey_h


static NSString *const APIKeyGaoDe          = @"baf08380f68a0dfdcab0d2e98857eb97";

static NSString *const APIKeyBugTags        = @"9581e1a70c5f00cb8070892fa3b19243";

static NSString *const APIKeyUMeng          = @"565fcd9ee0f55a32e90029fe";

static NSString *const APIKeyWeiXin         = @"wx2589f7e186625742";

static NSString *const APIKeyWeiXinSecret   = @"d4624c36b6795d1d99dcf0547af5443d";

static NSString *const APIKeyQQAppID        = @"1105683934";

static NSString *const APIKeyQQ             = @"8idICefFTFTIHFMG";

static NSString *const APIKeyiFly           = @"56e7c954";
/** 后台访问的秘钥 每次版本更新都要替换 */
static NSString *const VerifyCoded          = @"df899f1188f9b22c811c65a06231355b";


#ifdef DEBUG // 开发阶段

static BOOL isDebug = YES;

static BOOL isRelease = NO;

static NSString *const APIKeyUmengCount     = @"565fcd9ee0f55a32e90029fe";

static NSString *const APIKeyJpush          = @"f41e113c7d7e68b8e920ba38";

static NSString *const APIKeyTalkingData    = @"24D8B746A1BF45FAB33E977103BB5799";

#else       // 发布阶段

static BOOL isDebug = NO;

static BOOL isRelease = YES;

static NSString *const APIKeyUmengCount     = @"56b08ff4e0f55abb60001b63";

static NSString *const APIKeyJpush          = @"997e7ec9e73042d96f76f48f";

static NSString *const APIKeyTalkingData    = @"06FE6AFB6821466592B01EE021D8A332";

#endif


#endif /* APIKey_h */
