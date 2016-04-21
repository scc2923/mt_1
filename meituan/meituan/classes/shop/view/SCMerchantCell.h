//
//  SCMerchantCell.h
//  meituan
//
//  Created by scc on 16/4/13.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMerchanModel.h"
@interface SCMerchantCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *layoutStatview;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentNuuberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;

+(instancetype)cellWIthTableView:(UITableView *)tableView;
@property(nonatomic,strong)SCMerchanModel *merchantModel;
@end
