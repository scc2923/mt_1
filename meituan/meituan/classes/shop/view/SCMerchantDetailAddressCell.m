//
//  SCMerchantDetailAddressCell.m
//  meituan
//
//  Created by scc on 16/4/14.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCMerchantDetailAddressCell.h"

@implementation SCMerchantDetailAddressCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"SCMerchantDetailAddressCell";
    SCMerchantDetailAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SCMerchantDetailAddressCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)setMerchantDetailModel:(SCMerchanDetailModel *)merchantDetailModel{
    _merchantDetailModel = merchantDetailModel;
    self.addressLabel.text = merchantDetailModel.addr;
}

- (IBAction)PhoneBtn:(id)sender {
}
@end
