//
//  HomeCategoryModel.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BaseModel.h"
///  主页分类模型
@interface HomeCategoryModel : BaseModel
@property (nonatomic, copy) NSString * ID;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * icon;
//+(NSMutableArray <HomeCategoryModel *> *)sharedCategorys;
@end
