//
//  TopCollectionViewCell.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "TopCollectionViewCell.h"

@interface TopCollectionViewCell ()

@property (nonatomic, strong) UILabel *categoryNameLabel;

@end

@implementation TopCollectionViewCell

//热门控制器 上面 的分类label
-(UILabel *)categoryNameLabel{
    if (_categoryNameLabel == nil) {
        _categoryNameLabel  = [[UILabel alloc]init];
        _categoryNameLabel.font = FontSize14;
        [self.contentView addSubview:_categoryNameLabel];
        [_categoryNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
        }];
    }
    return _categoryNameLabel;
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    NSLog(@"self.isSelected--%d",self.isSelected);
}

-(void)setCategoryModel:(HomeCategoryModel *)categoryModel{
    _categoryModel = categoryModel;
    categoryModel.isSelectd ? ( self.categoryNameLabel.textColor = ColorMain) : (self.categoryNameLabel.textColor = ColorSubBody);
    self.categoryNameLabel.text = categoryModel.name;
}

@end
