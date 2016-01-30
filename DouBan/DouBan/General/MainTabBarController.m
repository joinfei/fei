//
//  MainTabBarController.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MainTabBarController.h"
#import "ActivityListViewController.h"
#import "MovieListViewController.h"
#import "MineViewController.h"
#import "CinemaListViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*四大模块：*/
    //活动
    ActivityListViewController *activityVC = [[ActivityListViewController alloc] initWithStyle:UITableViewStylePlain];
    activityVC.tabBarItem.title = @"活动";
    activityVC.tabBarItem.image = [UIImage imageNamed:@"activity"];
    activityVC.navigationItem.title = @"活动";
    
    UINavigationController *activityNavi = [[UINavigationController alloc] initWithRootViewController:activityVC];
    
    //电影
    MovieListViewController *movieListVC = [[MovieListViewController alloc] initWithStyle:UITableViewStylePlain];
    movieListVC.tabBarItem.title = @"电影";
    movieListVC.tabBarItem.image = [UIImage imageNamed:@"movie"];
    movieListVC.navigationItem.title = @"电影";


    UINavigationController *movieListNavi = [[UINavigationController alloc] initWithRootViewController:movieListVC];
    //影院
    CinemaListViewController *cinemaVC = [[CinemaListViewController alloc] initWithStyle:UITableViewStylePlain];
    cinemaVC.tabBarItem.title = @"影院";
    cinemaVC.tabBarItem.image = [UIImage imageNamed:@"movie"];
    cinemaVC.navigationItem.title = @"电影";
    
    UINavigationController *cinemaNavi = [[UINavigationController alloc] initWithRootViewController:cinemaVC];
    //我的
    MineViewController *mineVC = [[MineViewController alloc] initWithStyle:UITableViewStylePlain];
    mineVC.tabBarItem.title = @"我的";
    mineVC.tabBarItem.image = [UIImage imageNamed:@"user"];
    mineVC.navigationItem.title = @"我的";
    
    UINavigationController *mineNavi = [[UINavigationController alloc] initWithRootViewController:mineVC];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];
    
    self.viewControllers = @[activityNavi, movieListNavi, cinemaNavi, mineNavi];

    [activityNavi release];
    [activityVC release];
    [movieListNavi release];
    [movieListVC release];
    [cinemaNavi release];
    [cinemaVC release];
    [mineNavi release];
    [mineVC release];
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
