//
//  ShopViewControll.m
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "ShopViewController.h"
#import "SCMerchanModel.h"
#import "SCMerchantCell.h"

#import "SCMerchantHeadView.h"
#import "SCMerchantFilterView.h"
#import "SCmerchanHeaderModel.h"

#import "SCMerchantDetaiViewController.h"
#import "SCMapViewController.h"
#import "SCSearchHistoryViewController.h"

#import "SCMultipleButtonView.h"
#import "ScanCodeViewController.h"
@interface ShopViewController()<SCMultipleButtonViewDelegate,UITableViewDelegate,UITableViewDataSource,SCMerchantHeadViewRefreshDelegate,UIGestureRecognizerDelegate,SCMerchantFilterViewDelegate,SCMerchantHeadViewRefreshDelegate,SCMultipleButtonViewDelegate>
{
    NSMutableArray *_MerchantArray;
    NSInteger _KindID;//分类查询ID，默认-1
    
    NSInteger _offset;
    UIView *_maskView;
    
    SCmerchanHeaderModel *headerModel;
    
    
    UISegmentedControl *_seg;
    UIScrollView * _scrollView;
}
@property (nonatomic ,strong)UITableView *merchantTableView;
@property (nonatomic ,strong)UITableView *rightTableView;
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)SCMerchantHeadView *headView;
@end

