//
//  SCMineHeaderView.m
//  meituan
//
//  Created by scc on 16/4/19.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCMineHeaderView.h"

@implementation SCMineHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)headViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"SCMineHeaderView";
    SCMineHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"SCMineHeaderView" owner:nil options:nil] lastObject];
        
        headView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_login"]];
    }
    
    return headView;
}

@end
