//
//  SCAnnotation.h
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKPointAnnotation.h>
#import "SCDataModel.h"
@interface SCAnnotation : BMKPointAnnotation
@property (nonatomic, strong) SCDataModel *scModel;
@end
