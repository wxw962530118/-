//
//  MajorButton.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MajorButton : UIButton
/**
 *  是否是失效状态, YES: 失效(按钮变灰不可选) / NO: 正常(按钮黄色可选)
 */
@property (nonatomic, assign) BOOL isInvalid;

@end
