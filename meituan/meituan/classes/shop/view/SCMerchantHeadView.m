//
//  SCMerchantHeadView.m
//  meituan
//
//  Created by scc on 16/4/13.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCMerchantHeadView.h"

@implementation SCMerchantHeadView

+ (instancetype)headViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFMerchantHeadView";
    SCMerchantHeadView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"SCMerchantHeadView" owner:nil options:nil] lastObject];
    }
    headView.backgroundColor = RGB(192, 192, 192);
    return headView;
}

-(void)setHeadModel:(SCmerchanHeaderModel *)headModel{
    _headModel = headModel;
    self.currentAddressLabel.text = [NSString stringWithFormat:@"当前位置:%@,%@",headModel.province,headModel.detail];
}


- (IBAction)refreshAddressBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(merchantHeadViewRefreshButtonClick)]) {
        [self.delegate merchantHeadViewRefreshButtonClick];
    }
}
@end
