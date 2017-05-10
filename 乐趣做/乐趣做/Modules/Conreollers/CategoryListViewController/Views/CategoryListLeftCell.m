//
//  CategoryListLeftCell.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "CategoryListLeftCell.h"

@interface CategoryListLeftCell ()
/***/
@property (nonatomic, strong) UILabel * categoryNameLabel;

@end

@implementation CategoryListLeftCell

-(void)loadWithComponents{
    [self addCategoryNameLabel];
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    self.categoryNameLabel.textColor = selected ? Color(51, 51, 51) : Color(182,182, 182);
//    self.contentView.backgroundColor = selected ? [UIColor whiteColor] : Color(237, 237, 237);
//}

-(void)addCategoryNameLabel{
    if (!self.categoryNameLabel) {
        self.categoryNameLabel = [[UILabel alloc]init];
        self.categoryNameLabel.font = FontSize14;
        self.categoryNameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.categoryNameLabel];
        [self.categoryNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
}

-(void)setModel:(HomeCategoryModel *)model{
    _model = model;
    self.categoryNameLabel.text = model.name;
    self.categoryNameLabel.textColor = model.isSelectd ? Color(51, 51, 51) : Color(182,182, 182);
    self.contentView.backgroundColor = model.isSelectd ? [UIColor whiteColor] : Color(237, 237, 237);
}


@end
