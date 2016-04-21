//
//  AppDelegate.h
//  meituan
//
//  Created by scc on 16/4/2.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Map.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,BMKMapViewDelegate,BMKGeneralDelegate>{
    BMKMapManager *_mapManager;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;


@end

