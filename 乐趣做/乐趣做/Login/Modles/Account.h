//
//  Account.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BaseModel.h"
#import "Avatar.h"
@interface Account : BaseModel
/** id */
@property (nonatomic, copy) NSString * ID;

/** string 用户昵称*/
@property (nonatomic,copy) NSString * nick_name;

/** string 用户auth_token*/
@property (nonatomic,copy) NSString * auth_token;

/** string 三方登录时的用户唯一标识 */
@property (nonatomic, copy) NSString * login_name;

/** object 存放用户头像url*/
@property (nonatomic,strong) Avatar *avatar;

/**
 *  是否是三方登录 (YES/NO)
 */
@property (nonatomic, copy) NSString *from_thirdparty;

/**
 *  微信登录的openid
 */
@property (nonatomic, copy) NSString *open_id;

/**
 *  微信用户的头像
 */
@property (nonatomic, copy) NSString *headimgurl;

/**
 *  QQ登录的授权码
 */
@property (nonatomic, copy) NSString *accessToken;


@end
