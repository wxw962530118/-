//
//  CategoryListViewController.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/9.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BaseViewController.h"
#import "HomeCategoryModel.h"
@interface CategoryListViewController : BaseViewController
/**默认选中*/
@property (nonatomic, assign) NSInteger selectIndex;
/**分类ID*/
@property (nonatomic, strong) NSString * categoryid;
/**分类数组*/
@property (nonatomic, strong) NSArray <HomeCategoryModel *> * categoryArray;

@end
