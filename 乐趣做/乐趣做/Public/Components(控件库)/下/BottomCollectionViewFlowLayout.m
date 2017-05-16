//
//  BottomCollectionViewFlowLayout.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BottomCollectionViewFlowLayout.h"

@implementation BottomCollectionViewFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    // 此方法被调用的时候 collectionView 的大小已经被设置完成
    self.itemSize = self.collectionView.bounds.size;
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor redColor];
}


@end
