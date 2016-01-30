//
//  ActivityListViewController.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ActivityListViewController.h"
#import "ActivityViewCell.h"
#import "Activity.h"
#import "ActivityDetailViewController.h"

@interface ActivityListViewController ()

@property (nonatomic, retain) NSMutableArray *dataSource;

@end

@implementation ActivityListViewController

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", NSHomeDirectory());
    
    [self.tableView registerClass:[ActivityViewCell class] forCellReuseIdentifier:@"activity"];
    self.tableView.rowHeight = 200;
    
    __block ActivityListViewController *vc = self;
    NetAssistant *assistant = [[NetAssistant alloc] init];
    [assistant getRequestWithURL:kActivityListUrl success:^(NSURLResponse *response, id responseObject, NSError *error) {
        NSLog(@"%@", responseObject);
        //解析前 可判断获取的数据是否为空 做一个安全处理

        [vc handleData:responseObject];
    }];
  
}

- (void)handleData:(id)responseObject {
    NSDictionary *dic = responseObject;
    NSArray *arr = dic[@"events"];
    for (NSDictionary *dic in arr) {
        Activity *activity = [[Activity alloc] initWithDic:dic];
        [self.dataSource addObject:activity];
        [activity release];
    }
    //NSLog(@"%@", self.dataSource);
    //刷新界面
    //[self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if ([self isViewLoaded] && !self.view.window) {
        self.view = nil;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activity" forIndexPath:indexPath];
    
    Activity *activity = self.dataSource[indexPath.row];
    // Configure the cell...
    cell.activity = activity;
    
    return cell;
}
/*
 进入详情页面
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityDetailViewController *detailVC = [[ActivityDetailViewController alloc] init];
    //获取要传递的数据
    Activity *activity = self.dataSource[indexPath.row];
    //属性传值
    detailVC.activity = activity;
    [self.navigationController pushViewController:detailVC animated:YES];
    [detailVC release];
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
