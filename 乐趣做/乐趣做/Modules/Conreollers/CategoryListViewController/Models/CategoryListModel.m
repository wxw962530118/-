//
//  CategoryListModel.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "CategoryListModel.h"

@implementation CategoryListModel
+(NSDictionary *)mj_objectClassInArray{
    return @{@"first" : [CategoryFirstModel class],
             @"recommend" : [CategoryRecommendModel class],
             @"brand" : [CategoryBrandModel class] };
}
@end
