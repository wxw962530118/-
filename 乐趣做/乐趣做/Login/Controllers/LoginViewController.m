//
//  LoginViewController.m
//  乐趣做
//
//  Created by 王新伟 on 2017/5/10.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginBottomView.h"
#import "LoginPhoneCell.h"
#import "LoginPassCell.h"
@interface LoginViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic,strong) UITableView * passWordLoginTableView;

@property (nonatomic,strong) MajorButton * loginButton;

@property (nonatomic,copy) NSString * phoneNumberStr;

@property (nonatomic,copy) NSString * passWordStr;

@property (nonatomic,strong) LoginBottomView * loginBottomView;

@property (nonatomic,strong)UIView * tableFooterView;

@end

@implementation LoginViewController

-(LoginBottomView *)loginBottomView{
    if (_loginBottomView == nil) {
        _loginBottomView = [[LoginBottomView alloc]init];
        _loginBottomView.backgroundColor = [UIColor clearColor];
        __weak typeof(self ) weakself = self;
        [_loginBottomView setLoginBtnClick:^(LoginBtnType type) {
            if (!type) {
//                [[TCOthersLoginManager manager] reqQQSSLLoginWithLoginResult:^(BOOL isSucceed, TCOthersLoginErrorCode errorCode, NSString *errorMsg, NSError *error) {
//                    if (errorCode == 200) {
//                        [weakself showLoadingExcaptNavigation];
//                    }
//                    if (isSucceed) {
//                        [weakself dismissViewControllerAnimated:YES completion:nil];
//                    }
//                }];
            }else{
//                [[TCOthersLoginManager manager]reqWeChatSSLLogin:weakself loginResult:^(BOOL isSucceed, TCOthersLoginErrorCode errorCode, NSString *errorMeg, NSError *error) {
//                    if (errorCode == 200) {
//                        [weakself showLoadingExcaptNavigation];
//                    }
//                    if (isSucceed) {
//                        [weakself dismissViewControllerAnimated:YES completion:nil];
//                    }
//                }];
            }
        }];
    }
    return _loginBottomView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self createNavigationItem];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.passWordLoginTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth,ScreenHeight) style:UITableViewStylePlain];
    self.passWordLoginTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.passWordLoginTableView.backgroundColor = ColorBackGround;
    self.passWordLoginTableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.passWordLoginTableView.delegate = self;
    self.passWordLoginTableView.dataSource = self;
    [self.view addSubview:self.passWordLoginTableView];
    self.passWordLoginTableView.tableFooterView = self.tableFooterView;
    self.loginBottomView.frame = CGRectMake(0,AdHeight(536) - Height(128),ScreenWidth,Height(128));
    [self.passWordLoginTableView addSubview:self.loginBottomView];
}

-(void)createNavigationItem{
    UIButton * leftButton = [[UIButton alloc]init];
    leftButton.frame = CGRectMake(0, 0, 40, 30);
    [leftButton setTitleColor:Color(33, 33,33) forState:UIControlStateNormal];
    leftButton.titleLabel.font = FontSize17;
    [leftButton setTitle:@"关闭" forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(dissMissVc) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.view.backgroundColor = [UIColor clearColor];
}

//退出登录页面
-(void)dissMissVc{
    [self dismissViewControllerAnimated:YES completion:^{
//        NSArray * ctrlArray = App_TheFrontNavC.viewControllers;
//        [App_TheFrontNavC popToViewController:[ctrlArray objectAtIndex:ctrlArray.count - 1] animated:YES];
    }];
    POST_NOTIFICATION_NAMED_(NOTIFICATION_DID_CANCEL_LOGIN);
}

-(UIView *)tableFooterView{
    if (_tableFooterView == nil) {
        _tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth,Height(150))];
        _tableFooterView.backgroundColor = ColorBackGround;
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake((ScreenWidth - Width(204))*0.5, 10, Width(204), 25)];
        label.font = FontSize13;
        label.textColor = Color(114, 114, 114);
        label.text = @"未登录过的用户请使用验证码登录";
        label.textAlignment = NSTextAlignmentCenter;
        [_tableFooterView addSubview:label];
        self.loginButton = [[MajorButton alloc]initWithFrame:CGRectMake((ScreenWidth - AdWidth(309)) * 0.5,CGRectGetMaxY(label.frame) + 15,AdWidth(309),Height(51))];
        [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [self.loginButton addTarget:self action:@selector(logining) forControlEvents:UIControlEventTouchUpInside];
        [_tableFooterView addSubview:self.loginButton];
        UIButton  * forgetButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - Width(32) - Width(65),CGRectGetMaxY(self.loginButton.frame) + 15,Width(65), Height(20))];
        [_tableFooterView addSubview:forgetButton];
        
        [forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.loginButton.mas_bottom).offset(Height(15));
            make.right.equalTo(self.loginButton.mas_right);
            make.height.mas_equalTo(Height(14));
            make.width.mas_equalTo(Width(100));
        }];
        [forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [forgetButton setTitleColor:Color(114, 114, 114) forState:UIControlStateNormal];
        [forgetButton addTarget:self action:@selector(getBackPassWord) forControlEvents:UIControlEventTouchUpInside];
        forgetButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        forgetButton.titleLabel.font = FontSize16;
    }
    return _tableFooterView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        LoginPhoneCell * cell = [LoginPhoneCell cellWithTableView:tableView];
