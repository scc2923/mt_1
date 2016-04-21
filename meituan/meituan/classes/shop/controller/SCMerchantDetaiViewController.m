//
//  SCMerchantDetaiViewController.m
//  meituan
//
//  Created by scc on 16/4/13.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCMerchantDetaiViewController.h"
#import "SCMerchanDetailModel.h"
#import "SCMerchanArountGroupModel.h"

#import "SCMerchantDetailImageCell.h"
#import "SCMerchantDetailAddressCell.h"
#import "SCMerchantAroundGroupCell.h"

#import "SCAroundButTitleCell.h"
@interface SCMerchantDetaiViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UILabel *_titleLabel;
    NSMutableArray *_dataSourceArray;
    NSMutableArray *_dealsArray;//附近团购数组
}
@property(nonatomic, strong)UITableView *merchantDetailTableView;
@end

@implementation SCMerchantDetaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self initNav];
    // Do any additional setup after loading the view.
    [self initData];
    [self loadMerchantDetailData];
    [self getAroundGroupPurchaseData];
    
    [self initView];
}
-(void)initNav{
    
    //    self.title = @"商家详情";
    UIBarButtonItem *leftItem = [UIBarButtonItem initWithNormalImage:@"back" target:self action:@selector(OnBackBtn) width:23 height:23];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}
-(void)OnBackBtn{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void)initView{
    self.merchantDetailTableView = [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64) withDelegate:self];
    [self.view addSubview:self.merchantDetailTableView];
    
}
-(void)initData{
    _dataSourceArray = [[NSMutableArray alloc] init];
    _dealsArray = [[NSMutableArray alloc] init];
}

#pragma mark - 请求商家详情数据
-(void)loadMerchantDetailData{
    NSString *urlStr =  [[GetUrlString sharedManager]urlWithMerchantDetail:self.poiid];
    NSURL *URL = [NSURL URLWithString:urlStr];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *dataArray = [responseObject objectForKey:@"data"];
        if (dataArray.count>0) {
            [_dataSourceArray removeAllObjects];
            SCMerchanDetailModel *merDetailM = [SCMerchanDetailModel mj_objectWithKeyValues:dataArray[0]];
            [_dataSourceArray addObject:merDetailM];
        }
        [self.merchantDetailTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
     
        
    }];
    
}
#pragma mark - 附近团购
-(void)getAroundGroupPurchaseData{
   NSString *urlStr =  [[GetUrlString sharedManager]urlWithMerchantAroundGroupPurchaseData:self.poiid];
    NSURL *URL = [NSURL URLWithString:urlStr];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dataDic = [responseObject objectForKey:@"data"];
        NSMutableArray *dealsArray = [dataDic objectForKey:@"deals"];
        [_dealsArray removeAllObjects];
        for (int i = 0; i < dealsArray.count; i++) {
            SCMerchanArountGroupModel *jfAroundM = [SCMerchanArountGroupModel mj_objectWithKeyValues:dealsArray[i]];
            [_dealsArray addObject:jfAroundM];
        }
        
        [self.merchantDetailTableView reloadData];    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
        
        
    }];
    
}
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_dealsArray.count>0) {
        return 3;
    }
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return _dealsArray.count+1;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 160;
    }else if(indexPath.section == 1){
        return 54;
    }else if (indexPath.section == 2){
        if (indexPath.row>0) {
            return 100;
        }
        return 40;
    }else{
        return 40;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SCMerchantDetailImageCell *cell = [SCMerchantDetailImageCell cellWithTableView:tableView];
        //这个地方务必要做一个异常判断
        if (_dataSourceArray.count >  0 ) {
            cell.merchantDetailModel =  _dataSourceArray[0];
        }
        return  cell;
        
    }else if (indexPath.section ==1){
        SCMerchantDetailAddressCell *cell =[SCMerchantDetailAddressCell cellWithTableView:tableView];
        if (_dataSourceArray.count >  0 ) {
            cell.merchantDetailModel =  _dataSourceArray[0];
        }
        return  cell;
    }else if (indexPath.section == 2 && indexPath.row == 0){
        SCAroundButTitleCell *cell = [SCAroundButTitleCell cellWithTableView:tableView];
        return  cell;
        
    }else{
        SCMerchantAroundGroupCell *cell = [SCMerchantAroundGroupCell cellWithTableView:tableView];
        cell.merchantArountGroupModel = _dealsArray[indexPath.row-1];
        return  cell;
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
