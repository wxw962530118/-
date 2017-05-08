//
//  UITableViewCell+Cell.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "UITableViewCell+Cell.h"

@implementation UITableViewCell (Cell)


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell loadWithComponents];
    }
    return cell;
}

/**
 *  tableViewCell 布局cell
 */
- (void)loadWithComponents{
    
}

+ (instancetype)cellWithTableViewFromXIB:(UITableView *)tableView{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if(cell == nil){
        cell = [self viewFromXIB];
    }
    return cell;
}

/**
 *  自动从xib创建视图
 */
+(instancetype)viewFromXIB {
    UITableViewCell * xibCell = [[[NSBundle mainBundle] loadNibNamed:kCellIdentifier owner:nil options:nil] firstObject];
    if(xibCell == nil){
        NSLog(@"CoreXibView：从xib创建视图失败，当前类是：%@",kCellIdentifier);
    }
    return xibCell;
}

- (void)setDataWithModel:(BaseModel *)model{
    
}

+ (CGFloat)getCellHeightWithModel:(BaseModel *)model{
    return 0;
}


@end
