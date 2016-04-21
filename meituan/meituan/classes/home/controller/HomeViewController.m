//
//  HomeViewController.m
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "HomeViewController.h"

#import "JFSelectAddressView.h"
#import "JFAddressScrollView.h"
#import "SCAllCityNameViewController.h"

#import "SCHomeMenuCell.h"
#import "SCRushBuyCell.h"
#import "SCDiscountCell.h"

#import "SCHotQueueCell.h"
#import "SCGuessCell.h"
#import "SCRecommentCell.h"

#import "SCMenuViewController.h"
#import "SCRushDataModel.h"
#import "SCRushDealsModel.h"

#import "SCRushBuyWebViewController.h"
#import "SCDiscountWebViewViewController.h"
#import "SCDiscountModel.h"

#import "SCHotQueueViewController.h"
#import "SCShopDetailViewController.h"
#import "SCMapViewController.h"

#import "ScanCodeViewController.h"
#import "ResultViewController.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,JFSelectAddressViewTapDelegate,JFAddressScrollViewButtonDelegate,JFChangeCityButtonDelegate,SCHomeMenuCellDelegate,SCRushBuyCellDelegate,SCDiscountCellDelegate>
@property(nonatomic, strong)UITableView *firstTableView;
@property (nonatomic, strong)NSArray *menuArray;
@property (nonatomic, strong)UIButton *leftButton;
@property (nonatomic, strong)JFSelectAddressView *selectAddressView ;
@end

@implementation HomeViewController
{
    NSMutableArray *_rushArray;
    NSMutableArray *_discountArray;
    SCHotQueueModel *_hotQueueModel;
    NSMutableArray *_recommentArray;
    SCRushDataModel *model;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建tableView
    [self setUpTableView];
    
    //添加遮罩层的时候要放在当前最上面View所以初始化的时候要注意一下(简单的东西搞了好久,这就是没有总结的原因)
    [self setupNav];
    
    //下啦刷新
    [self setRefreshIntableView];
    //初始化数组
    [self initData];
    //加在城市数据
    [self laodCityData];

}
-(void)initData{
    //注意一定要给数组初始化，养成习惯少走弯路。
    self.menuArray =  [GetPlistArray arrayWithString:@"menuData.plist"];
//    NSLog(@"-----%ld",self.menuArray.count);
    _rushArray  = [NSMutableArray array];
    _discountArray = [NSMutableArray array];
    _recommentArray = [NSMutableArray array];
    
}

-(void)laodCityData{
    NSArray *array =  [NSArray arrayWithContentsOfFile:@"citydata.plist"];
//        NSLog(@"-----%@", array);
}