@implementation ShopViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    //2.初始化字典
    [self initData];
    //3.初始化tableView和自定义的视图
    [self initView];
    //4.设置刷新
    [self setRefreshTableView];
    [self initMaskView];
    //1.获取商家数据
    [self loadMerchantData];
    //获取当前的地址
    [self loadPresentLocationResult];
    
    [self initNav];
    
    
    //    [self createRightTableView];
    //    [self creatSegmentView];
    //    [self createScrollView];
}
-(void)createScrollView{
    _scrollView=[[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    _scrollView.contentSize=CGSizeMake(self.view.frame.size.width*2, self.view.frame.size.height);
    
    _scrollView.pagingEnabled=YES;
    
    _scrollView.bounces=NO;
    
    _scrollView.showsHorizontalScrollIndicator=NO;
    
    _scrollView.showsVerticalScrollIndicator=NO;
    
    _scrollView.delegate=self;
    
    [self.view addSubview:_scrollView];
}
-(void)creatSegmentView
{
    _seg=[[UISegmentedControl alloc]initWithItems:@[@"全部商家",@"优惠商家"]];
    
    _seg.frame=CGRectMake((self.view.frame.size.width-100)/2, 10, 100, 25);
    [_seg addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    _seg.selectedSegmentIndex=0;
    
    [self.navigationController.navigationBar addSubview:_seg];
    UIBarButtonItem *rightItem = [UIBarButtonItem initWithNormalImage:@"icon_homepage_search" target:self action:@selector(searchBtnClick) width:24 height:24];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    UIBarButtonItem *leftItem = [UIBarButtonItem initWithNormalImage:@"icon_homepage_map_old" target:self action:@selector(mapBtnClick) width:50 height:35];
    self.navigationItem.leftBarButtonItem = leftItem;
}

-(void)segmentValueChanged:(UISegmentedControl *)segment
{
    if (segment.selectedSegmentIndex==0) {
        _scrollView.contentOffset=CGPointMake(self.view.frame.size.width, 0);
        
        [self initView];
        
    }
    
    if(segment.selectedSegmentIndex==1)
    {
        _scrollView.contentOffset=CGPointMake(self.view.frame.size.width, 0);
        
        self.view.backgroundColor = [UIColor orangeColor];
        
    }else
    {
        _scrollView.contentOffset=CGPointMake(0, 0);
        
    }
}

-(void)createRightTableView{
    self.rightTableView = [UITableView initWithTableView:CGRectMake([UIScreen mainScreen].bounds.size.width, 64, SCREENWIDTH, SCREENHEIGHT-64) withDelegate:self];
    _rightTableView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_rightTableView];
    
}
#pragma mark - 初始化导航栏
-(void)initNav{
    NSArray  *array = @[@"全部商家",@"优惠商家"];
    
    //这个地方用UIView来接收也不会报错的，因为JFMultipleButtonView继承于UIView但是没有代理方法
    SCMultipleButtonView *buttonView = [[SCMultipleButtonView alloc]initWithFrame:CGRectMake(0, 0, 160, 40) titleArray:array];
    buttonView.delegate = self;
    self.navigationItem.titleView = buttonView;
    
    UIBarButtonItem *rightItem = [UIBarButtonItem initWithNormalImage:@"icon_homepage_search" target:self action:@selector(searchBtnClick) width:24 height:24];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    UIBarButtonItem *leftItem = [UIBarButtonItem initWithNormalImage:@"icon_homepage_map_old" target:self action:@selector(mapBtnClick) width:50 height:35];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}
-(void)searchBtnClick{
    SCSearchHistoryViewController *searchHistoryVC = [[SCSearchHistoryViewController alloc]init];
    [self.navigationController pushViewController:searchHistoryVC animated:YES];
}
-(void)mapBtnClick{
    SCMapViewController *mapVC = [[SCMapViewController alloc]init];
    [self presentViewController:mapVC animated:YES completion:^{
        
    }];
    
}

#pragma mark    -初始化字典
-(void)initData{
    _offset = 0;
    _KindID = -1;//默认-1
    _MerchantArray = [NSMutableArray array];
    
}
#pragma mark - 初始化tableView
-(void)initView{
    //筛选
    UIView *filterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 40)];
    filterView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:filterView];
    
    NSArray *filterName = @[@"全部分类",@"全城",@"智能排序"];
    //筛选
    for (int i = 0; i < 3; i++) {
        //文字
        UIButton *filterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        filterBtn.frame = CGRectMake(i*SCREENWIDTH/3, 0, SCREENWIDTH/3-15, 40);
        filterBtn.tag = 100+i;
        filterBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [filterBtn setTitle:filterName[i] forState:UIControlStateNormal];
        [filterBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [filterBtn setTitleColor:navigationBarColor forState:UIControlStateSelected];
        [filterBtn addTarget:self action:@selector(OnFilterBtn:) forControlEvents:UIControlEventTouchUpInside];
        [filterView addSubview:filterBtn];
        
        //三角
        UIButton *triangleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        triangleBtn.frame = CGRectMake((i+1)*SCREENWIDTH/3-15, 16, 8, 7);
        triangleBtn.tag = 120+i;
        [triangleBtn setImage:[UIImage imageNamed:@"icon_arrow_dropdown_normal"] forState:UIControlStateNormal];
        [triangleBtn setImage:[UIImage imageNamed:@"icon_arrow_dropdown_selected"] forState:UIControlStateSelected];
        [filterView addSubview:triangleBtn];
    }
    //下划线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, SCREENWIDTH, 0.5)];
    lineView.backgroundColor = RGB(192, 192, 192);
    [filterView addSubview:lineView];
    
    self.merchantTableView = [UITableView initWithTableView:CGRectMake(0, 40, SCREENWIDTH, SCREENHEIGHT-64) withDelegate:self];
    
    [self.view addSubview:self.merchantTableView];//内容
    
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    self.imageView.image = [UIImage imageNamed:@"Default"];
    self.imageView.hidden = YES;
    [self.view addSubview:self.imageView];
    
}
#pragma mark - 设置刷新
-(void)setRefreshTableView{
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadMerchantData)];
    //设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=60; ++i) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd",i]];
        [idleImages addObject:image];
    }
    [header setImages:idleImages forState:MJRefreshStateIdle];
    self.merchantTableView.mj_header = header;
    
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
    
    //上拉刷新
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 设置刷新图片
    [footer setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    // 设置尾部
    self.merchantTableView.mj_footer = footer;
    
}
#pragma mark - 加载更多
-(void)loadMoreData{
    _offset = _offset + 20;
    [self loadMerchantData];
}
#pragma mark - 初始化遮罩层视图 后续封装起来。
-(void)initMaskView{
    _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, SCREENWIDTH, SCREENHEIGHT-150)];
    _maskView.backgroundColor = RGBA(0, 0, 0, 0.5);
    [self.view addSubview:_maskView];
    _maskView.hidden = YES;
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapMaskView:)];
    tap.delegate = self;
    [_maskView addGestureRecognizer:tap];
    
    SCMerchantFilterView *filterView =  [[SCMerchantFilterView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT- 250)];
    filterView.delegate = self;
    [_maskView addSubview:filterView];
    
}

-(void)OnFilterBtn:(UIButton *)sender{
    //    NSLog(@"%ld", sender.tag);
    for (int i = 0; i < 3; i++) {
        UIButton *menubtn = (UIButton *)[self.view viewWithTag:100+i];
        UIButton *arrowBtn = (UIButton *)[self.view viewWithTag:120+i];
        menubtn.selected = NO;
        arrowBtn.selected = NO;
    }
    sender.selected = YES;
    UIButton *sjBtn = (UIButton *)[self.view viewWithTag:sender.tag+20];
    sjBtn.selected = YES;
    _maskView.hidden = NO;
    
}
-(void)OnTapMaskView:(UITapGestureRecognizer *)sender{
    _maskView.hidden = YES;
}

