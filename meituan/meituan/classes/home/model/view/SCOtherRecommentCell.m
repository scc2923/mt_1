//
//  SCOtherRecommentCell.m
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCOtherRecommentCell.h"

@implementation SCOtherRecommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"SCOtherRecommentCell";
    SCOtherRecommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SCOtherRecommentCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
-(void)setShopRecommentModel:(SCShopRecoummentModel *)shopRecommentModel{
    _shopRecommentModel = shopRecommentModel;
    
    NSString *imgUrl = [shopRecommentModel.imgurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"160.0"];
    [self.shopImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
    
    self.productNameLabel.text = shopRecommentModel.brandname;
    self.introduceLabel.text = [NSString stringWithFormat:@"[%@]%@",shopRecommentModel.range,shopRecommentModel.title];
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f元",[shopRecommentModel.price doubleValue]];
    self.priceLabel.textColor = navigationBarColor;
    
}

@end
