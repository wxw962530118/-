//
//  HorizontalCollectionViewCell.m
//  iVideo
//
//  Created by 孙诚 on 16/4/25.
//  Copyright © 2016年 BrianLee. All rights reserved.
//

#import "HorizontalCollectionViewCell.h"
#import "BottomCollectionView.h"
@interface HorizontalCollectionViewCell()
@property (nonatomic, weak) BottomCollectionView *collection;

@end

@implementation HorizontalCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //初始化 classCollectionView
        BottomCollectionView *collection = [BottomCollectionView getClassCollectionViewWithCategory];
        [self.contentView addSubview:collection];
        self.collection = collection;
        [collection mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

-(void)setCategoryModel:(HomeCategoryModel *)categoryModel{
    _categoryModel = categoryModel;
    self.collection.category = categoryModel;
}

-(void)scrollToTopAndCleanData{
    [self.collection scrollToTopAndCleanData];
}

-(void)setSuperVC:(UIViewController *)superVC{
    _superVC = superVC;
    self.collection.superVC = superVC;
}

@end
