//
//  SCHotQueueModel.h
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCHotQueueModel : NSObject
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *imageUrl ;
@property(nonatomic, strong) NSNumber *within;
@property(nonatomic, strong) NSString *comment;
@property(nonatomic, strong) NSString *serviceUrl;
@end
