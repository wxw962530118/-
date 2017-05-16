//
//  HotListModel.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BaseModel.h"

@interface HotListModel : BaseModel
@property (nonatomic, copy) NSString * ID;
/**标题*/
@property (nonatomic, copy) NSString *title;
/**PDF*/
@property (nonatomic, copy) NSString * pdf;
/**图片url*/
@property (nonatomic, copy) NSString *image;
/**时间*/
@property (nonatomic, copy) NSString *time;
/**简介*/
@property (nonatomic, copy) NSString *introduce;
/**播放量*/
@property (nonatomic, copy) NSString *playnum;
/**评论数*/
@property (nonatomic, copy) NSString *comment;
/**收藏数*/
@property (nonatomic, copy) NSString *collection;
/**视频ID*/
@property (nonatomic, copy) NSString *videoid;
/***/
@property (nonatomic, copy) NSString *tradeName;
/***/
@property (nonatomic, copy) NSString *brandName;
/**注释*/
@property (nonatomic, copy) NSString *issuer;
/**注释*/
@property (nonatomic, copy) NSString *isAgree;
/**注释*/
@property (nonatomic, copy) NSString *agreeNum;
/**是否为视频*/
@property (nonatomic, copy) NSString *is_video;
/**注释*/
@property (nonatomic, copy) NSString * hasContent;
/**当前是不是商家*/
@property (nonatomic, assign) BOOL isShopContent;
@end
