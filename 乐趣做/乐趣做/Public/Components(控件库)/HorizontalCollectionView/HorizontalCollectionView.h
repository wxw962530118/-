//
//  HorizontalColleectionView.h
//  iVideo
//
//  Created by 孙诚 on 16/4/25.
//  Copyright © 2016年 BrianLee. All rights reserved.
//

#import <UIKit/UIKit.h>
  //纵向的collectionView
#import "HomeCategoryModel.h"
@interface HorizontalCollectionView : UICollectionView
@property (nonatomic, strong) NSArray <HomeCategoryModel *>*categoryArray;//分类数据源
@property (nonatomic, weak) UIViewController *superVC;

+(instancetype)getHorizontalCollectionView;

@end
