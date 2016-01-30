//
//  ActivityDetailViewController.m
//  DouBan
//
//  Created by 周华定 on 15/12/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "Activity.h"
#import "UIImageView+Addition.h"

@interface ActivityDetailViewController ()

@end

@implementation ActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setView];
    NSLog(@"%@",self.activity);
    self.detailTitle.text = _activity.title;
    self.detailAddress.text = _activity.address;
    self.detailcategoty_name.text = _activity.category_name;
     self.detailcontent.text = _activity.content;
    NSString *begintime = [_activity.begin_time substringWithRange:NSMakeRange(5, 11)];
    NSString *endtime = [_activity.end_time  substringWithRange:NSMakeRange(5, 11)];
    self.detailTimeView.text =   [NSString stringWithFormat:@"%@--%@",begintime,endtime];
    
    [ self.detailImage   setImageWithImageURL:_activity.image placeholder:[UIImage imageNamed:@"picholder"]];
    
    
}

- (void)setView{
    self.detailTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 355, 40)];
    _detailTitle.textColor = [UIColor blackColor];
    
    [self.view addSubview:_detailTitle];
    [_detailTitle release];
 
    
    NSArray * imagearr = @[@"icon_date@2x",@"icon_sponsor_blue@2x",@"icon_catalog@2x",@"icon_spot_blue@2x"];
    for (int i = 0;  i < 4; i++) {
        UIImageView   *markImage = [[UIImageView alloc ]initWithFrame:CGRectMake(125, 60 + i * 35, 20, 20)];
         markImage.image = [UIImage  imageNamed:imagearr[i]];
        [self.view addSubview:markImage];
    }
    
    self.detailTimeView = [[UILabel  alloc] initWithFrame:CGRectMake(145, 60, 200, 20)];
    _detailTimeView.numberOfLines = 0;
    _detailTimeView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_detailTimeView];
    
    
    self.detailcategoty_name = [[UILabel alloc] initWithFrame:CGRectMake(145, 125, 150, 20)];
    _detailcategoty_name.textColor = [UIColor blackColor];
    [self.view addSubview:_detailcategoty_name];
    
    self.detailAddress = [[UILabel alloc] initWithFrame:CGRectMake(145, 155, 200, 40)];
    self.detailAddress.numberOfLines = 0;
    self.detailAddress.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_detailAddress];
    
    
    self.detailImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 60, 100, 150)];
     [self.view addSubview:_detailImage];
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 220, 300, 20)];
    label1.text = @"活动介绍";
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:label1];
    [label1 release];
    
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 240, 355, 500)];
     scrollview.contentSize = CGSizeMake(355, 800);
    self.detailcontent = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 355, 500)];
    _detailcontent.font = [UIFont systemFontOfSize:16];
    _detailcontent.numberOfLines = 0;
    [scrollview addSubview:_detailcontent];
    
    [self.view addSubview:scrollview];
    
     
    
}


//- (void)setActivity:(Activity *)activity{
//    if (_activity != activity) {
//        [_activity release];
//        [_activity retain];
//    }
//    
//    self.detailcategoty_name.text = activity.category_name;
//    self.detailTitle.text = activity.title;
//    NSLog(@"----%@",activity.title);
//    NSLog(@"%@",_detailTitle.text);
//}



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
