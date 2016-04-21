//
//  SCCityTitleHeaderVIew.h
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCCityTitleHeaderVIew : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property(nonatomic, copy)NSString *keyStr;
+ (instancetype)headViewWithTableView:(UITableView *)tableView ;
@end
