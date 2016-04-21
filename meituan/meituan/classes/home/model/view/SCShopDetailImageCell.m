//
//  SCShopDetailImageCell.m
//  meituan
//
//  Created by scc on 16/4/10.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCShopDetailImageCell.h"

@implementation SCShopDetailImageCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"SCShopDetailImageCell";
    SCShopDetailImageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SCShopDetailImageCell" owner:nil options:nil]lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    return cell;
    
}

-(void)setDetailModel:(SCShopDatailDataModel *)detailModel{

    _detailModel = detailModel;
    NSString *imgUrl = [detailModel.imgurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"300.0"];
    [self.shopDetailImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
    self.shopNameLabel.text = detailModel.mname;
    self.introduceLabel.text = detailModel.title;
}
@end
