
//
//  MoreViewController.m
//  meituan
//
//  Created by scc on 16/4/2.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "MoreViewController.h"
#import "SCMoreCell.h"
#import "SCWebViewController.h"
@interface MoreViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *moreTableView;
@property(nonatomic, strong)NSArray *moreModelArray;
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title =@"更多";
    self.view.backgroundColor = [UIColor clearColor];
    //初始化视图
    [self initView];
    [self laodMoreMenuData];

}
#pragma mark - 加载数据
-(void)laodMoreMenuData{
    self.moreModelArray = [GetPlistArray arrayWithString:@"MoreData.plist"];
}

#pragma mark - 初始化tableView
-(void)initView{
    self.moreTableView =[UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64) withDelegate:self];
    [self.view addSubview:self.moreTableView];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 5;
    }else if (section == 2){
        return 5;
    }else{
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SCMoreCell *cell = [SCMoreCell cellWithTableView:tableView indexPath:indexPath moreArray:self.moreModelArray];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        if (indexPath.row == 1) {
            //支付帮助
            NSString *urlStr =  [[GetUrlString sharedManager]urlWithPayHelp];
            SCWebViewController *webVC = [[SCWebViewController alloc] init];
            webVC.urlStr = urlStr;
            [self.navigationController pushViewController:webVC animated:YES];

        }else if(indexPath.row == 4){
            //我要应聘
            NSString *urlStr =  [[GetUrlString sharedManager]urlWithHelpWorking];
            SCWebViewController *webVC = [[SCWebViewController alloc] init];
            webVC.urlStr = urlStr;
            [self.navigationController pushViewController:webVC animated:YES];        }

    }
        
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
