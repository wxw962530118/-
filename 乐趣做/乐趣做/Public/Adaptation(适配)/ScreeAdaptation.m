//
//  ScreeAdaptation.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "ScreeAdaptation.h"
/* 对Plus机型字体的适配放大系数 */
#define kFontSizeForPlusRatio 1.f


@implementation ScreeAdaptation


/* 固定尺寸-高度 */
+ (CGFloat)changeStaticHeightNumberForRegular:(CGFloat)number
{
    return number/2;
}

/* 固定尺寸-宽度 */
+ (CGFloat)changeStaticWidthtNumberForRegular:(CGFloat)number
{
    return number/2;
}


/* 等比例-高度 */
+ (CGFloat)changeStaticHeightNumberToFit:(CGFloat)number{
    return ScreenHeight * (number/1334);
}

/* 等比例-宽度 */
+ (CGFloat)changeStaticWidthtNumberToFit:(CGFloat)number{
    return ScreenWidth * (number/750);
}

/* 文字适配 */
+ (CGFloat)changeStaticFontNumberToFit:(CGFloat)fontPxSize{
    //    if (_iPhone6P_) {
    //        return fontPxSize/2 *kFontSizeForPlusRatio;
    //    }

    return fontPxSize/2;
}


/* 跟随文字适配 的高度适配 */
+ (CGFloat)changeStaticWidthNumberForFontAdaptation:(CGFloat)number{
    //    if (_iPhone6P_) {
    //        return number/2 *kFontSizeForPlusRatio;
    //    }
    return number/2;
}

/* 跟随文字适配 的宽度适配 */
+ (CGFloat)changeStaticHeightNumberForFontAdaptation:(CGFloat)number{
    //    if (_iPhone6P_) {
    //        return number/2 *kFontSizeForPlusRatio;
    //    }
    return number/2;
}

@end
