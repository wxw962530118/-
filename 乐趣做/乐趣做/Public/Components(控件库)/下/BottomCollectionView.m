//
//  BottomCollectionView.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/16.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "BottomCollectionView.h"
#import "BottomCollectionViewCell.h"
#import "HorizontalFlowLayout.h"
#import "HomeCategoryModel.h"
#import "BottomCollectionView.h"
#import "ShopNetWorkManager.h"
#import "HotNetWorkManager.h"
//cell之间的间距
#define kRow 10

@interface BottomCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    NSUInteger Page_NO;
    NSUInteger Page_Count;
}

@property (nonatomic, strong) NSMutableArray <ShopListModel*>*shopListArray;
@property (nonatomic, strong) NSMutableArray <HotListModel*>*hotListArray;

@property(nonatomic,strong)NSMutableArray * merchantArr;
/**数据源*/
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

static NSString * reuseIdentifier = @"Cell";

@implementation BottomCollectionView

+(instancetype)getClassCollectionViewWithCategory{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(ScreenWidth, ScreenHeight / 7 );
    layout.sectionInset = UIEdgeInsetsMake(5, 0, 0, 0);
    //设置间距
    //layout.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
    //每一行间距
    layout.minimumLineSpacing = 7.5;
    //初始化
    BottomCollectionView *controller = [[BottomCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    //controller.categoryModel = categoryModel;
    controller.backgroundColor  =[UIColor clearColor];
    return controller;
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.dataSource = self;
        self.delegate = self;
        Page_NO     = 1;
        Page_Count  = 10;
        self.shopListArray = [NSMutableArray array];
        self.hotListArray = [NSMutableArray array];
        __weak typeof(self) wself = self;
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [wself loadNewData];
        }];
        self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [wself loadMoreData];
        }];
        //注册 cell
        [self registerClass:[BottomCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    }
    return self;
    
}

- (void)loadNewData{
    Page_NO = 1;
    [self loadData];
}

- (void)loadMoreData{
    Page_NO ++;
    [self loadData];
}

#pragma mark --- 根据选择的类型请求数据
-(void)loadData{
    if ([self.superVC isKindOfClass:NSClassFromString(@"ShopsViewController")]) {
        //当前是商家
        [[ShopNetWorkManager shareManager]getShopCategoryDataWithCategoryid:self.category.ID offset:Page_NO limit:Page_Count success:^(id respons) {
            if (Page_NO == 1){
                [self.shopListArray removeAllObjects];
            }
            [self.shopListArray addObjectsFromArray:[ShopListModel mj_objectArrayWithKeyValuesArray:respons[@"info"]]];
            if (![respons count]){
                Page_NO --;
            }
            [self reloadData];
            [self.mj_header endRefreshing];
        } faile:^(NSURLSessionDataTask *task, NSError *error) {
            [self.mj_header endRefreshing];
        }];
    }else if ([self.superVC isKindOfClass:NSClassFromString(@"HotViewController")]){
         //当前是热门
        [[HotNetWorkManager shareManager] getHotCategoryDataWithCategoryid:self.category.ID hot:@"1" offset:Page_NO limit:Page_Count success:^(id respons) {
            if (Page_NO == 1){
                [self.hotListArray removeAllObjects];
            }
            [self.hotListArray addObjectsFromArray:[HotListModel mj_objectArrayWithKeyValuesArray:respons[@"info"]]];
            if (![respons count]){
                Page_NO --;
            }
            [self reloadData];
            [self.mj_header endRefreshing];
        } faile:^(NSURLSessionDataTask *task, NSError *error) {
            [self.mj_header endRefreshing];
        }];
    }
}

//数据源
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //BottomCollectionViewCell * cell = (BottomCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"当前选中的cell----%ld",indexPath.row);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if ([self.superVC isKindOfClass:NSClassFromString(@"ShopsViewController")]) {
        return self.shopListArray.count;
    }else{
        return self.hotListArray.count;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BottomCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if ([self.superVC isKindOfClass:NSClassFromString(@"ShopsViewController")]) {
        cell.shopListModel = self.shopListArray[indexPath.item];
    }else{
        cell.hotListModel = self.hotListArray[indexPath.item];
    }
    cell.superVC = self.superVC;
    cell.backgroundColor = ColorWhiteGround;
    return cell;
}

-(void)setCategory:(HomeCategoryModel *)category{
    _category = category;
    [self.mj_header beginRefreshing];
}

-(void)scrollToTopAndCleanData{
    if (self.shopListArray != nil) {
        if (self.shopListArray.count > 0){
            [self scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
        }
    }
    [self reloadData];
}

@end
