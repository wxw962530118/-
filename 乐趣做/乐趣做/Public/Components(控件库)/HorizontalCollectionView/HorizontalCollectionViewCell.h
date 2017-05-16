//
//  HorizontalCollectionViewCell.h
//  iVideo
//
//  Created by 孙诚 on 16/4/25.
//  Copyright © 2016年 BrianLee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeCategoryModel;
@interface HorizontalCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) HomeCategoryModel *categoryModel;
@property (nonatomic, weak) UIViewController *superVC;

-(void)scrollToTopAndCleanData;

@end
