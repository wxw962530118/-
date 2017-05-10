//
//  ScreeAdaptation.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import <Foundation/Foundation.h>

// 屏幕的size
#define TCScreenSize [UIScreen mainScreen].bounds.size
//屏幕宽度
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

// 无需适应的高度
#define XWHeight(l)     [ScreeAdaptation changeStaticHeightNumberForRegular:l*2]
// 无需适应的宽度
#define XWWidth(w)      [ScreeAdaptation changeStaticWidthtNumberForRegular:w*2]
// 需要做适应的高度值
#define XWAdHeight(l)   [ScreeAdaptation changeStaticHeightNumberToFit:l*2]
// 需要做适应的宽度值
#define XWAdWidth(w)    [ScreeAdaptation changeStaticWidthtNumberToFit:w*2]
// 需要按文字适配同步的高度尺寸
#define XWFAHeight(l)   [ScreeAdaptation changeStaticWidthNumberForFontAdaptation:l*2]
// 需要按文字适配同步的宽度尺寸
#define XWFAWidth(w)    [ScreeAdaptation changeStaticHeightNumberForFontAdaptation:w*2]


@interface ScreeAdaptation : NSObject

/** 位置固定值
 *  不需要做适应的尺寸
 
 无需适应的高度值 */
+ (CGFloat)changeStaticHeightNumberForRegular:(CGFloat)number;
/** 无需适应的宽度值 */
+ (CGFloat)changeStaticWidthtNumberForRegular:(CGFloat)number;



/** 需要适应的位置值 (等比例适配)
 *  <根据不同机型宽高进行等比例缩放>
 
 高度适应 */
+ (CGFloat)changeStaticHeightNumberToFit:(CGFloat)number;
/** 宽度适应 */
+ (CGFloat)changeStaticWidthtNumberToFit:(CGFloat)number;
/** 文字适应
 *  规则在4/5/6 上不做适配, Plus方法1.5倍 */
+ (CGFloat)changeStaticFontNumberToFit:(CGFloat)fontPxSize;



/** 需要适应的位置值 （跟随文字适配规则）
 *  规则在4/5/6 上不做适配, Plus方法1.5倍
 *  高度尺寸也会跟随文字的适配规则变化
 
 高度适应 */
+ (CGFloat)changeStaticWidthNumberForFontAdaptation:(CGFloat)number;
/** 宽度适应 */
+ (CGFloat)changeStaticHeightNumberForFontAdaptation:(CGFloat)number;


@end

// 无需适应的高度值
CG_INLINE CGFloat Height(CGFloat height) {
    return [ScreeAdaptation changeStaticHeightNumberToFit:height*2];
};

// 无需适应的宽度值
CG_INLINE CGFloat Width(CGFloat width) {
    return [ScreeAdaptation changeStaticWidthtNumberToFit:width*2];
};

// 需要做适应的宽度值
CG_INLINE CGFloat AdHeight(CGFloat height){
    return [ScreeAdaptation changeStaticHeightNumberForRegular:height*2];
};

// 需要做适应的宽度值
CG_INLINE CGFloat AdWidth(CGFloat width) {
    return [ScreeAdaptation changeStaticWidthtNumberForRegular:width*2];
};
