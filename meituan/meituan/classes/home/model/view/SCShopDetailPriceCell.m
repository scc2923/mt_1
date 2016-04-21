//
//  SCShopDetailPriceCell.m
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCShopDetailPriceCell.h"

@implementation SCShopDetailPriceCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"SCShopDetailPriceCell";
    SCShopDetailPriceCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SCShopDetailPriceCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setDetailModel:(SCShopDatailDataModel *)detailModel{
    _detailModel = detailModel;
    
    self.nowPriceLabel.text = [NSString stringWithFormat:@"%@元",[detailModel.price stringValue]];
    self.nowPriceLabel.textColor = navigationBarColor;
    
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%.2f元",[detailModel.value doubleValue]] attributes:attribtDic];
    self.oldPriceLabel.attributedText = attribtStr;
    
}
- (IBAction)rushBuyButtonClick:(id)sender {
}
@end
