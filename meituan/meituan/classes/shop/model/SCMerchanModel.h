//
//  SCMerchanModel.h
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCMerchanModel : NSObject
@property (nonatomic, strong) NSString *frontImg;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *avgScore;//星星
@property (nonatomic, strong) NSNumber *markNumbers;//评价个数
@property (nonatomic, strong) NSString *cateName;

@property (nonatomic, strong) NSString *areaName;
@property (nonatomic, strong) NSNumber *avgPrice;
@property (nonatomic, strong) NSNumber *brandId;
@property (nonatomic, strong) NSString *poiid;

@end
