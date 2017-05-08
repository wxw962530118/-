//
//  HomeCategoryCell.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "HomeCategoryCell.h"
#import "CategoryCollectionView.h"
#import "HomeListModel.h"
@interface HomeCategoryCell ()
@property (nonatomic,assign) int itemPerRow;
@property (nonatomic, strong) CategoryCollectionView * categoryCollectionView;

@end

@implementation HomeCategoryCell

-(void)loadWithComponents{
    //初始化子控件
}

-(void)setCategoryArray:(NSArray *)categoryArray{
    _categoryArray = categoryArray;
    _itemPerRow =  (int )categoryArray.count / 4;
    if (categoryArray.count % 4 > 0) {
        _itemPerRow ++;
    }
    [self.categoryCollectionView removeFromSuperview];
    self.categoryCollectionView = [CategoryCollectionView getCategoryViewWithData:categoryArray withHeight:_itemPerRow * (96)];
    [self.contentView addSubview:self.categoryCollectionView];
}

+(CGFloat )getCellHeightWithModel:(HomeListModel *)model{
    int  row  = (int ) model.category.count / 4;
    if (model.category.count % 4 > 0) {
        row++;
    }
    return  row * (96);
}

@end
