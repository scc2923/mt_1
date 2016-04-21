//
//  SCShopDetailBackAnyTimeCell.m
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCShopDetailBackAnyTimeCell.h"

@implementation SCShopDetailBackAnyTimeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"SCShopDetailBackAnyTimeCell";
    SCShopDetailBackAnyTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell已售
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SCShopDetailBackAnyTimeCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setDetailModel:(SCShopDatailDataModel *)detailModel{
    _detailModel = detailModel;
    
    self.backAnyTimeNumberLabel.text = [NSString stringWithFormat:@"已售%@",[detailModel.solds stringValue]];
}
- (IBAction)backAnyTimeButtonClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(shopDetailBackAnyTimeButtonClick:)]) {
        [self.delegate shopDetailBackAnyTimeButtonClick:sender];
    }
}
@end
