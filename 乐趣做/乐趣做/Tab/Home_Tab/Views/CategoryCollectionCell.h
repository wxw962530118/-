//
//  CategoryCollectionCell.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCategoryModel.h"
#import "CategoryBrandModel.h"
@interface CategoryCollectionCell : UICollectionViewCell

@property (nonatomic, strong) HomeCategoryModel * model;

@property (nonatomic, strong) CategoryBrandModel * brandModel;

@end
