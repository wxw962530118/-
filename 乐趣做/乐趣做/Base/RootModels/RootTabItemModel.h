//
//  RootTabItemModel.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RootTabItemModel : NSObject
@property (nonatomic, copy) NSString *class_name;

@property (nonatomic, copy) NSString *icon_normal;

@property (nonatomic, copy) NSString *icon_selected;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) UIImage *rIcon_normal;

@property (nonatomic, strong) UIImage *rIcon_selected;

@end
