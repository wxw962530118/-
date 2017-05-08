//
//  HomeNetWorkManager.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "NetWorkManager.h"

@interface HomeNetWorkManager : NetWorkManager

+(instancetype)manager;

/**获取首页分类数据*/
-(NSURLSessionDataTask *)getHomeCategoryDataWithSuccess:(void (^)(id respons))success faile:(void (^)(NSURLSessionDataTask * task,NSError * error))faile;

@end
