//
//  HomeNavView.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "HomeNavView.h"

#define baseTag 1000

@interface HomeNavView ()

@property (nonatomic, strong) UIImageView * bgImageView;

@property (nonatomic, strong) UIView * navButtonView;

@property (nonatomic, strong) NavViewCallBack  callBack;

@end

@implementation HomeNavView
+(instancetype)createNaViewWithCallBack:(NavViewCallBack)callBack{
    HomeNavView * navView = [[HomeNavView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    navView.callBack = callBack;
    return navView;
}

-(instancetype )initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化子控件
        [self addSubview:self.bgImageView];
        [self addSubview:self.navButtonView];
    }
    return self;
}

#pragma mark --- 懒加载子控件
-(UIImageView *)bgImageView{
    if (_bgImageView == nil) {
        _bgImageView = [[UIImageView alloc]init];
        _bgImageView.userInteractionEnabled = YES;
        _bgImageView.image = [ToolBaseClass imageWithColor:ColorMain];
        _bgImageView.frame = CGRectMake(0, 0, ScreenWidth ,100);
    }
    return _bgImageView;
}

-(UIView *)navButtonView{
    NSArray * imagesArray = @[@"扫一扫",@"搜索",@"观看历史"];
    CGFloat btnW = ScreenWidth / imagesArray.count;
    CGFloat btnH = 100;
    CGFloat btnY = 10;
    if (_navButtonView == nil) {
        _navButtonView = [[UIView alloc]init];
        _navButtonView.frame = self.bounds;
        for (int i = 0; i < imagesArray.count; i++) {
            UIButton * navButton = [[UIButton alloc]init];
            navButton.x = i * btnW;
            navButton.width = btnW;
            [navButton setImage:[UIImage imageNamed:imagesArray[i]] forState:UIControlStateNormal];
            navButton.y = btnY;
            navButton.height = btnH;
            navButton.tag = baseTag + i;
            [navButton addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            [_navButtonView addSubview:navButton];
        }
    }
    return _navButtonView;
}


-(void)clickBtn:(UIButton *)sender{
    NSInteger btnTag = sender.tag - baseTag;
    switch (btnTag) {
        case 0:
            self.callBack(NavViewButtonType_Scan);
            break;
        case 1:
            self.callBack(NavViewButtonType_Search);
            break;
        case 2:
            self.callBack(NavViewButtonType_History);
            break;
    }
}

@end
