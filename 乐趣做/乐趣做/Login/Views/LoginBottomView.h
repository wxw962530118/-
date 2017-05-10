//
//  LoginBottomView.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM (NSInteger , LoginBtnType){
    LoginBtnType_QQ,
    LoginBtnType_WeiChat,
};

typedef void (^loginBtnCallBack)(LoginBtnType type);

@interface LoginBottomView : UIView

-(void)setLoginBtnClick:(loginBtnCallBack)type;


@end
