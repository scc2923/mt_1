//
//  SCMapViewController.m
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCMapViewController.h"
#import "SCDataModel.h"
#import "SCAnnotation.h"
#import "SCAnnotationView.h"
#import "SCCalloutView.h"
@interface SCMapViewController (){
    NSMutableArray *_annotations;//存放标注的经纬度
}
@property (nonatomic ,strong)BMKMapView *mapView;

@end
@implementation SCMapViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMapView];
    [self initNav];
    [self initData];
}
-(void)viewWillAppear:(BOOL)animated
{
//    [super viewWillAppear:YES];
    [self.mapView viewWillAppear];
    self.mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    _geocodesearch.delegate = self;
    
}

-(void)viewWillDisappear:(BOOL)animated
{
//    [super viewWillDisappear:YES];
    [self.mapView viewWillDisappear];
    self.mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    _geocodesearch.delegate = nil;
    
}

#pragma mark - 初始化地图标注数据
-(void)initData{
    _annotations = [NSMutableArray array];
    NSString *urlStr =  [[GetUrlString sharedManager]urlWithMapData];
    NSURL *URL = [NSURL URLWithString:urlStr];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *dataArray = [responseObject objectForKey:@"data"];
        
//        NSLog(@"+++%@", dataArray);
        
        for (int i = 0; i < dataArray.count; i++) {
            SCDataModel  *jfdatamodel = [SCDataModel mj_objectWithKeyValues:dataArray[i]];
            //创建annotation
            
            
            SCAnnotation *annotation = [[SCAnnotation alloc] init];
            
            annotation.scModel = jfdatamodel;
            annotation.title = jfdatamodel.mname;
            annotation.subtitle = [NSString stringWithFormat:@"%@元",jfdatamodel.price];
            if (jfdatamodel.rdplocs.count>0) {
                NSDictionary *dic = jfdatamodel.rdplocs[0];
                NSNumber *lat = [dic objectForKey:@"lat"];
                NSNumber *lng = [dic objectForKey:@"lng"];
                annotation.coordinate = CLLocationCoordinate2DMake([lat doubleValue], [lng doubleValue]);
            }
            [_annotations addObject:annotation];
            
        }
        [self performSelectorOnMainThread:@selector(updateUI)withObject:_annotations waitUntilDone:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
}

-(void)updateUI{
    for (int i = 0; i < _annotations.count; i++) {
        [_mapView addAnnotation:_annotations[i]];
    }
    
}
#pragma mark - 初始化地图
-(void)initMapView{
    self.mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [self.view addSubview:self.mapView];
    
    _locService = [[BMKLocationService alloc]init];
    _geocodesearch = [[BMKGeoCodeSearch alloc]init];
    _locService.delegate = self;
    _geocodesearch.delegate = self;
    
    setCenter = YES;
    
    //定位
     [self showCurrentLocation];
    
}
#pragma mark - 初始化返回按钮
-(void)initNav{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    backBtn.frame = CGRectMake(15, 20, 30, 30);
    [backBtn addTarget:self action:@selector(OnBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    
    
}
-(void)OnBackBtn:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark -开始定位
-(void)showCurrentLocation
{
    NSLog(@"进入普通定位态");
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;
    _mapView.showsUserLocation = YES;//显示定位图层
    
}

#pragma mark - mapview delegate

/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
-(void)willStartLocatingUser
{
    NSLog(@"start locate");
   
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
    [_locService stopUserLocationService];
    _mapView.showsUserLocation = NO;
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [_mapView updateLocationData:userLocation];
    
     [_mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
}



#pragma mark -根据anntation生成对应的View
- (BMKAnnotationView *)mapView:(BMKMapView *)view viewForAnnotation:(id <BMKAnnotation>)annotation
{
    
    SCAnnotationView *annotationView =  [SCAnnotationView annotationViewWithMapView:view viewForAnnotation:annotation];
    return annotationView;
    
}

- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view{
    
    
}


-(void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    if (setCenter == YES) {
        [_mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    }setCenter = NO;
    
}

- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}
@end
