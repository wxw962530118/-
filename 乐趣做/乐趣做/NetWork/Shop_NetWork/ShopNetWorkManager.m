//
//  ShopNetWorkManager.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "ShopNetWorkManager.h"
//GET /v2/brands?categoryid=2&page=1&token=93f43779d2273d2eae5b2bdd627ecc86

#define  ShopCategorysUrl @"brands"

static ShopNetWorkManager * manager = nil;

@implementation ShopNetWorkManager

+(instancetype )shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}

-(NSURLSessionDataTask *)getShopCategoryDataWithCategoryid:(NSString *)categoryid offset:(NSInteger)offset limit:(NSInteger)limit success:(void (^)(id))success faile:(void (^)(NSURLSessionDataTask *, NSError *))faile{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"categoryid"] = categoryid;
    params[@"limit"] = @(limit);
    params[@"offset"] = @(offset);
    NSString * URLString = [NSString stringWithFormat:@"%@%@",InterFaceNet,ShopCategorysUrl];
    NSURLSessionDataTask * task = [[NetWorkManager shareInstance]GET:URLString parameters:params progress:0 success:^(id response) {
        success(response);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        faile(task,error);
    }];
    return task;
}



@end
