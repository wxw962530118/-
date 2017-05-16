//
//  HomeNetWorkManager.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "HomeNetWorkManager.h"

#define  HomeCategorysUrl @"sites"

#define  CategorysListUrl @"categroys"

@implementation HomeNetWorkManager
+(instancetype)shareManager{
    static HomeNetWorkManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}


-(NSURLSessionDataTask *)getHomeCategoryDataWithSuccess:(void (^)(id))success faile:(void (^)(NSURLSessionDataTask *, NSError *))faile{
    NSString * URLString = [NSString stringWithFormat:@"%@%@",InterFaceNet,HomeCategorysUrl];
    NSURLSessionDataTask * task = [[NetWorkManager shareInstance]GET:URLString parameters:nil progress:0 success:^(id response) {
        success(response);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        faile(task,error);
    }];
    return  task;
}

-(NSURLSessionDataTask *)getCategorysListWithCategoryid:(NSString *)categoryid success:(void (^)(id))success faile:(void (^)(NSURLSessionDataTask *, NSError *))faile{
    NSString * URLString = [NSString stringWithFormat:@"%@%@",InterFaceNet,CategorysListUrl];
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setObject:categoryid forKey:@"categoryid"];
    NSURLSessionDataTask * task = [[NetWorkManager shareInstance]GET:URLString parameters:dic progress:0 success:^(id response) {
        success(response);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        faile(task,error);
    }];
    return  task;
}

@end