//        cell.phoneTextFieldChangedBlock = ^(NSString * string) {
//            self.phoneNumberStr = string;
//        };
        return cell;
    }else{
        LoginPassCell * cell = [LoginPassCell cellWithTableView:tableView];
//        [cell cleanCellContent];
//        cell.passWordTextFieldChangedBlock = ^(NSString * string){
//            self.passWordStr = string;
//        };
        return cell;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //self.phoneNumberStr = [TCAccountManager getLoginPhoneNumber];
    return  61;
}

#pragma mark --- 找回密码
-(void)getBackPassWord{
//    TCGetBackPassWordViewController * getBackPassWordVC = [[TCGetBackPassWordViewController alloc]init];
//    [self.navigationController pushViewController:getBackPassWordVC animated:YES];
}

#pragma mark --- 普通登录
-(void)logining{
//    [self.view endEditing:YES];
//    if (![[TCNetworkManager sharedInstance]isNetworkReachable]) {
//        [MBProgressHUD showError:TCNotNetWarning];
//        return;
//    }
//    if (self.phoneNumberStr.length == 0) {
//        [MBProgressHUD showError:@"请输入手机号码"];
//        return;
//    }else{
//        if([CHprediate valiMobile:self.phoneNumberStr]){
//            NSString * str = [CHprediate valiMobile:self.phoneNumberStr];
//            [MBProgressHUD showError:str];
//        }
//    }
//    if (self.passWordStr.length == 0) {
//        [MBProgressHUD showError:@"请输入密码"];
//        return;
//    }else{
//        if ([CHprediate valiMobile:self.phoneNumberStr]) {
//            NSString * str = [CHprediate valiMobile:self.phoneNumberField.text];
//            [MBProgressHUD showError:str];
//            return;
//        }
//    }
//    if (self.passWordStr.length == 0) {
//        [MBProgressHUD showError:@"请输入密码"];
//        return;
//    }else if (self.passWordStr.length <6 || self.passWordStr.length > 20){
//        [MBProgressHUD showError:@"请输入6-20位密码"];
//        return;
//    }
//    [[TCPersonalNetManager manager]loginUserPhoneNumber:self.phoneNumberStr userPassWord:self.passWordStr  succeed:^(id responseObject) {
//        Account * account = [Account objectWithKeyValues:responseObject];
//        // 自定义对象的存储必须用NSKeyedArchiver，不再有什么writeToFile方法
//        [TCAccountManager saveUserWithAccount:account];
//        [[NSUserDefaults standardUserDefaults]setValue:@"userID" forKey:account.id];
//        [[NSUserDefaults standardUserDefaults]synchronize];
//        [MBProgressHUD showSuccess:@"登录成功"];
//        [TalkingData setGlobalKV:@"user" value:account.phone];
//        // 注册JPush
//        [[TCMajorNetwork manager]requestForRegistJPushIDWithAccount:account succeed:^(id responseObject) {
//            NSLog(@"注册jpush成功");
//        } failures:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"JPush registration_id 注册失败：%@",error);
//        }];
//        [self dismissViewControllerAnimated:YES completion:^{TCPOST_NOTIFICATION_NAMED_OBJECT(TCNOTIFICATION_DID_LOGIN_SUCCEED, self.fromFunction);}];
//        return ;
//    } failures:^(AFHTTPRequestOperation *operation, NSError *error) {
//        self.loginButton.isInvalid = NO;
//        if (operation.response.statusCode == 502 || operation.response == nil) {
//            [MBProgressHUD showError:TCNotServerWarning];
//        }
//        NSDictionary * dic = [ErrorManager changeErrorToNSDictionary:error];
//        NSString * str = dic[@"code"];
//        if([str intValue] == 601){
//            [MBProgressHUD showError:@"该手机号码不存在"];
//        }else if([str intValue] == 602){
//            self.passWordField.text = @"";
//            [MBProgressHUD showError:@"密码错误，请重新输入"];
//        }else if(operation.response.statusCode == 400){
//            ErrorModel * errorModel =  [ErrorModel objectWithKeyValues:dic];
//            if ([errorModel.code integerValue] == 4000) {
//                [[TCForbiddenAccountManger manager] pressentForbiddenAlertWithoutLoginWith:errorModel];
//            }else{
//                [MBProgressHUD showError:dic[@"error"]];
//            }
//        }else {
//            [MBProgressHUD showError:dic[@"error"]];
//        }
//    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
