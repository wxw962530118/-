//
//  HotNetWorkManager.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "NetWorkManager.h"

@interface HotNetWorkManager : NetWorkManager

+(instancetype)shareManager;

/**获取热门分类数据*/
-(NSURLSessionDataTask *)getHotCategoryDataWithCategoryid:(NSString *)categoryid hot:(NSString *)hot offset:(NSInteger)offset
                                                    limit:(NSInteger)limit  success:(void (^)(id respons))success faile:(void (^)(NSURLSessionDataTask * task,NSError * error))faile;

@end
