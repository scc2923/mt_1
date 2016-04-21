//
//  SCAnnotationView.m
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCAnnotationView.h"
#import "SCCalloutView.h"
#import "SCAnnotation.h"
#import "SCDataModel.h"

#define kCalloutWidth       200.0
#define kCalloutHeight      70.0

@implementation SCAnnotationView
-(void)setJfannotation:(SCAnnotation *)scannotation{
    _scannotation = scannotation;
}
-(void)setSelected:(BOOL)selected{
    [self setSelected:selected animated:YES];
}
-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    
    if (self.selected == selected) {
        return;
    }
    if (selected) {
        if (self.calloutView == nil) {
            self.calloutView = [[SCCalloutView alloc] initWithFrame:CGRectMake(0, 0, kCalloutWidth, kCalloutHeight)];
            
            self.calloutView.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x,-CGRectGetHeight(self.calloutView.bounds) / 2.f + self.calloutOffset.y);
        }
        NSString *imgUrl = [self.scannotation.scModel.imgurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"104.63"];
        [self.calloutView.imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
        self.calloutView.title = self.annotation.title;
        self.calloutView.subtitle = self.annotation.subtitle;
        
        
        [self addSubview:self.calloutView];
    }else{
        [self.calloutView removeFromSuperview];
    }
    [super setSelected:selected animated:animated];
    
}

//重写此函数,⽤用以实现点击calloutView判断为点击该annotationView
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    BOOL inside = [super pointInside:point withEvent:event];
    if (!inside && self.selected) {
        inside = [self.calloutView pointInside:[self convertPoint:point toView:self.calloutView] withEvent:event];
    }
    return inside;
}
/**
 *  通过mapView快速创建一个annotationView
 */
+(instancetype)annotationViewWithMapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]])
    {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        SCAnnotationView *annotationView = (SCAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[SCAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
        }
        if ([annotation isKindOfClass:[SCAnnotation class]]){
            annotationView.jfannotation = (SCAnnotation *)annotation;
        }
        annotationView.canShowCallout = NO;
        annotationView.image = [UIImage imageNamed:@"icon_map_cateid_1"];
        
        // 设置中⼼心点偏移,使得标注底部中间点成为经纬度对应点
        
        // annotationView.centerOffset = CGPointMake(0, -18);
        return annotationView;
    }
    return nil;
    
    
}

@end
