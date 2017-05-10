//
//  HomeListModel.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BaseModel.h"
#import "HomeCategoryModel.h"
#import "HomeADModel.h"
#import "HomeSpecialModel.h"
@interface HomeListModel : BaseModel
@property (nonatomic, strong) NSArray <HomeCategoryModel *> *category;
@property (nonatomic, strong) NSArray <HomeADModel *> *ad;
@property (nonatomic, strong) NSArray <HomeSpecialModel *> *special;
@end
