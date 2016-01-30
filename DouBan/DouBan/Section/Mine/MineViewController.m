//
//  MineViewController.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MineViewController.h"
#import "LoginViewController.h"
#import "LoginView.h"
#import "FileManager.h"
@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"mine"];
   // UIBarButtonItem *leftBtn = [UIBarButtonItem alloc] initWithTitle:@"登陆" style:UIBarButtonItemStylePlain target:<#(id)#> action:<#(SEL)#>
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"登陆" style:UIBarButtonItemStylePlain target:self action:@selector(handleRightBtn:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    
   
}

- (void)handleRightBtn:(UIBarButtonItem *)sender{
    LoginViewController  *login = [[LoginViewController  alloc]init];
   // UINavigationController *nc =  [[UINavigationController alloc]initWithRootViewController:login];
    [self.navigationController  pushViewController:login animated:YES];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mine" forIndexPath:indexPath];
    NSArray *arr = @[@"我的活动",@"我的电影",@"清除缓存"];
    cell.textLabel.text = arr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 2:
            [self clearCaches];
            break;
            
        default:
            break;
    }
    
    
}


- (void)clearCaches{
    
   NSString *size = [[NSFileManager defaultManager] attributesOfItemAtPath:[[FileManager shareManager]downloadImagePath] error:nil][@"NSFileSize"];
    NSString *message = [NSString stringWithFormat:@"清理了%@的缓存",size];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"清理成功" message: message preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:^{
    }];
    [self performSelector:@selector(dismissViewControllerAnimated:completion:) withObject:nil afterDelay:2.0];
    
    [FileManager clearCaches];
}






/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
