//
//  SCKindFilterCell.h
//  meituan
//
//  Created by scc on 16/4/13.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMerchantCataGroupModel.h"
@interface SCKindFilterCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView ;


@property (nonatomic, strong)SCMerchantCataGroupModel *merchantCataGroupModel;
@end
