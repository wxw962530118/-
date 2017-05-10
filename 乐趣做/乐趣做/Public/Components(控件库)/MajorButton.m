//
//  MajorButton.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "MajorButton.h"

@interface MajorButton ()
{
    UIColor *_normalBackgroundColor;
    UIColor *_highlightBackgroundColor;
    UIColor *_invalidBackgroundColor;
    UIColor *_fontNormalColor;
    UIColor *_fontInvalidColor;
    UIFont  *_font;
}

@end

@implementation MajorButton


- (void)initParameter{
    _normalBackgroundColor = ColorMain;
    _highlightBackgroundColor = Color(229, 180, 0);
    _invalidBackgroundColor = Color(181, 181, 181);
    _fontNormalColor = ColorEmphasis;
    _fontInvalidColor = ColorEmphasis;
    _font = FontSize17;
    _isInvalid = NO;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initParameter];
        [self configItems];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initParameter];
        [self configItems];
    }
    return self;
}

- (void)configItems{
    self.titleLabel.font = _font;
    [self setTitleColor:_fontNormalColor forState:UIControlStateNormal];
    [self setBackgroundImage:[ToolBaseClass imageWithColor:_normalBackgroundColor] forState:UIControlStateNormal];
    [self setBackgroundImage:[ToolBaseClass imageWithColor:_highlightBackgroundColor] forState:UIControlStateHighlighted];
}

- (void)setIsInvalid:(BOOL)isInvalid{
    _isInvalid = isInvalid;
    if (isInvalid) {
        self.userInteractionEnabled = NO;
        [self setTitleColor:_fontInvalidColor forState:UIControlStateNormal];
        [self setBackgroundImage:[ToolBaseClass imageWithColor:_invalidBackgroundColor] forState:UIControlStateNormal];
    }else {
        self.userInteractionEnabled = YES;
        [self setTitleColor:_fontNormalColor forState:UIControlStateNormal];
        [self setBackgroundImage:[ToolBaseClass imageWithColor:_normalBackgroundColor] forState:UIControlStateNormal];
    }
}


@end