#pragma mark - 请求所有商家数据
-(void)loadMerchantData{
    
    NSString *urlStr = [[GetUrlString sharedManager]urlWithMerchantStr:(NSInteger*)_KindID offset:(NSInteger*)_offset];
    [NetWork sendGetByReplacingUrl:urlStr withParams:nil progress:^(NSProgress *downloadProgress) {
        
    } success:^(id responseObject) {
        NSMutableArray * dictArray =  responseObject [@"data"];
        
        //这个地方 如果不先判断后把模型数组里面的全部删除掉，更新时原来的数据不移除。其实是有更新但是在原来数组的最下面。
        
        if (_offset == 0) {
            [_MerchantArray removeAllObjects];
        }
        for (int i = 0; i < dictArray.count ; i ++) {
            SCMerchanModel *merchantModel = [SCMerchanModel mj_objectWithKeyValues:dictArray[i]];
            [_MerchantArray addObject:merchantModel];
        }
        //        if (_offset == 0 && dictArray.count!=0) {
        //            [self.merchantTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        //        }
        [self.merchantTableView reloadData];
        [self.merchantTableView.mj_header endRefreshing];
        [self.merchantTableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        NSLog(@"error:%@",error);
        [self.merchantTableView.mj_header endRefreshing];
        [self.merchantTableView.mj_footer endRefreshing];
    }];
}

#pragma mark - 请求当前的地理位置
-(void)loadPresentLocationResult{
    NSString *urlStr = [[GetUrlString sharedManager]urlWithAddress];
    [NetWork sendGetUrl:urlStr withParams:nil progress:^(NSProgress *downloadProgress) {
        
    } success:^(id responseObject) {
        NSDictionary *dict= responseObject[@"data"];
        headerModel = [SCmerchanHeaderModel headerModel:dict];
    } failure:^(NSError *error) {
        NSLog(@"error:%@",error);
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat
{
    return  92;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _MerchantArray.count;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SCMerchantHeadView *headView = [SCMerchantHeadView headViewWithTableView:tableView];
    self.headView = headView;
    headView.delegate = self;
    headView.headModel = headerModel;
    return headView;
    
}
//注意这个方法给headView提供高度，不写的话不走上面的方法。不信你试一试。
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 32;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == _merchantTableView) {
        SCMerchantCell *cell = [SCMerchantCell cellWIthTableView:tableView];
        cell.merchantModel = _MerchantArray [indexPath.row];
        return cell;
    }
    return nil;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SCMerchantDetaiViewController *merchantDetailVC = [[SCMerchantDetaiViewController alloc]init];
    SCMerchanModel *merchantModel = _MerchantArray[indexPath.row];
    merchantDetailVC.poiid = merchantModel.poiid;
    [self.navigationController pushViewController:merchantDetailVC animated:YES];
    
}
/**
 *  手势的代理方法
 *
 *  @param gestureRecognizer 单击手势
 *  @param touch             通过touch.view来识别那个视图被点击
 *
 *  @return 返回YES执行，返回NO 不执行
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isKindOfClass:[UITableView class]]) {
        return NO;
    }
    if ([touch.view.superview isKindOfClass:[UITableView class]]) {
        return NO;
    }
    if ([touch.view.superview.superview isKindOfClass:[UITableView class]]) {
        return NO;
    }
    if ([touch.view.superview.superview.superview isKindOfClass:[UITableView class]]) {
        //        NSLog(@"d");
        return NO;
    }
    return YES;
    
}
# pragma mark -SCMerchantFilterView代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath withId:(NSNumber *)ID {
    _KindID = [ID integerValue];
    _maskView.hidden = YES;
    [self loadMerchantData];
}
#pragma mark -SCMultipleButtonViewDelegate
-(void)multipleButtonViewClickAtIndex:(long)index{
    if (index == 0) {
        self.imageView.hidden = YES;
    }else{
        self.imageView.hidden = NO;
        //2.初始化字典
        [self initData];
        //3.初始化tableView和自定义的视图
        [self initView];
        //4.设置刷新
        [self setRefreshTableView];
        [self initMaskView];
        //1.获取商家数据
        [self loadMerchantData];
        //获取当前的地址
        [self loadPresentLocationResult];
        
        
    }
}


#pragma mark - SCMerchantHeadViewRefreshDelegate
-(void)merchantHeadViewRefreshButtonClick{
    
    self.headView.currentAddressLabel.text = @"当前位置:上海";
}

@end
