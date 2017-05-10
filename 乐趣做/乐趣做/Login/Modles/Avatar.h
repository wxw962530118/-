//
//  Avatar.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BaseModel.h"

@interface Avatar : BaseModel
/** string 头像的url*/
@property (nonatomic,copy) NSString *small_url;

@property (nonatomic,copy) NSString *large_url;

@property (nonatomic, copy) NSString *org_url;
@end
