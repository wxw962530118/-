//
//  ShopsViewController.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "ShopsViewController.h"
#import "BottomCollectionView.h"
#import "HorizontalCollectionView.h"
#import "TopCollectionView.h"
#import "HomeCategoryModel.h"
#import "HomeCategoryCacheManager.h"
@interface ShopsViewController ()
@property (nonatomic, weak) TopCollectionView *tagView;
@property (nonatomic, weak) HorizontalCollectionView *collection;
@property (nonatomic, strong)NSArray <HomeCategoryModel *>* categoryArray;
@end

@implementation ShopsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TopCollectionView *tagView = [TopCollectionView  getTopCategoryTagCollectionView];
    [self.view addSubview:tagView];
    [tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ScreenHeight / 15);
        make.top.equalTo(self.view).offset(64);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    self.categoryArray = [HomeCategoryCacheManager fetchFitnessHostOriginalDataWithCatalog:HomeCategory_Catalog];
    tagView.categoryArray = [self.categoryArray copy];
    
    HorizontalCollectionView *collection = [HorizontalCollectionView getHorizontalCollectionView];
    collection.superVC = self;
    collection.categoryArray = [self.categoryArray copy];
    collection.backgroundColor = [UIColor grayColor];
    //取消自动向下-64
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.view addSubview:collection];
    //纵向的collectionView
    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
        // make.top.equalTo(self.view).offset(0);
        make.top.mas_equalTo(tagView.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view).offset(-44);
    }];
    self.collection = collection;
}

@end
