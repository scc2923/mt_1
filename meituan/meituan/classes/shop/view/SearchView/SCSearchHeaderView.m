//
//  SCSearchHeaderView.m
//  JFMeiTuan
//
//  Created by scc on 16/4/13.
//  Copyright © 2016年 JF. All rights reserved.
//

#import "SCSearchHeaderView.h"

@implementation SCSearchHeaderView

+ (instancetype)headViewWithTableView:(UITableView *)tableView {
    static NSString *ID = @"SCSearchHeaderView";
    SCSearchHeaderView *headView = (UITableViewCell *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"SCSearchHeaderView" owner:nil options:nil] lastObject];
    }
    headView.backgroundColor = separaterColor;
    return headView;
}


@end
