//
//  SCShopDetailViewController.m
//  meituan
//
//  Created by scc on 16/4/10.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCShopDetailViewController.h"
#import "SCShopDetailImageCell.h"
#import "SCShopDatailDataModel.h"

#import "SCShopDetailPriceCell.h"
#import "SCShopDetailBackAnyTimeCell.h"
#import "SClookThisAllLookOtherCell.h"

#import "SCOtherRecommentCell.h"
#import "SCShopRecoummentModel.h"
#import "SCWebViewController.h"


@interface SCShopDetailViewController ()<UITableViewDataSource,UITableViewDelegate,SCShopDetailBackAnyTimeCellDelegate>
{
    SCShopDatailDataModel *shopDetailModel;
    
    
    NSMutableArray *shopRecommendArray;

}

@end

@implementation SCShopDetailViewController
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self loadOtherRecmendShop];
    [self initView];
    [self initNav];
}
#pragma mark    -初始化导航栏
-(void)initNav{
    UIBarButtonItem *leftItem = [UIBarButtonItem initWithNormalImage:@"back" target:self action:@selector(OnBackBtn) width:23 height:23];
    self.navigationItem.leftBarButtonItem = leftItem;
}
-(void)OnBackBtn{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark    -请求数据
-(void)initData{
    NSString *urlStr = [[GetUrlString sharedManager]urlWithShopDetailData:self.shopID];
    NSURL *URL = [NSURL URLWithString:urlStr];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"店铺详情请求成功");
        NSMutableArray *dataDic = [responseObject objectForKey:@"data"];
        shopDetailModel = [SCShopDatailDataModel mj_objectWithKeyValues:dataDic[0]];
        self.tableView.hidden = NO;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
}

-(void)loadOtherRecmendShop{
    shopRecommendArray = [NSMutableArray array];
    NSString *urlStr = [[GetUrlString sharedManager]urlWithOtherRecommendShop:self.shopID];
    NSURL *URL = [NSURL URLWithString:urlStr];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dataDic = [responseObject objectForKey:@"data"];
        
        NSMutableArray *dealsArray = [dataDic objectForKey:@"deals"];
        [shopRecommendArray removeAllObjects];
        for (int i = 0; i < dealsArray.count; i++) {
            SCShopRecoummentModel *shopRM = [SCShopRecoummentModel mj_objectWithKeyValues:dealsArray[i]];
            [shopRecommendArray addObject:shopRM];
        }
        
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
}
-(void)initView{
    self.title = @"团购详情";
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return shopRecommendArray.count +1;
        
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 5;
        
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row ==0) {
        return 190;
    }else if (indexPath.section == 0&& indexPath.row == 1){
        return 65;
    }else if (indexPath.section == 0&& indexPath.row ==2){
        return 45;
    }else if (indexPath.section == 1 && indexPath.row==0){
        return 30;
    }else{
        return 100;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 &&indexPath.row == 0) {
        SCShopDetailImageCell *cell = [SCShopDetailImageCell cellWithTableView:tableView ];
        cell.detailModel = shopDetailModel;
        return cell;
    }else if (indexPath.section ==0 && indexPath.row ==1){
        SCShopDetailPriceCell *cell = [SCShopDetailPriceCell cellWithTableView:tableView];
        cell.detailModel = shopDetailModel;
        return  cell;
    }else if (indexPath.section == 0 && indexPath.row ==2){
        
        SCShopDetailBackAnyTimeCell *cell = [SCShopDetailBackAnyTimeCell cellWithTableView:tableView];
        cell.delegate =self;
        cell.detailModel = shopDetailModel;
        return cell;
    }else if (indexPath.section ==1 && indexPath.row ==0){
        SClookThisAllLookOtherCell *cell = [SClookThisAllLookOtherCell cellWithTableView:tableView];
        return cell;
    }else if (indexPath.section == 1 && indexPath.row != 0){
        SCOtherRecommentCell *cell = [SCOtherRecommentCell cellWithTableView:tableView];
        cell.shopRecommentModel = shopRecommendArray[indexPath.row-1];
        return cell;
    }
    return nil;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        if (indexPath.row>0) {
            SCShopRecoummentModel *shopRM = shopRecommendArray[indexPath.row-1];
            SCShopDetailViewController *shopVC = [[SCShopDetailViewController alloc] init];
            shopVC.shopID = [NSString stringWithFormat:@"%@",shopRM.id];
            [self.navigationController pushViewController:shopVC animated:YES];
            
        }
    }
    
}
#pragma mark - 随时退
-(void)shopDetailBackAnyTimeButtonClick:(UIButton *)button{
    NSString *urlStr =  [[GetUrlString sharedManager]urlBackAnyTimeWebData];
    SCWebViewController *webVC = [[SCWebViewController alloc]init];
    webVC.urlStr = urlStr;
    [self.navigationController pushViewController:webVC animated:YES];
    
    
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
