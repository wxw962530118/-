//
//  CategoryCollectionCell.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "CategoryCollectionCell.h"

@interface CategoryCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *categoryImageView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLinelLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightLineLabelWidthConstraints;
@property (weak, nonatomic) IBOutlet UILabel *bottomLineLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineLabelHeightConstraints;


@end

@implementation CategoryCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bottomLineLabelHeightConstraints.constant = 1;
    self.rightLineLabelWidthConstraints.constant = 1;
}

-(void)setModel:(HomeCategoryModel *)model{
    _model = model;
    self.categoryLabel.text = model.name;
    [self.categoryImageView sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:nil];
}

@end
