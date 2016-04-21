//
//  SCKindSubclassFilterCell.h
//  meituan
//
//  Created by scc on 16/4/16.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMerchantCataGroupModel.h"

@interface SCKindSubclassFilterCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath model:(SCMerchantCataGroupModel *)model;
@end
