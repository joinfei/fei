//
//  MovieListViewController.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieDetailViewController.h"
#import "Movie.h"
#import "UIImageView+WebCache.h"

@interface MovieListViewController ()
@property (nonatomic, retain) NSMutableArray *movieArr;//存储数据源

@end

@implementation MovieListViewController

- (NSMutableArray *)movieArr {
    if (!_movieArr) {
        self.movieArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _movieArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
    
    __block MovieListViewController *vc = self;
    NetAssistant *assistant = [[NetAssistant alloc] init];
    [assistant getRequestWithURL:kMovieListUrl success:^(NSURLResponse *response, id responseObject, NSError *error) {
        NSLog(@"%@", responseObject);
        NSArray *arr = responseObject[@"entries"];
        for (NSDictionary *dic in arr) {
            Movie *movie = [[Movie alloc] initWithDic:dic];
            [vc.movieArr addObject:movie];
            [movie release];
        }
        [vc.tableView reloadData];//刷新数据
    }];
    [assistant release];
    
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"movie"];
    
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
    return self.movieArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movie" forIndexPath:indexPath];
    
    // Configure the cell...
    Movie *movie = self.movieArr[indexPath.row];
    cell.textLabel.text = movie.title;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:movie.image] placeholderImage:[UIImage imageNamed:@"picholder"]];
    
    return cell;
}
/*
 push到详情页面
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieDetailViewController *detailVC = [[MovieDetailViewController alloc] init];
    Movie *movie = self.movieArr[indexPath.row];
    //将下一界面请求接口所需的id传递
    detailVC.movieID = movie.movieID;
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
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
