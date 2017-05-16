//
//  HomeViewController.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/8.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeNavView.h"
#import "ScanQrCodeController.h"
#import "SearchViewController.h"
#import "HistoryViewController.h"
#import "HomeCategoryCell.h"
#import "HomeLoopViewCell.h"
#import "HomeHotSubjectCell.h"
#import "HomeListModel.h"
#import "CategoryListViewController.h"
#import "HomeCategoryCacheManager.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSInteger  _currentPage;
}

@property (nonatomic, strong) HomeListModel *listModel;
/**分类数据*/
@property (nonatomic, strong) NSArray <HomeCategoryModel *> *categorys;
/**广告轮播数据*/
@property (nonatomic, strong) NSArray <HomeADModel *> *ads;
/**专题数据*/
@property (nonatomic, strong) NSMutableArray <HomeSpecialModel *> *specials;
/**自定义导航栏*/
@property (nonatomic, strong) HomeNavView * navView;

@property (nonatomic, strong) UITableView * homeTableView;

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.navView];
    [self loadHomeData];
    [self addObserver];
}

-(void)addObserver{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(info:) name:@"UICollectionViewDidSelect" object:nil];
}

-(void)info:(NSNotification *)noti{
    CategoryListViewController * vc = [[CategoryListViewController alloc]init];
    vc.selectIndex = [noti.userInfo[@"index"] integerValue];
    vc.categoryid = noti.userInfo[@"categoryid"];
    vc.categoryArray = self.categorys;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)loadHomeData{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    WS(weakSelf)
    [[HomeNetWorkManager shareManager]getHomeCategoryDataWithSuccess:^(id respons) {
        [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
        HomeListModel * listModel = [HomeListModel mj_objectWithKeyValues:respons[@"info"]];
        weakSelf.listModel = listModel;
        weakSelf.categorys = listModel.category;
        [HomeCategoryCacheManager saveFitnessHostOriginalData:weakSelf.categorys catalog:HomeCategory_Catalog];
        weakSelf.ads = listModel.ad;
        weakSelf.specials = [NSMutableArray arrayWithArray:listModel.special];
        [weakSelf.homeTableView reloadData];
        [weakSelf.homeTableView.mj_header endRefreshing];
    } faile:^(NSURLSessionDataTask *task, NSError *error) {
        [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
        [weakSelf.homeTableView.mj_header endRefreshing];
    }];
}

-(UITableView *)homeTableView{
    if (_homeTableView == nil) {
        _homeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,100, ScreenWidth, ScreenHeight - 100) style:UITableViewStyleGrouped];
        _homeTableView.delegate = self;
        _homeTableView.dataSource = self;
        _homeTableView.backgroundColor = Color(237, 237, 237);
        _homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:self.homeTableView];
        WS(weakSelf)
        _homeTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            _currentPage = 1;
            [weakSelf loadHomeData];
        }];
    }
    return _homeTableView;
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0)
    if (indexPath.row == 0)  return [HomeCategoryCell getCellHeightWithModel:self.listModel];
    else    return 64;
    else    return 120;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) return 2;
    else return self.specials.count;
}

-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) return 6;
    else return 25;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section) {
        UIView * headerView = [[UIView alloc]init];
        UILabel * leftLabel = [[UILabel alloc]init];
        leftLabel.text = @"热门专题";
        leftLabel.font = [UIFont systemFontOfSize:14];
        [headerView addSubview:leftLabel];
        [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headerView.mas_left).offset(15);
            make.centerY.equalTo(headerView.mas_centerY).offset(-7);
        }];
        
        UILabel * rightLabel = [[UILabel alloc]init];
        rightLabel.text = @"全部专题>>";
        rightLabel.textColor = Color(26, 160,239);
        rightLabel.userInteractionEnabled = YES;
        rightLabel.font = [UIFont systemFontOfSize:14];
        [headerView addSubview:rightLabel];
        [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(headerView.mas_right).offset(-15);
            make.centerY.equalTo(headerView.mas_centerY).offset(-7);
        }];
        [rightLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushToMoreSubject)]];
        return headerView;
    }else{
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            HomeCategoryCell * cell = [HomeCategoryCell cellWithTableView:tableView];
            cell.categoryArray = self.categorys;
            return cell;
        }else{
            HomeLoopViewCell * cell = [HomeLoopViewCell cellWithTableView:tableView];
            cell.loopArray = self.ads;
            return cell;
        }
    }else{
        HomeHotSubjectCell * cell = [HomeHotSubjectCell cellWithTableView:tableView];
        [cell setDataWithModel:self.specials[indexPath.row]];
        return cell;
    }
}

-(HomeNavView *)navView{
    if (_navView == nil){
        ScanQrCodeController  * scanVC = [[ScanQrCodeController alloc]init];
        SearchViewController  * searchVC = [[SearchViewController alloc]init];
        HistoryViewController * historyVC = [[HistoryViewController alloc]init];
        _navView = [HomeNavView createNaViewWithCallBack:^(NavViewButtonType type) {
            switch (type) {
                case NavViewButtonType_Scan:
                    [self.navigationController pushViewController:scanVC animated:YES];
                    break;
                case NavViewButtonType_Search:
                    [self.navigationController pushViewController:searchVC animated:YES];
                    
                    break;
                case NavViewButtonType_History:
                    [self.navigationController pushViewController:historyVC animated:YES];
                    
                    break;
            }
        }];
    }
    return _navView;
}


#pragma mark --- pushToMoreSubject
-(void)pushToMoreSubject{

}
@end
