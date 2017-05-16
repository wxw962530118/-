//
//  BottomCollectionView.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCategoryModel.h"
//分类横条下面的放在 HoruzontalCollectionView 上的 collectionView
@interface BottomCollectionView : UICollectionView

@property (nonatomic, weak) UIViewController *superVC;

@property (nonatomic, strong) HomeCategoryModel *category;

+(instancetype)getClassCollectionViewWithCategory;

-(void)scrollToTopAndCleanData;

@end
