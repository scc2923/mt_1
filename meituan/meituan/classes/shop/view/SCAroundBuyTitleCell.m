//
//  SCAroundBuyTitleCell.m
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCAroundBuyTitleCell.h"

@implementation SCAroundBuyTitleCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *scMineBitTitleCell = @"SCAroundBuyTitleCell";
    SCAroundBuyTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:scMineBitTitleCell];
    if (!cell) {
        cell = [[SCAroundBuyTitleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:scMineBitTitleCell];
    }
    cell.textLabel.text = @"附近团购";
    cell. selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
