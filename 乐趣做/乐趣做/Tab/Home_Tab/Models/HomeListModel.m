//
//  HomeListModel.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "HomeListModel.h"

@implementation HomeListModel

+(NSDictionary *)mj_objectClassInArray{
    return @{@"category" : [HomeCategoryModel class],
             @"ad" : [HomeADModel class],
             @"special" : [HomeSpecialModel class] };
}

@end
