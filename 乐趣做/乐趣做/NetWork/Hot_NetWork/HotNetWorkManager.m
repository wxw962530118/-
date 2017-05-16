//
//  HotNetWorkManager.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "HotNetWorkManager.h"
//GET /v2/videos?categoryid=3&hot=1&page=1 
#define  HotCategorysUrl @"videos"
static HotNetWorkManager * manager = nil;
@implementation HotNetWorkManager

+(instancetype )shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}

-(NSURLSessionDataTask *)getHotCategoryDataWithCategoryid:(NSString *)categoryid hot:(NSString *)hot offset:(NSInteger)offset limit:(NSInteger)limit success:(void (^)(id))success faile:(void (^)(NSURLSessionDataTask *, NSError *))faile{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"categoryid"] = categoryid;
    params[@"hot"] = hot;
    params[@"limit"] = @(limit);
    params[@"offset"] = @(offset);
    NSString * URLString = [NSString stringWithFormat:@"%@%@",InterFaceNet,HotCategorysUrl];
    NSURLSessionDataTask * task = [[NetWorkManager shareInstance]GET:URLString parameters:params progress:0 success:^(id response) {
        success(response);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        faile(task,error);
    }];
    return task;
}

@end
