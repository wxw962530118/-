//
//  BottomCollectionViewCell.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BottomCollectionViewCell.h"

@interface BottomCollectionViewCell ()
/**标题*/
@property (nonatomic,strong) UILabel *titleLabel;
/**简介*/
@property (nonatomic, strong) UILabel * contentLabel;
/**左边的大图片*/
@property (nonatomic,strong) UIImageView *leftImageView;
/**视频播放时间*/
@property (nonatomic, strong) UILabel * videoTimeLabel;
/**视屏数量icon*/
@property (nonatomic, strong) UIImageView * videoCountImageView;
/**视频数量*/
@property (nonatomic, strong) UILabel * videoCountLabel;
/**播放量icon*/
@property (nonatomic, strong) UIImageView * playCountImageView;
/**播放图片*/
@property (nonatomic, strong) UIImageView * playCountLabel;

@end

@implementation BottomCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.leftImageView];
        [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.height.mas_equalTo(75);
            make.width.mas_equalTo(100);
        }];
        
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftImageView.mas_right).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.top.equalTo(self.contentView.mas_top).offset(15);
        }];



    }
    return self;
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel =[[UILabel alloc]init];
        _titleLabel.textColor = [UIColor orangeColor];
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = FontSize14;
    }
    return _titleLabel;
}

-(UIImageView *)leftImageView{
    if (_leftImageView == nil) {
        _leftImageView =  [[UIImageView alloc]init];
        _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
        _leftImageView.clipsToBounds = YES;
    }
    return _leftImageView;
}

-(UILabel *)contentLabel{
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textColor = ColorSubBody;
    }
    return _contentLabel;
}


-(void)setSuperVC:(UIViewController *)superVC{
    _superVC = superVC;
    if ([superVC isKindOfClass:NSClassFromString(@"ShopsViewController")]) {
        
    }else{
       
    }
}

-(void)setHotListModel:(HotListModel *)hotListModel{
    _hotListModel = hotListModel;
    self.titleLabel.text = hotListModel.title;
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:hotListModel.image] placeholderImage:[ToolBaseClass imageWithColor:ColorSubBody]];
    self.contentLabel.text = hotListModel.introduce;
}

-(void)setShopListModel:(ShopListModel *)shopListModel{
    _shopListModel = shopListModel;
    self.titleLabel.text = shopListModel.name;
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:shopListModel.logo] placeholderImage:[ToolBaseClass imageWithColor:ColorSubBody]];
    self.contentLabel.text = shopListModel.introduce;
}


@end
