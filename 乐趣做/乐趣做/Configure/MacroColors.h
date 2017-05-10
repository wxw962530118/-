//
//  MacroColors.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#ifndef MacroColors_h
#define MacroColors_h


/** App 主色调         [深色] */
#define ColorMain      Color(37, 42,73)

/** App 次色调         [绿色] */
#define ColorSubMain    Color(75, 174, 79)

/** App 辅助色/警告色   [红色] */
#define ColorAssist     Color(243, 66, 53)

/** App 状态文字/警示色  [橙色] */
#define ColorWarning    Color(254,151,0)

/** App 重点文字色      [黑色] */
#define ColorEmphasis   Color(51, 51, 51)

/** App 正文色         [大灰] */
#define ColorMainBody     Color(114, 114, 114)

/** App 二级文字色      [中灰] */
#define ColorSubBody      Color(181, 181, 181)

/** App 分割线颜色      [描边灰] */
#define ColorSeparator    Color(223, 223, 223)

/** App 页面背景色      [淡灰] */
#define ColorBackGround   Color(238, 238, 238)

/** App 页面白色背景     [白色] */
#define ColorWhiteGround  Color(255, 255, 255)

/** App 图层边框色      [浅灰] */
#define ColorLayerBorder  Color(190, 190, 190)

/** App 控件描边灰色     [淡灰] */
#define ColorComponentBorder  Color(216, 216, 216)

/** App Cell选中色      [淡灰] */
#define ColorSelector     Color(250, 250, 250)

/** App 白色块的点击效果      [轻灰] */
#define WhriteClickColor     Color(240, 240, 240)

/** App 灰色333333      [灰] */
#define ColorGaryColor     Color(33, 33, 33)

/** App 透明色 */
#define ColorClear        [UIColor clearColor]

// 获取验证码的背景 RGB颜色
#define ColorButton  [UIColor colorWithRed:255/255.0 green:157/255.0 blue:0/255.0 alpha:1.0]

// 获取验证码的背景点击后的RGB颜色
#define ColorButtonClick  [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0]

// RGB颜色
#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ColorAlpha(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

// 随机色
#define RandomColor HWColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//cell的标识符
#define kCellIdentifier  NSStringFromClass(self)

#endif /* MacroColors_h */
