//
//  SCHomeServiceModel.h
//  meituan
//
//  Created by scc on 16/4/6.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCHomeServiceModel : NSObject
@property(nonatomic, strong) NSString *background;
@property(nonatomic, strong) NSNumber *cateId;
@property(nonatomic, strong) NSString *cateImgUrl;
@property(nonatomic, strong) NSString *cateName;
@property(nonatomic, strong) NSString *clickable;

@property(nonatomic, strong) NSString *jumpType;
@property(nonatomic, strong) NSString *jumpUrl;
@property(nonatomic, strong) NSString *open;
@property(nonatomic, strong) NSString *showType;
@end
