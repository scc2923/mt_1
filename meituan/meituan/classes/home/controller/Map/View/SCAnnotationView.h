//
//  SCAnnotationView.h
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKAnnotation.h>
#import "SCCalloutView.h"
#import "SCAnnotation.h"
@interface SCAnnotationView : BMKAnnotationView
@property (nonatomic, strong)SCCalloutView *calloutView;
@property (nonatomic, strong)SCAnnotation *scannotation;
/**
 *  通过mapView快速创建一个annotationView
 *  构造一个类方法，提供一个mapview参数，和annotation就返回一个标注视图
 */
+(instancetype)annotationViewWithMapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation;
@end
