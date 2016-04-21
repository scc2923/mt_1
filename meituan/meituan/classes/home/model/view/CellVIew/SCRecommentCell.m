//
//  SCRecommentCell.m
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCRecommentCell.h"

@implementation SCRecommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"SCRecommentCell";
    SCRecommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SCRecommentCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(void)setRecommentModel:(SCRecommentModel *)recommentModel{
    _recommentModel = recommentModel;
    //    NSURL *urlStr  = [NSURL URLWithString:recommentModel.squareimgurl];
    NSString *imageUrl = [recommentModel.squareimgurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"160.0"];
    [self.shopImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
    self.shopNameLabel.text = recommentModel.mname;
    self.shopIntroduceLabel.text = [NSString stringWithFormat:@"[%@]%@",recommentModel.range,recommentModel.title];
    
    self.priceLabel.text = [NSString stringWithFormat:@"%ld元", (long)recommentModel.price.integerValue ];
    self.priceLabel.textColor = navigationBarColor;
}

@end
