//
//  RegisterViewController.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    RegisterView *rv = [[RegisterView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = rv;
    self.view.backgroundColor  = [UIColor whiteColor];
    
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