#pragma mark - 设置导航条
-(void)setupNav{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton = leftBtn;
    leftBtn.frame = CGRectMake(0, 0, 40, 35);
    [leftBtn setImage:[UIImage imageNamed:@"icon_homepage_upArrow"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"icon_homepage_downArrow"] forState:UIControlStateSelected];
    //先设置按钮里面的内容居中
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //设置文字居左 －>向左移35
    [leftBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -35, 0, 0)];
    //设置文字居左 －>向右移30
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    [leftBtn setTitle:@"上海" forState:UIControlStateNormal];
    leftBtn.titleLabel.font = kFONT12;
    [leftBtn addTarget:self action:@selector(btn_leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    
    UIButton *MapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    MapBtn.frame = CGRectMake(0, 0, 50, 35);
    [MapBtn setImage:[UIImage imageNamed:@"icon_homepage_map_old"] forState:UIControlStateNormal];
    [MapBtn addTarget:self action:@selector(mapBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:MapBtn];
    
    UIButton *SaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    SaoBtn.frame = CGRectMake(0, 0, 50, 35);
    [SaoBtn setImage:[UIImage imageNamed:@"icon_homepage_map_old"] forState:UIControlStateNormal];
    [SaoBtn addTarget:self action:@selector(saoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barSearchBtn=[[UIBarButtonItem alloc]initWithCustomView:MapBtn];
    UIBarButtonItem *barTimeBtn=[[UIBarButtonItem alloc]initWithCustomView:SaoBtn];

    NSArray *rightBtns=[NSArray arrayWithObjects:barSearchBtn,barTimeBtn, nil];
    self.navigationItem.rightBarButtonItems=rightBtns;

    //长按识别图中的二维码，类似于微信里面的功能,前提是当前页面必须有二维码
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(readCode:)];
    [self.view addGestureRecognizer:longPress];

    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    searchBar.backgroundImage = [UIImage imageNamed:@"icon_homepage_search"];
    searchBar.placeholder = @"优衣库";
    self.navigationItem.titleView = searchBar;
    
    self.selectAddressView =   [[JFSelectAddressView alloc]initWithFrame:CGRectMake(0, 0 ,SCREENWIDTH, SCREENHEIGHT )];
    self.selectAddressView.delegate = self;
    self.selectAddressView.addressScrollView.delegate = self;
    self.selectAddressView.addressScrollView.changeCityDelegate = self;
    
    [self.view addSubview:self.selectAddressView];
    self.selectAddressView.hidden = YES;

    
}
#pragma mark - 设置tableView
-(void)setUpTableView{
    self.firstTableView = [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64) withDelegate:self];
    self.firstTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.firstTableView];
}
#pragma mark - 左边的按钮
-(void)btn_leftBtnClick:(UIButton *)button{
    button.selected = !button.selected;
    self.selectAddressView.hidden =  !self.selectAddressView.hidden ;
}
#pragma mark -JFSelectAddressViewTapDelegate
-(void)removeMaskView{
    self.selectAddressView.hidden =  !self.selectAddressView.hidden ;
    
}
#pragma mark -JFAddressScrollViewButtonDelegate -区点击
-(void)areaButtonClick:(UIButton *)button{
    NSLog(@"%@", button.currentTitle);
    [self.leftButton setTitle:button.currentTitle forState:UIControlStateNormal];
    self.selectAddressView.hidden =  !self.selectAddressView.hidden ;
    
}
#pragma mark -JFChangeCityButtonDelegate
-(void)changeCityButtonClick:(UIButton *)button{
    self.selectAddressView.hidden =  !self.selectAddressView.hidden ;
    
    SCAllCityNameViewController *allCityNameVC = [[SCAllCityNameViewController alloc]init];
    [self.navigationController pushViewController:allCityNameVC animated:YES];
    
}
#pragma  mark - JFRushBuyCellDelegate
-(void)didSelectAtIndexRushBuyCell:(long)index{
//    NSLog(@"%ld", index);
    SCRushBuyWebViewController *rushBuyWebVC = [[SCRushBuyWebViewController alloc]init];
    [self.navigationController pushViewController:rushBuyWebVC animated:YES];
    
}
#pragma mark - JFDiscountCellDelegate
-(void)didSelectAtIndexDiscountCell:(NSString *)urlStr{
    NSString *urlString =  [[GetUrlString sharedManager]urlWithDiscountWebData:urlStr];
    SCDiscountWebViewViewController *disountWebVC = [[SCDiscountWebViewViewController alloc]init];
    disountWebVC.urlStr = urlString;
    [self.navigationController pushViewController:disountWebVC animated:YES];
    
    
}
#pragma mark - JFHomeMenuCellDelegate
-(void)homeMenuCellClick:(long )sender{
    
    SCMenuViewController *menuVC = [[SCMenuViewController alloc]init];
    menuVC.titleStr = self.menuArray [sender -10][@"title"];
    [self.navigationController pushViewController:menuVC animated:YES];
    
}
#pragma mark -右边的按钮
-(void)mapBtnClick{
    SCMapViewController *mapVC = [[SCMapViewController alloc]init];
    [self presentViewController:mapVC animated:YES completion:nil];
}
-(void)saoBtnClick{
    [self.navigationController pushViewController:[ScanCodeViewController new] animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}
- (void)readCode:(UILongPressGestureRecognizer *)pressSender {
    
    if (pressSender.state == UIGestureRecognizerStateBegan) {
        
        
        //截图 再读取
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 0);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        [self.view.layer renderInContext:context];
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        
        
        CIImage *ciImage = [[CIImage alloc] initWithCGImage:image.CGImage options:nil];
        CIContext *ciContext = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer : @(YES)}]; // 软件渲染
        CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:ciContext options:@{CIDetectorAccuracy : CIDetectorAccuracyHigh}];// 二维码识别
        
        
        NSArray *features = [detector featuresInImage:ciImage];
        
        
        for (CIQRCodeFeature *feature in features) {
            
            
            NSLog(@"msg = %@",feature.messageString); // 打印二维码中的信息
            
            //对结果进行处理
            ResultViewController *resultVC = [[ResultViewController alloc] init];
            resultVC.contentString = feature.messageString;
            [self.navigationController pushViewController:resultVC animated:YES];
        }
        
        
    }
    
    
    
}
- (void)backView {
      UIImageView *codeImageView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREENWIDTH - 200)/2, 100, 200, 200)];
    codeImageView.layer.borderColor = [UIColor orangeColor].CGColor;
    codeImageView.layer.borderWidth = 1;
    [self.view addSubview:codeImageView];
    
    
    
    //有图片的时候，也可以不设置圆角
    [codeImageView creatCode:@"https://www.baidu.com" Image:[UIImage imageNamed:@"sun.jpg"] andImageCorner:4];
    
    //没有图片的时候
    //  [codeImageView creatCode:@"这波可以" Image:nil andImageCorner:4];
    
    
    
}

