//
//  SCMapViewController.h
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCMapViewController : UIViewController<BMKLocationServiceDelegate, BMKMapViewDelegate, BMKGeneralDelegate, BMKGeoCodeSearchDelegate>
{
    BMKLocationService *_locService;
    BMKGeoCodeSearch* _geocodesearch;
    BMKPointAnnotation *pointAnnotation;
    BOOL setCenter;
}

@end
