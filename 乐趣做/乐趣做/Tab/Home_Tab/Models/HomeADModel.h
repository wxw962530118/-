//
//  HomeADModel.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BaseModel.h"
///  主页广告(轮播器数据源模型)
@interface HomeADModel : BaseModel
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *url;

@end
