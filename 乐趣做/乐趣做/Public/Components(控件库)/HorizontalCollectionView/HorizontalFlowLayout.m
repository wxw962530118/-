//
//  HorizontalFlowLayout.m
//  iVideo
//
//  Created by 孙诚 on 16/4/28.
//  Copyright © 2016年 BrianLee. All rights reserved.
//

#import "HorizontalFlowLayout.h"

@implementation HorizontalFlowLayout

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
    self.collectionView.backgroundColor = ColorBackGround;
}


@end
