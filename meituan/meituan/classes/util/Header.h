//
//  Header.h
//  ping
//
//  Created by scc on 16/3/29.
//  Copyright © 2016年 scc. All rights reserved.
//

#ifndef Header_h
#define Header_h
#define kHotChannel (@"http://api.meituan.com/api/entry?uuid=46C2FA9048E45B0BCF020D803182E18377FB3DF0C7CE52D884A4E76E8C191711&name=hotcate&utm_term=6.6&utm_source=AppStore&latlng=31.384841%2C121.339907&utm_content=46C2FA9048E45B0BCF020D803182E18377FB3DF0C7CE52D884A4E76E8C191711&userid=320783109&utm_medium=iphone&movieBundleVersion=100&version_name=6.6&__skck=3c0cf64e4b039997339ed8fec4cddf05&__skua=742c014157daf17c74c0f5536444a8e6&__skts=1459585698.158592&utm_campaign=AgroupBgroupD200H0&__skno=252F387F-C0A4-494D-9F4C-95B332CA8E2F&__skcy=x1HXdmYEO%2BX7vgx05Um3AHTRHUc%3D&ci=10&__vhost=aop.meituan.com&msid=F3083BF6-7E8F-4178-8880-DFA448B5B4E32016-04-02-16-12954") //热门频道
#define kSecUrl (@"http://api.meituan.com/api/entry?uuid=46C2FA9048E45B0BCF020D803182E18377FB3DF0C7CE52D884A4E76E8C191711&name=brandarea&utm_term=6.6&utm_source=AppStore&latlng=31.384841%2C%20121.339907&utm_content=46C2FA9048E45B0BCF020D803182E18377FB3DF0C7CE52D884A4E76E8C191711&userid=320783109&utm_medium=iphone&movieBundleVersion=100&version_name=6.6&__skck=3c0cf64e4b039997339ed8fec4cddf05&__skua=742c014157daf17c74c0f5536444a8e6&__skts=1459585698.147946&utm_campaign=AgroupBgroupD200H0&__skno=25D4A943-F2C9-469B-8DF6-9A5E06F4DAC0&__skcy=ERlvWuTJ3RdGpwL7GEV%2BscYEKuE%3D&ci=10&__vhost=aop.meituan.com&msid=F3083BF6-7E8F-4178-8880-DFA448B5B4E32016-04-02-16-12954")//名店抢购,天天特价。。。
#define kHotUrl (@"http://api.meituan.com/group/v1/deal/topic/discount/city/10?uuid=46C2FA9048E45B0BCF020D803182E18377FB3DF0C7CE52D884A4E76E8C191711&msid=F3083BF6-7E8F-4178-8880-DFA448B5B4E32016-04-02-16-12954&utm_term=6.6&utm_source=AppStore&latlng=31.384841%2C121.339907&utm_content=46C2FA9048E45B0BCF020D803182E18377FB3DF0C7CE52D884A4E76E8C191711&userid=320783109&utm_medium=iphone&movieBundleVersion=100&version_name=6.6&__skck=3c0cf64e4b039997339ed8fec4cddf05&__skua=742c014157daf17c74c0f5536444a8e6&__skts=1459585700.280429&utm_campaign=AgroupBgroupD200H0&__skno=E8937D78-3F74-4E0D-B8F4-77C484DFA165&__skcy=rvXPPkbQpz3kCA5jft2lAx%2B1oo0%3D&ci=10&__vhost=api.mobile.meituan.com&client=iphone")//5折起美食畅吃
#define kYouLike (@"http://api.meituan.com/group/v2/recommend/homepage/city/10?userId=320783109&userid=320783109&__vhost=api.mobile.meituan.com&position=31.384768%2C121.339975&movieBundleVersion=100&utm_term=6.6&limit=40&wifi-mac=cc%3Ab2%3A55%3A60%3A96%3Ae2&ci=10&__skcy=TrE9pX%2B%2BAjukfR7hd%2BqsFbK%2BHes%3D&__skua=742c014157daf17c74c0f5536444a8e6&__skts=1459587787.048279&wifi-name=dlink&client=iphone&uuid=46C2FA9048E45B0BCF020D803182E18377FB3DF0C7CE52D884A4E76E8C191711&__skno=179AEC01-5209-4EBE-B2E8-5020DCBD696C&utm_content=46C2FA9048E45B0BCF020D803182E18377FB3DF0C7CE52D884A4E76E8C191711&utm_source=AppStore&utm_medium=iphone&version_name=6.6&wifi-cur=0&wifi-strength=&offset=0&utm_campaign=AgroupBgroupD200H0&__skck=3c0cf64e4b039997339ed8fec4cddf05&msid=F3083BF6-7E8F-4178-8880-DFA448B5B4E32016-04-02-16-12954")
#define kSHopA (@"http://api.meituan.com/group/v1/poi/select/cate/-1?__skck=3c0cf64e4b039997339ed8fec4cddf05&userid=320783109&__vhost=api.mobile.meituan.com&movieBundleVersion=100&__skua=742c014157daf17c74c0f5536444a8e6&utm_term=6.6&limit=20&ci=10&__skcy=e4SD2rHcl3ylZXlOMtCpOU%2BDBBw%3D&__skts=1459588018.355988&sort=smart&__skno=5872BE6A-3B28-44DE-88B5-3800C9E92FCA&client=iphone&uuid=46C2FA9048E45B0BCF020D803182E18377FB3DF0C7CE52D884A4E76E8C191711&areaId=-1&utm_content=46C2FA9048E45B0BCF020D803182E18377FB3DF0C7CE52D884A4E76E8C191711&utm_source=AppStore&utm_medium=iphone&mypos=31.384782%2C121.339794&version_name=6.6&cityId=10&offset=0&coupon=all&utm_campaign=AgroupBgroupD200GmerchantH0&channelId=3&msid=F3083BF6-7E8F-4178-8880-DFA448B5B4E32016-04-02-16-12954")//全部商家
#define kSHopB (@"http://api.meituan.com/group/v1/poi/select/cate/-1?__skck=3c0cf64e4b039997339ed8fec4cddf05&userid=320783109&__vhost=api.mobile.meituan.com&movieBundleVersion=100&__skua=742c014157daf17c74c0f5536444a8e6&utm_term=6.6&limit=20&ci=10&__skcy=7%2FubVLLJEzxdhMSTAG%2BfVd7s6xQ%3D&__skts=1459588129.912501&sort=smart&__skno=18A9BBF7-E603-41E2-9D48-5F1009CF0BFB&client=iphone&uuid=46C2FA9048E45B0BCF020D803182E18377FB3DF0C7CE52D884A4E76E8C191711&areaId=-1&utm_content=46C2FA9048E45B0BCF020D803182E18377FB3DF0C7CE52D884A4E76E8C191711&utm_source=AppStore&utm_medium=iphone&mypos=31.384782%2C121.339794&version_name=6.6&cityId=10&offset=0&coupon=hasgroup%7Cchoosesitting&utm_campaign=AgroupBgroupD200GmerchantH0&channelId=3&msid=F3083BF6-7E8F-4178-8880-DFA448B5B4E32016-04-02-16-12954")//优惠商家

