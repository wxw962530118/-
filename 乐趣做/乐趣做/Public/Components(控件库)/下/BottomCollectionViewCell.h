//
//  BottomCollectionViewCell.h
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopListModel.h"
#import "HotListModel.h"
@interface BottomCollectionViewCell : UICollectionViewCell
/**传商家model*/
@property (nonatomic,strong) ShopListModel * shopListModel;
/**传热门模型*/
@property (nonatomic, strong) HotListModel * hotListModel;
/***/
@property (nonatomic, strong) UIViewController *superVC;
-(instancetype)initWithFrame:(CGRect)frame;

@end
