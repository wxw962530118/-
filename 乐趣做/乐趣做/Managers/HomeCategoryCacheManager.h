//
//  HomeCategoryCacheManager.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, HomeCatalog) {
    /**首页-分类数据文件夹*/
    HomeCategory_Catalog,
};

@interface HomeCategoryCacheManager : NSObject

/**     储存缓存数据
 *
 *  @param orgData : 储存的服务端返回的原始数据的 body字段
 *  @param catalogType : 存储数据类型
 *
 *  @return 是否存储成功
 */
+ (BOOL)saveFitnessHostOriginalData:(id)orgData catalog:(HomeCatalog)catalogType;

/**     读取缓存数据
 *
 *  获取上一次缓存的健身主页数据
 *  返回数据结构 与服务器接口 返回body中数据结构相同 ( array | dictionary )
 */
+ (id)fetchFitnessHostOriginalDataWithCatalog:(HomeCatalog)catalogType;


@end
