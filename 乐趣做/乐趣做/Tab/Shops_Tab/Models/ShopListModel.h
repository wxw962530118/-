//
//  ShopListModel.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BaseModel.h"

@interface ShopListModel : BaseModel
/***/
@property (nonatomic, copy) NSString * ID;
/**简介*/
@property (nonatomic, copy) NSString * introduce;
/***/
@property (nonatomic, copy) NSString * isSubscribe;
/**logo*/
@property (nonatomic, copy) NSString * logo;
/**标题*/
@property (nonatomic, copy) NSString * name;
/**视频数量*/
@property (nonatomic, copy) NSString * videonum;
/**当前是不是商家*/
@property (nonatomic, assign) BOOL isShopContent;
@end
