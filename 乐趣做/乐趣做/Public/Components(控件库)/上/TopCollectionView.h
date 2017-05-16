//
//  TopCollectionView.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCategoryModel.h"
@interface TopCollectionView : UICollectionView
@property (nonatomic, strong) NSArray <HomeCategoryModel *>*categoryArray;//分类数据源
+(instancetype)getTopCategoryTagCollectionView;
@end
