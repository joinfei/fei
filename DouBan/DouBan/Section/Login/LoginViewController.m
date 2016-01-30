//
//  LoginViewController.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "RegisterViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic, retain) LoginView *loginView;

@end

@implementation LoginViewController

- (void)loadView {
    self.loginView = [[LoginView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = _loginView;
    [_loginView release];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self setSubViews];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.loginView.loginBtn addTarget:self action:@selector(handleLogin:) forControlEvents:
     UIControlEventTouchUpInside];
    [self.loginView.registBtn addTarget:self action:@selector(handleRegister:) forControlEvents:UIControlEventTouchUpInside];
    
    _ntextfield.delegate = self;
    _mtextfield.delegate = self;
    
}

- (void)handleLogin:(UIButton *)sender{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"登陆成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
    [alert release];
}

- (void)handleRegister:(UIButton *)sender{
    RegisterViewController *Gvc = [[RegisterViewController alloc] init ];
    [self.navigationController  pushViewController:Gvc animated:YES];
    [Gvc release];
}





- (void)setSubViews{
    UILabel *nlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 80, 20)];
    UILabel *mlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 80, 20)];
    nlabel.textAlignment = NSTextAlignmentCenter;
    mlabel.textAlignment = NSTextAlignmentCenter;
    nlabel.text = @"用户名：";
    mlabel.text = @"密码：";
    
    [self.view addSubview:nlabel];
    [self.view addSubview:mlabel];
    [nlabel release];
    [mlabel release];
    
    
    self.ntextfield = [[UITextField alloc] initWithFrame:CGRectMake(130, 30, 180, 30)];
    self.mtextfield = [[UITextField alloc] initWithFrame:CGRectMake(130, 100, 180, 30)];
    _ntextfield.placeholder = @"请输入用户名";
    _mtextfield.placeholder = @"请输入密码";
    _ntextfield.borderStyle = UITextBorderStyleRoundedRect;
     _mtextfield.borderStyle = UITextBorderStyleRoundedRect;
    _mtextfield.secureTextEntry = YES;
    [self.view addSubview:_ntextfield];
    [self.view addSubview:_mtextfield];
    
    [_ntextfield release];
    [_mtextfield release];
    
    self.loginView.loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 170, 300, 40)];
    self.loginView.registBtn = [[UIButton alloc]  initWithFrame:CGRectMake(50, 230, 300, 40)];
    [_loginView.loginBtn setImage:[UIImage imageNamed:@"login_button@2x"] forState:UIControlStateNormal];
    [_loginView.registBtn setImage:[UIImage imageNamed:@"register_button@2x"] forState:UIControlStateNormal];
    
    [self.view addSubview:_loginView.registBtn];
    [self.view addSubview:_loginView.loginBtn];
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_ntextfield resignFirstResponder];
    [_mtextfield resignFirstResponder];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
}
  


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
