//
//  SCMerchantDetailAddressCell.h
//  meituan
//
//  Created by scc on 16/4/14.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMerchanDetailModel.h"
@interface SCMerchantDetailAddressCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
- (IBAction)PhoneBtn:(id)sender;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic, strong)SCMerchanDetailModel *merchantDetailModel;
@end
