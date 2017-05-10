//
//  MacroFontSize.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#ifndef MacroFontSize_h
#define MacroFontSize_h

// 黑体字号
#define TCFontBold(x)       [UIFont boldSystemFontOfSize:[TCScreeAdaptation changeStaticFontNumberToFit:x*2]]
// 苹方字体
#define TCFontSystem(x)     [UIFont systemFontOfSize:[TCScreeAdaptation changeStaticFontNumberToFit:x*2]]
// 晶体管字体
#define TCFontLED(x)        [UIFont fontWithName:@"UniDreamLED" size:[TCScreeAdaptation changeStaticFontNumberToFit:x*2]]

/** 3.0.0 later */

/** 苹方40px*/
#define TCFontSizeSys40 TCFontSystem(40)

/** 苹方54px */
#define TCFontSizeSys27 TCFontSystem(27)

#define TCFontSizeSys28 TCFontSystem(28)


/** 苹方48px */
#define TCFontSizeSys24 TCFontSystem(24)

/** 苹方50px */
#define TCFontSizeSys25 TCFontSystem(25)

/** 苹方38px  重要文字  */
#define TCFontSizeSys19 TCFontSystem(19)

/** 苹方34px */
#define TCFontSizeSys17 TCFontSystem(17)

/** 苹方32px */
#define TCFontSizeSys16 TCFontSystem(16)

/** 苹方30px */
#define TCFontSizeSys15 TCFontSystem(15)

/** 苹方28px */
#define TCFontSizeSys14 TCFontSystem(14)

/** 苹方26px */
#define TCFontSizeSys13 TCFontSystem(13)

/** 苹方36px */
#define TCFontSizeSys18 TCFontSystem(18)

/** 苹方24px */
#define TCFontSizeSys12 TCFontSystem(12)

/** 苹方30px */
#define TCFontSizeSys30 TCFontSystem(30)

/** 苹方22px */
#define TCFontSizeSys11 TCFontSystem(11)


/** 黑体48px */
#define TCFontSizeBold24 TCFontBold(24)

/** 黑体36px */
#define TCFontSizeBold18 TCFontBold(18)

/** 黑体32px */
#define TCFontSizeBold16 TCFontBold(16)

/** 3.0.0 early */

// 31号字体
#define FontSize31 [UIFont systemFontOfSize:31]
// 21号字体
#define FontSize21 [UIFont systemFontOfSize:21]
// 20号字体
#define FontSize20 [UIFont systemFontOfSize:20]
// 19号字体
#define FontSize19 [UIFont systemFontOfSize:19]
// 18号字体
#define FontSize18 [UIFont systemFontOfSize:18]
//17号字体
#define FontSize17 [UIFont systemFontOfSize:17]
//16号字体
#define FontSize16 [UIFont systemFontOfSize:16]
//15号字体 //用户协议
#define FontSize15 [UIFont systemFontOfSize:15]
//14号字体 //用户协议
#define FontSize14 [UIFont systemFontOfSize:14]
//13号字体
#define FontSize13 [UIFont systemFontOfSize:13]
//12号字体
#define FontSize12 [UIFont systemFontOfSize:12]
//11号字体
#define FontSize11 [UIFont systemFontOfSize:11]
//10号字体
#define FontSize10 [UIFont systemFontOfSize:10]

// 18号同标题字体//占位符字体 同标题
#define TitleFontSize18 [UIFont systemFontOfSize:18]

// 18号验证码字体
#define CodeFontSize18 [UIFont systemFontOfSize:18]

// 确定按钮 字号
#define ButtonTextFont [UIFont systemFontOfSize:(44/750)*TCScreenW]

// 屏幕适配后的px34号字体
#define Temp (34/750)*TCScreenW
#define AdaptataionFontSize34 [UIFont systemFontOfSize:Temp]

// 非必填 字号
#define NotTextFont [UIFont systemFontOfSize:16]

#endif /* MacroFontSize_h */
