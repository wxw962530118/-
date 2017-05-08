//
//  HomeHotSubjectCell.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "HomeHotSubjectCell.h"
#import "HomeSpecialModel.h"
@interface HomeHotSubjectCell ()

@property (nonatomic, strong) UIImageView * bigimageView;

@end

@implementation HomeHotSubjectCell

-(void)loadWithComponents{
    [self addBigimageView];
}

-(void)addBigimageView{
    if (!self.bigimageView) {
        self.bigimageView = [[UIImageView alloc]init];
        self.bigimageView.contentMode = UIViewContentModeScaleToFill;
        self.bigimageView.clipsToBounds = YES;
        [self.contentView addSubview:self.bigimageView];
        [self.bigimageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
}

-(void)setDataWithModel:(HomeSpecialModel *)model{
    [self.bigimageView sd_setImageWithURL:[NSURL URLWithString:model.banner]];
}

@end
