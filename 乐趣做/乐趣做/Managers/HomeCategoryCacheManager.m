//
//  HomeCategoryCacheManager.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "HomeCategoryCacheManager.h"

#define kDOUCUMENT_CACHE_FITNESS_HOST_KEY @"Cache_Fitness_Host_Key"

@implementation HomeCategoryCacheManager

+ (BOOL)saveFitnessHostOriginalData:(id)orgData catalog:(HomeCatalog)catalogType{
    if (orgData == nil) return NO;
    /**得到大字典Data，里面是首页所有的数据*/
    NSData *dataDefault = [[NSUserDefaults standardUserDefaults] dataForKey:kDOUCUMENT_CACHE_FITNESS_HOST_KEY];
    NSMutableDictionary * dicDefault = [NSKeyedUnarchiver unarchiveObjectWithData:dataDefault];
    if (dicDefault == nil) {
        dicDefault = [NSMutableDictionary dictionary];
    }
    /**将传进来的数据转换为data*/
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:orgData];
    /**将data数据存入字典*/
    [dicDefault setObject:data forKey:@(catalogType)];
    /**将字典转为data*/
    NSData * temData = [NSKeyedArchiver archivedDataWithRootObject:dicDefault];
    [[NSUserDefaults standardUserDefaults] setObject:temData forKey:kDOUCUMENT_CACHE_FITNESS_HOST_KEY];
    return [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)fetchFitnessHostOriginalDataWithCatalog:(HomeCatalog)catalogType{
    /**得到大字典Data，里面是首页所有的数据*/
    NSData *dataDefault = [[NSUserDefaults standardUserDefaults] dataForKey:kDOUCUMENT_CACHE_FITNESS_HOST_KEY];
    NSMutableDictionary * dicDefault = [NSKeyedUnarchiver unarchiveObjectWithData:dataDefault];
    /**取出对应的数据*/
    NSData * data = [dicDefault objectForKey:@(catalogType)];
    id info = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return info;
}


@end
