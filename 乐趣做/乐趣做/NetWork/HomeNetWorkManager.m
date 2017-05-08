//
//  HomeNetWorkManager.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "HomeNetWorkManager.h"

#define  HomeCategorysUrl @"http://api.lequz.com/v2/sites"

@implementation HomeNetWorkManager
+(instancetype)manager{
    static HomeNetWorkManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}


-(NSURLSessionDataTask *)getHomeCategoryDataWithSuccess:(void (^)(id))success faile:(void (^)(NSURLSessionDataTask *, NSError *))faile{
    NSString * URLString = HomeCategorysUrl;
    NSURLSessionDataTask * task = [[NetWorkManager shareInstance]GET:URLString parameters:nil progress:0 success:^(id response) {
        success(response);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        faile(task,error);
    }];
    return  task;
}

@end
