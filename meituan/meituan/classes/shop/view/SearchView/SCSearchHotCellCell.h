//
//  SCSearchHotCellCell.h
//  meituan
//
//  Created by scc on 16/4/13.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCSearchHotCellCell : UITableViewCell
@property(nonatomic, strong)NSArray *array;
+ (instancetype)cellWithTableView:(UITableView *)tableView ;
@end
