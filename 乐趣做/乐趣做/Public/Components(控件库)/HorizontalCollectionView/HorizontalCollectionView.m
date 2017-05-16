//
//  HorizontalColleectionView.m
//  iVideo
//
//  Created by 孙诚 on 16/4/25.
//  Copyright © 2016年 BrianLee. All rights reserved.
//

#import "HorizontalCollectionView.h"
#import "HorizontalCollectionViewCell.h"
#import "HorizontalFlowLayout.h"
#import "HomeCategoryModel.h"

//typedef NS_ENUM(NSInteger ,ComeFromeType){
//    ComeFromeType_Shop = 100,
//    ComeFromeType_Hot,
//};

@interface HorizontalCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, assign) BOOL isFromCategoryTag;

@end

@implementation HorizontalCollectionView
static NSString *reuseIdentifier = @"Cell";

+(instancetype)getHorizontalCollectionView{
    HorizontalCollectionView *collection = [[HorizontalCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[[HorizontalFlowLayout alloc]init]];
    //滚动条
    collection.showsHorizontalScrollIndicator = YES;
    //页
    collection.pagingEnabled  = NO;
    //颜色
    collection.backgroundColor = [UIColor whiteColor];
    //反弹效果
    //collection.bounces = NO;
    return collection;
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[HorizontalCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        //监听点击item的通知
        NotificationRegister(NOTIFICATION_TOUCHTOPSENDNOTI, self, @selector(changeShowcaseChannel:), nil);
    }
    return self;
}

#pragma mark --- 点击顶部的item调用的方法
-(void)changeShowcaseChannel:(NSNotification *)noti{
    self.isFromCategoryTag = YES;
    [self selectItemAtIndexPath:noti.object animated:NO scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}

#pragma 数据源
//左右滑动 切换 视图  发出通知  同时改变 顶部的标签的选中文字
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:( NSIndexPath *)indexPath{
    if (!self.isFromCategoryTag) {
        NotificationPost(NOTIFICATION_SLIDERBOTTOMSEND, [self.indexPathsForVisibleItems firstObject], nil);
    }
    HorizontalCollectionViewCell *Cell = (HorizontalCollectionViewCell *)cell;
    [Cell scrollToTopAndCleanData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.categoryArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HorizontalCollectionViewCell *Cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    Cell.categoryModel = self.categoryArray[indexPath.item];
    Cell.superVC = self.superVC;
    return Cell;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.isFromCategoryTag = NO;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"csssdcdcscsc");
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"滚动-----");
}

@end
