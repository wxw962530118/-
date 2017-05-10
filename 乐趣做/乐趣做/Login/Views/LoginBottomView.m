//
//  LoginBottomView.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "LoginBottomView.h"

@interface LoginBottomView ()

@property (nonatomic,strong) UILabel     * libTtitleLabel;

@property (nonatomic,strong) UIButton    * weiChatLoginBtn;

@property (nonatomic,strong) UILabel     * weiChatLabel;

@property (nonatomic,strong) UIImageView * weiChatImageView;

@property (nonatomic,strong) UIButton    * qqLoginBtn;

@property (nonatomic,strong) UIImageView * qqImageView;

@property (nonatomic,strong) UILabel     * qqLabel;

@property (nonatomic,copy) void (^ btnType) (LoginBtnType type);

@end

@implementation LoginBottomView

-(instancetype)initWithFrame:(CGRect)frame{
    self =  [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    [self addSubview:self.libTtitleLabel];
    [self addSubview:self.weiChatLoginBtn];
    [self addSubview:self.qqLoginBtn];
    [self.qqLoginBtn addSubview:self.qqImageView];
    [self.qqLoginBtn addSubview:self.qqLabel];
    [self.weiChatLoginBtn addSubview:self.weiChatImageView];
    [self.weiChatLoginBtn addSubview:self.weiChatLabel];
    
    [self.libTtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top);
    }];
    
    [self.weiChatLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset((124));
        make.top.equalTo(self.libTtitleLabel.mas_bottom).offset(27);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(34);
    }];
    
    [self.qqLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset((-124));
        make.top.equalTo(self.libTtitleLabel.mas_bottom).offset(27);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(34);
    }];
    
    [self.weiChatImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.weiChatLoginBtn).with.insets(UIEdgeInsetsMake(0, 0,16, 0));
    }];
    
    [self.weiChatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.weiChatLoginBtn).with.insets(UIEdgeInsetsMake(32,0,0, 0));
        
    }];
    
    [self.qqImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.qqLoginBtn.mas_centerX);
        make.top.equalTo(self.qqLoginBtn.mas_top);
        make.height.mas_equalTo(29);
        make.width.mas_equalTo(24);
    }];
    
    [self.qqLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.qqLoginBtn.mas_centerX);
        make.top.equalTo(self.qqImageView.mas_bottom).offset(3);
    }];
}

-(UILabel *)libTtitleLabel{
    if (_libTtitleLabel == nil) {
        _libTtitleLabel = [[UILabel alloc]init];
        _libTtitleLabel.font = FontSize12;
        _libTtitleLabel.textColor = Color(114, 114, 114);
        _libTtitleLabel.text = @"- 第三方登录 -";
        _libTtitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _libTtitleLabel;
}

-(UIButton *)weiChatLoginBtn{
    if (_weiChatLoginBtn == nil) {
        _weiChatLoginBtn = [[UIButton alloc]init];
        [_weiChatLoginBtn addTarget:self action:@selector(weiChatLoginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _weiChatLoginBtn;
}

-(UILabel *)weiChatLabel{
    if (_weiChatLabel == nil) {
        _weiChatLabel = [[UILabel alloc]init];
        _weiChatLabel.text = @"微信";
        _weiChatLabel.textAlignment = NSTextAlignmentCenter;
        _weiChatLabel.font = FontSize12;
        _weiChatLabel.textColor = Color(114,114, 114);
    }
    return _weiChatLabel;
}

-(UIImageView *)weiChatImageView{
    if (_weiChatImageView == nil) {
        _weiChatImageView = [[UIImageView alloc]init];
        _weiChatImageView.image = [UIImage imageNamed:@"wechat_c"];
    }
    return _weiChatImageView;
}

-(UIButton *)qqLoginBtn{
    if (_qqLoginBtn == nil) {
        _qqLoginBtn = [[UIButton alloc]init];
        [_qqLoginBtn addTarget:self action:@selector(qqLoginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _qqLoginBtn;
}

-(UILabel *)qqLabel{
    if (_qqLabel == nil) {
        _qqLabel = [[UILabel alloc]init];
        _qqLabel.text = @"QQ";
        _qqLabel.textAlignment = NSTextAlignmentCenter;
        _qqLabel.font = FontSize12;
        _qqLabel.textColor = Color(114,114, 114);
    }
    return _qqLabel;
}

-(UIImageView *)qqImageView{
    if (_qqImageView == nil) {
        _qqImageView = [[UIImageView alloc]init];
        _qqImageView.image = [UIImage imageNamed:@"qq_c"];
    }
    return _qqImageView;
}

-(void)setLoginBtnClick:(loginBtnCallBack)type{
    self.btnType = type;
};

-(void)weiChatLoginBtnClick{
    self.btnType(LoginBtnType_WeiChat);
}

-(void)qqLoginBtnClick{
    self.btnType(LoginBtnType_QQ);
}


@end
