//
//  ShopNetWorkManager.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "NetWorkManager.h"

@interface ShopNetWorkManager : NetWorkManager

+(instancetype)shareManager;

/**获取商家分类数据*/
-(NSURLSessionDataTask *)getShopCategoryDataWithCategoryid:(NSString *)categoryid  offset:(NSInteger)offset
                                                    limit:(NSInteger)limit  success:(void (^)(id respons))success faile:(void (^)(NSURLSessionDataTask * task,NSError * error))faile;

@end
