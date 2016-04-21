//
//  SCMerchantCell.m
//  meituan
//
//  Created by scc on 16/4/13.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCMerchantCell.h"

@implementation SCMerchantCell
+(instancetype)cellWIthTableView:(UITableView *)tableView
{
    static NSString *ID = @"SCMerchantCell";
    SCMerchantCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SCMerchantCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)setMerchantModel:(SCMerchanModel *)merchantModel{
    _merchantModel = merchantModel;
    NSString *imgUrl = [merchantModel.frontImg stringByReplacingOccurrencesOfString:@"w.h" withString:@"160.0"];
    [self.shopImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
    
    self.shopNameLabel.text = merchantModel.name;
    self.addressLabel.text = [NSString stringWithFormat:@"%@  %@",merchantModel.cateName,merchantModel.areaName];
    
    self.commentNuuberLabel.text = [NSString stringWithFormat:@"%@评价",merchantModel.markNumbers];
    
    double scoreD = [merchantModel.avgScore doubleValue];
    int scoreI = ceil(scoreD);
    
    //把五个星星看作一个整体，通过一个for循环创建。在这里创建不好业务不分明
    for (int i = 0; i < 5; i++) {
        UIImageView *starImg = [[UIImageView alloc] initWithFrame:CGRectMake(i * 12, 0, 12, 12)];
        starImg.tag = 30+i;
        [starImg setImage:[UIImage imageNamed:@"icon_feedCell_star_empty"]];
        [self.layoutStatview addSubview:starImg];
    }
    
    
    for (int i = 0; i < scoreI; i++) {
        UIImageView *imageview = (UIImageView *)[self.contentView viewWithTag:30+i];
        [imageview setImage:[UIImage imageNamed:@"icon_feedCell_star_full"]];
    }
    
    
}

@end
