//
//  SCMoreCell.h
//  meituan
//
//  Created by scc on 16/4/19.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCMoreCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath moreArray:(NSArray *)moreArray;
@end
