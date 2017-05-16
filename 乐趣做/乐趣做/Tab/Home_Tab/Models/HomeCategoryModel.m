//
//  HomeCategoryModel.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "HomeCategoryModel.h"

@implementation HomeCategoryModel

//-(NSDictionary *)mj_replacedKeyFromPropertyName{
//    return @{@"id" : @"ID",@"Description" : @"description"};
//}
/*

 */
/**
 *  当一个对象要归档进沙盒中时，就会调用这个方法
 *  目的：在这个方法中说明这个对象的哪些属性要存进沙盒
 */

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.ID forKey:@"ID"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.icon forKey:@"icon"];
    [encoder encodeObject:@(self.isSelectd) forKey:@"isSelectd"];
}


/**
 *  当从沙盒中解档一个对象时（从沙盒中加载一个对象时），就会调用这个方法（在other文件夹中HWAppDelegate.m中解档中调用）
 *  目的：在这个方法中说明沙盒中的属性该怎么解析（需要取出哪些属性）
 */
- (instancetype)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        self.name = [decoder decodeObjectForKey:@"name"];
        self.ID = [decoder decodeObjectForKey:@"ID"];
        self.icon = [decoder decodeObjectForKey:@"icon"];
        self.isSelectd = [decoder decodeObjectForKey:@"isSelectd"];
    }
    return self;
}


@end