//设备的宽高
#define SCREENHEIGHT      [UIScreen mainScreen].bounds.size.height
#define SCREENWIDTH       [UIScreen mainScreen].bounds.size.width
//获取颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)
#define navigationBarColor RGB(33, 192, 174)
#define separaterColor RGB(200, 199, 204)

//字体
#define kFONT16                  [UIFont systemFontOfSize:16.0f]
#define kFONT15                  [UIFont systemFontOfSize:15.0f]
#define kFONT12                  [UIFont systemFontOfSize:12.0f]
#define kFONT10                  [UIFont systemFontOfSize:10.0f]





//经纬度   这里经纬度写死的，真是开发中应该根据定位出来获取到的
#define LATITUDE_DEFAULT 39.983497
#define LONGITUDE_DEFAULT 116.318042

//系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//搜索文件
#define JFSearchHistoryPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"hisDatas.data"]

#import "UIBarButtonItem+JFBarButtonItem.h"
#import "UITableView+JFTableView.h"
#import "UIImageView+WebCache.h"
#import "SCBaseViewController.h"
#import "GetUrlString.h"
#import "NetWork.h"
#import "MJRefreshComponent.h"
#import "MJRefreshHeader.h"
#import "MJRefreshAutoStateFooter.h"
#import "MJRefreshFooter.h"
#import "MJRefreshGifHeader.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "GetPlistArray.h"
#import "UIImageView+CreatCode.h"


#endif /* Header_h */
