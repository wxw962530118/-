//
//  CategoryListModel.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BaseModel.h"
#import "CategoryFirstModel.h"
#import "CategoryRecommendModel.h"
#import "CategoryBrandModel.h"
@interface CategoryListModel : BaseModel

@property (nonatomic, strong) NSArray <CategoryFirstModel *> *first;

@property (nonatomic, strong) NSArray <CategoryRecommendModel *> *recommend;

@property (nonatomic, strong) NSArray <CategoryBrandModel *> *brand;

@end
