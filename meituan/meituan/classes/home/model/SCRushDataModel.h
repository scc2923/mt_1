//
//  SCRushDataModel.h
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface SCRushDataModel : NSObject
@property(nonatomic, strong) NSNumber<Optional> *Id;
@property(nonatomic, strong) NSMutableArray<Optional> *share;
@property(nonatomic, strong) NSString<Optional> *title;
@property(nonatomic, strong) NSNumber <Optional>*start;
@property(nonatomic, strong) NSNumber<Optional> *listJumpToTouch;

@property(nonatomic, strong) NSNumber <Optional>*type;
@property(nonatomic, strong) NSString<Optional> *descBefore;
@property(nonatomic, strong) NSMutableArray<Optional> *deals;
@property(nonatomic, strong) NSNumber <Optional>*end;
@property(nonatomic, strong) NSString<Optional> *touchUrlForList;

@property(nonatomic, strong) NSString <Optional>*descIn;
@property(nonatomic, strong) NSString <Optional>*descAfter;

@end
