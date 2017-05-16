//
//  TopCollectionView.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "TopCollectionView.h"
#import "TopCollectionViewCell.h"
#import "TopCollectionViewFlowLayout.h"
#define kMerchantCategoryTagCellID @"TopCategoryTagCell"
@interface TopCollectionView ()
<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, assign) BOOL isFromMerchantShower;

@end

@implementation TopCollectionView

+(instancetype)getTopCategoryTagCollectionView{
    TopCollectionViewFlowLayout *layout = [[TopCollectionViewFlowLayout alloc]init];
    TopCollectionView *merchantTagView = [[TopCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    return merchantTagView;
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self registerClass:[TopCollectionViewCell class] forCellWithReuseIdentifier:kMerchantCategoryTagCellID];
        [self addLineView];
        self.delegate = self;
        self.dataSource = self;
        self.isFromMerchantShower = NO;
    }
    return self;
}

-(void)didReciveNotiFromMerchantShower:(NSNotification *)noti{
    NSIndexPath *index = noti.object;
    //将后面的没有显示的 item 以动画的形式 展示出来
    [self selectItemAtIndexPath:index animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    self.isFromMerchantShower = YES;
    [self collectionView:self didSelectItemAtIndexPath:index];
}

-(void)setCategoryArray:(NSArray<HomeCategoryModel *> *)categoryArray{
    _categoryArray = categoryArray;
    //监听 滑动 下面 collectionView的通知 改变 标题的选中文字
    NotificationRegister(NOTIFICATION_SLIDERBOTTOMSEND, self,@selector(didReciveNotiFromMerchantShower:), nil);
    [self collectionView:self didSelectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
}

-(void)addLineView{
    if (!self.lineView) {
        self.lineView = [[UIView alloc]init];
        self.lineView.backgroundColor = ColorMain;
        [self addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self).multipliedBy(0.2);
            make.width.equalTo(self).multipliedBy(0.2);
            make.height.mas_equalTo(3);
            make.bottom.equalTo(self).offset(ScreenHeight / 15);
        }];
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.categoryArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMerchantCategoryTagCellID forIndexPath:indexPath];
    cell.categoryModel = self.categoryArray[indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    for (HomeCategoryModel * model in self.categoryArray) {
        model.isSelectd = NO;
    }
    self.categoryArray[indexPath.item].isSelectd = YES;
    [self reloadData];
    CGFloat lineViewTransX = indexPath.item * self.bounds.size.width * 0.2;
    [UIView animateWithDuration:0.21 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:9.8 options:0 animations:^{
        self.lineView.transform = CGAffineTransformMakeTranslation(lineViewTransX, 0);
    } completion:^(BOOL finished) {
        
    }];
    if (!self.isFromMerchantShower) {
        //手动点击 顶部的 item  发出通知  让 下面 的 视图相应
        [self selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
        POST_NOTIFICATION_NAMED_OBJECT(NOTIFICATION_TOUCHTOPSENDNOTI, indexPath);
    }else{
        self.isFromMerchantShower = NO;
    }
}

-(void)dealloc{
    NotificationRemoveAll(self);
}



@end
