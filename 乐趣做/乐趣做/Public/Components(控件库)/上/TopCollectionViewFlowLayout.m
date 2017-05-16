//
//  TopCollectionViewFlowLayout.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "TopCollectionViewFlowLayout.h"

@implementation TopCollectionViewFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    // 此方法被调用的时候 collectionView 的大小已经被设置完成
    self.itemSize = CGSizeMake(self.collectionView.bounds.size.width/5, self.collectionView.bounds.size.height-6);
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
}


@end