#pragma mark - 设置下啦刷新
-(void)setRefreshIntableView{
MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    //设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=60; ++i) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd",i]];
        [idleImages addObject:image];
    }
    [header setImages:idleImages forState:MJRefreshStateIdle];
    self.firstTableView.mj_header = header;

    //设置即将刷新状态的动画图片
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd",i]];
        [refreshingImages addObject:image];
    }
    [header setImages:refreshingImages forState:MJRefreshStatePulling];
    //设置正在刷新时的动画图片
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    //马上进入刷新状态
    [header beginRefreshing];
}
/**
*  在刷新数据里面请求  并用GCD开辟另一个线程
*/
#pragma mark - 这个请求数据在刷新的时候请求的
-(void)refreshData{
//    NSLog(@"123");
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
        //1.加载抢购数据
        [self laodRushBuyData];
        //2.加载热门排队数据
        [self loadHotQueueData];
        //3.加载推荐数据
        [self loadRecommentData];
        //4.加载折扣数据
        [self loadDiscountData];
        dispatch_async(dispatch_get_main_queue(), ^{
            //这个里面是主线程要做的事  可以刷新UI
        });
    });
}
//1.加载抢购数据
#pragma mark - 加载抢购数据
-(void)laodRushBuyData{
    NSString *urlStr = [[GetUrlString sharedManager]urlWithRushBuy];
    NSURL *URL = [NSURL URLWithString:urlStr];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dataDic = [responseObject objectForKey:@"data"];
        SCRushDataModel *rushDataM = [SCRushDataModel mj_objectWithKeyValues:dataDic];
        [_rushArray removeAllObjects];
        for (int i = 0; i < rushDataM.deals.count; i++) {
            SCRushDealsModel *deals = [SCRushDealsModel mj_objectWithKeyValues:rushDataM.deals[i]];
            [_rushArray addObject:deals];
        }
        [self.firstTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
}
//2.加载热门排队数据
#pragma mark -加载热门排队数据
-(void)loadHotQueueData{
    NSString *urlStr = [[GetUrlString sharedManager]urlWithHotQueue];
    NSURL *URL = [NSURL URLWithString:urlStr];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dataDic = [responseObject objectForKey:@"data"];
        _hotQueueModel = [SCHotQueueModel mj_objectWithKeyValues:dataDic];
        [self.firstTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];

}
//3.加载推荐数据
#pragma mark - 加载推荐数据
-(void)loadRecommentData{
    NSString *urlStr = [[GetUrlString sharedManager]urlWithRecomment];
    NSURL *URL = [NSURL URLWithString:urlStr];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *dictArray = [responseObject objectForKey:@"data"];

        for (int i = 0; i < dictArray.count; i++) {
            SCRecommentModel *recommentModel =  [SCRecommentModel mj_objectWithKeyValues:dictArray[i]];
            [_recommentArray addObject:recommentModel];
        }

        [self.firstTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
}
//4.加载折扣数据
#pragma mark - 加载折扣数据
-(void)loadDiscountData{
    NSString *urlStr = [[GetUrlString sharedManager]urlWithDiscount];
    NSURL *URL = [NSURL URLWithString:urlStr];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *dataDic = [responseObject objectForKey:@"data"];
        [_discountArray removeAllObjects];
        for (int i = 0; i < dataDic.count; i++) {
            SCDiscountModel *discount = [SCDiscountModel mj_objectWithKeyValues:dataDic[i]];
            [_discountArray addObject:discount];
        }
        
        [self.firstTableView reloadData];
        //这个地方要注意把刷新成功后 的刷新控件移除。不然会有一个小条子不隐藏
        [self.firstTableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
}

#pragma mark - tableView的数据源方法，和代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 4) {
        return _recommentArray.count +1;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SCHomeMenuCell *cell = [SCHomeMenuCell cellWithTableView:tableView menuArray:self.menuArray];
        cell.delegate = self;
        return cell;
        
    }else if (indexPath.section == 1){
        //这个地方按照之前的文章里面说的 控制器提供一个tableView就给你cell，控制器不必知道。cell怎么创建的cell最清楚，不必告诉控制器。
        SCRushBuyCell *cell = [SCRushBuyCell cellWithTableView:tableView];
        cell.delegate = self;
        //注意这个地方一定要做异常处理
        if (_rushArray.count!=0) {
            //给cell传递模型
            [cell setRushData:_rushArray];
        }
        
        return cell;
    }else if (indexPath.section == 2){
        SCDiscountCell *cell = [SCDiscountCell cellWithTableView:tableView];
        cell.delegate = self;
        if (_discountArray.count != 0 ) {
            [cell setDiscountArray:_discountArray];
        }
        return cell;
    }else if (indexPath.section == 3){
        SCHotQueueCell *cell = [SCHotQueueCell cellWithTableView:tableView];
        if (_hotQueueModel!= nil ) {
            cell.hotQueueModel = _hotQueueModel;
        }
        return cell;
    }else {
        if (indexPath.row == 0) {
            SCGuessCell *cell = [SCGuessCell cellWithTableView:tableView];
            return cell;
        }
        else{
            SCRecommentCell *cell = [SCRecommentCell cellWithTableView:tableView];
            if (_recommentArray.count!=0) {
                cell.recommentModel = _recommentArray[indexPath.row - 1];
                
            }
            return cell;
        }
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 180;
        
    }else if (indexPath.section == 1){
        return 120;
    }else if (indexPath.section == 2){
        return 160;
    }else if (indexPath.section == 3){
        return 50;
    }else if(indexPath.section == 4){
        if (indexPath.row == 0) {
            return 35.0;
        }else{
            return 100.0;
        }
    }else{
        return 70.0;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 5;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENHEIGHT, 10)];
    headerView.backgroundColor = RGB(239, 239, 244);
    return headerView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 0)];
    footerView.backgroundColor = RGB(239, 239, 244);
    return footerView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==3) {
        NSString *urlStr =  [[GetUrlString sharedManager]urlWithHotQueueWebData];
        SCHotQueueViewController *hotQueueVC = [[SCHotQueueViewController alloc]init];
        hotQueueVC.urlStr = urlStr;
        [self.navigationController pushViewController:hotQueueVC animated:YES];
    }else if(indexPath.section ==4){
        if (indexPath.row !=0) {
            SCRecommentModel *recommendModel = _recommentArray[indexPath.row-1];
            
            SCShopDetailViewController *shopDetailVC = [[SCShopDetailViewController alloc]init];
            shopDetailVC.shopID   =[recommendModel.id stringValue];
            [self.navigationController pushViewController:shopDetailVC animated:YES];
            
        }
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
