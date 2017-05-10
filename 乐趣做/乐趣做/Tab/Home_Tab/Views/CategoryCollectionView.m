//
//  CategoryCollectionView.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "CategoryCollectionView.h"
#import "CategoryCollectionCell.h"
//每行 的 item 的个数
#define rowItemCount 4

@interface CategoryCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray <HomeCategoryModel *> * categorys;//分类数据源

@end

@implementation CategoryCollectionView

+(instancetype)getCategoryViewWithData:(NSArray *)categorys withHeight:(CGFloat)viewHeight{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //展示几行 几列根据 分类数据源 决定
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    CategoryCollectionView * categoryView = [[CategoryCollectionView alloc]initWithFrame:CGRectMake(0,0,ScreenWidth, viewHeight) collectionViewLayout:flowLayout];
    categoryView.backgroundColor = [UIColor whiteColor];
    [categoryView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [categoryView registerNib:[UINib nibWithNibName:@"CategoryCollectionCell" bundle:nil]forCellWithReuseIdentifier:@"CategoryCollectionCell"];
    categoryView.categorys = [categorys copy];
    categoryView.pagingEnabled = YES;
    categoryView.bounces = NO;
    categoryView.showsVerticalScrollIndicator = NO;
    categoryView.showsHorizontalScrollIndicator = NO;
    categoryView.scrollEnabled = NO;
    return categoryView;
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor  whiteColor];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark -- UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(ScreenWidth/rowItemCount,96);
}

#pragma mark- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.categorys.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
        CategoryCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCollectionCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.clipsToBounds = YES;
        cell.model = self.categorys[indexPath.row];
        return cell;
}

#pragma mark - UICollectionViewDidSelect
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableDictionary * mulDic = [NSMutableDictionary dictionary];
    [mulDic setObject:self.categorys[indexPath.item].ID forKey:@"categoryid"];
    [mulDic setObject:@(indexPath.item) forKey:@"index"];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"UICollectionViewDidSelect" object:nil userInfo:mulDic];
}

@end
