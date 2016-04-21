//
//  SCHomeMenuCell.h
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol  SCHomeMenuCellDelegate <NSObject>
@optional
-(void)homeMenuCellClick:(long)sender;

@end
@interface SCHomeMenuCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView menuArray:(NSArray *)menuArray;
@property(nonatomic,weak)id<SCHomeMenuCellDelegate>delegate;
@end
