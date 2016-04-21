//
//  SCMineCell.h
//  meituan
//
//  Created by scc on 16/4/19.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMineModel.h"
@interface SCMineCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView mineModel:(SCMineModel*)mineModel;
@end
