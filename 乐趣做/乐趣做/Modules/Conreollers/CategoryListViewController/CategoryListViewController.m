//
//  CategoryListViewController.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/9.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "CategoryListViewController.h"
#import "CategoryListLeftCell.h"
#import "CategoryListModel.h"
#import "CategoryCollectionCell.h"
@interface CategoryListViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UITableView * leftTableView;

@property (nonatomic, strong) UICollectionView * rightCollectionView;

@property (nonatomic, strong) CategoryListModel * listModel;

//@property (nonatomic, strong) NSArray <HomeCategoryModel *> *category;

@property (nonatomic, strong) NSArray <CategoryRecommendModel *> *recommend;

@property (nonatomic, strong) NSArray <CategoryBrandModel *> *brand;


@end

@implementation CategoryListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"查看品牌";
    for (HomeCategoryModel * model in self.categoryArray) {
        model.isSelectd = NO;
    }
    self.categoryArray[self.selectIndex].isSelectd = YES;
    [self.leftTableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
}

/*数据源根据不同分类 请求数据*/
-(void)loadData{
    WS(weakSelf)
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[HomeNetWorkManager shareManager]getCategorysListWithCategoryid:self.categoryid success:^(id respons) {
        [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
        weakSelf.listModel = [CategoryListModel mj_objectWithKeyValues:respons[@"info"]];
        weakSelf.recommend = weakSelf.listModel.recommend;
        weakSelf.brand = weakSelf.listModel.brand;
        [weakSelf.rightCollectionView reloadData];
    } faile:^(NSURLSessionDataTask *task, NSError *error) {
        [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
    }];
}

-(UICollectionView *)rightCollectionView{
    if (!_rightCollectionView) {
        UICollectionViewFlowLayout * flowLayer = [[UICollectionViewFlowLayout alloc]init];
        flowLayer.minimumInteritemSpacing = 0;
        flowLayer.minimumLineSpacing = 0;
        _rightCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayer];
        _rightCollectionView.backgroundColor = Color(255, 255, 255);
        _rightCollectionView.delegate = self;
        _rightCollectionView.dataSource = self;
        _rightCollectionView.showsVerticalScrollIndicator = NO;
        [_rightCollectionView registerNib:[UINib nibWithNibName:@"CategoryCollectionCell" bundle:nil]forCellWithReuseIdentifier:@"CategoryCollectionCell"];
        [self.view addSubview:_rightCollectionView];
        [_rightCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftTableView.mas_right).offset(0);
            make.top.equalTo(self.leftTableView.mas_top).offset(64);
            make.right.equalTo(self.view.mas_right);
            make.bottom.equalTo(self.view.mas_bottom);
        }];
    }
    return _rightCollectionView;
}

-(UITableView *)leftTableView{
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _leftTableView.backgroundColor = Color(237, 237, 237);
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.showsVerticalScrollIndicator = NO;
        _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _leftTableView.tableFooterView = [[UIView alloc]init];
        [self.view addSubview:_leftTableView];
        [_leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left);
            make.top.equalTo(self.view.mas_top);
            make.width.mas_equalTo(64);
            make.bottom.equalTo(self.view.mas_bottom);
        }];
    }
    return _leftTableView;
}

#pragma mark ---UICollectionView 代理
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((int)(ScreenWidth - 64) / 3, 96);
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.brand.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCollectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.clipsToBounds = YES;
    cell.brandModel = self.brand[indexPath.row];
    return cell;
}

#pragma mark --- tableView代理
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryListLeftCell * cell = [CategoryListLeftCell cellWithTableView:tableView];
    cell.model = self.self.categoryArray[indexPath.section];
    return cell;
    
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    return self.categoryArray.count;
}

-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    for (HomeCategoryModel * model in self.categoryArray) {
        model.isSelectd = NO;
    }
    self.categoryArray[indexPath.section].isSelectd = YES;
    [self.leftTableView reloadData];
    self.categoryid = self.categoryArray[indexPath.section].ID;
    [self loadData];
}

@end
