//
//  HomeLoopViewCell.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "HomeLoopViewCell.h"
#import "AIELoopView.h"
#import "HomeADModel.h"
@interface HomeLoopViewCell ()
//广告轮播view
@property (nonatomic, strong)  AIELoopView   * adView;

@end

@implementation HomeLoopViewCell

-(void)setLoopArray:(NSArray *)loopArray{
    _loopArray = loopArray;
    if (!self.adView) {
        self.adView = [[AIELoopView alloc]initWithURLs:self.loopArray didSelected:^(NSInteger index) {
            NSLog(@"当前选中的Index--%ld",index);
        }];
        [self addSubview:self.adView];
        [self.adView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
}

@end
