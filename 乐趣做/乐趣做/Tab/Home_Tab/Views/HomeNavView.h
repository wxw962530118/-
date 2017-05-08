//
//  HomeNavView.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , NavViewButtonType) {
    
    NavViewButtonType_Scan,//扫码
    
    NavViewButtonType_Search,//搜索
    
    NavViewButtonType_History,//历史
    
};

typedef void(^NavViewCallBack)(NavViewButtonType  type);

@interface HomeNavView : UIView

+(instancetype)createNaViewWithCallBack:(NavViewCallBack) callBack;

@end
