//
//  SCRushDealsModel.h
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface SCRushDealsModel : JSONModel
@property(nonatomic, strong) NSNumber <Optional>*dt;
@property(nonatomic, strong) NSString <Optional>*brandname;
@property(nonatomic, strong) NSString<Optional> *cate;
@property(nonatomic, strong) NSString <Optional>*range;
@property(nonatomic, strong) NSString <Optional>*mealcount;

@property(nonatomic, strong) NSNumber<Optional> *status;
@property(nonatomic, strong) NSString<Optional> *mtitle;
@property(nonatomic, strong) NSString <Optional>*mdcLogoUrl;
@property(nonatomic, strong) NSString <Optional>*smstitle;
@property(nonatomic, strong) NSMutableArray<Optional> *campaigns;

@property(nonatomic, strong) NSString <Optional>*squareimgurl;
@property(nonatomic, strong) NSNumber<Optional> *ctype;
@property(nonatomic, strong) NSString <Optional>*mlls;
@property(nonatomic, strong) NSString <Optional>*subcate;
@property(nonatomic, strong) NSNumber <Optional>*id;

@property(nonatomic, strong) NSMutableArray <Optional>*attrJson;
@property(nonatomic, strong) NSString<Optional> *title;
@property(nonatomic, strong) NSNumber<Optional> *price;
@property(nonatomic, strong) NSNumber <Optional>*festcanuse;
@property(nonatomic, strong) NSNumber <Optional>*value;

@property(nonatomic, strong) NSString <Optional>*coupontitle;
//没处理
//@property(nonatomic, strong) NSNumber *rate-count;
@property(nonatomic, strong) NSNumber <Optional>*rating;
@property(nonatomic, strong) NSString <Optional>*cateDesc;
@property(nonatomic, strong) NSNumber <Optional>*nobooking;

@property(nonatomic, strong) NSNumber <Optional>*campaignprice;
@property(nonatomic, strong) NSString <Optional>*imgurl;
@end
