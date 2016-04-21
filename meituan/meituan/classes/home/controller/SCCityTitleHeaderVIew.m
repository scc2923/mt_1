//
//  SCCityTitleHeaderVIew.m
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCCityTitleHeaderVIew.h"

@implementation SCCityTitleHeaderVIew
+ (instancetype)headViewWithTableView:(UITableView *)tableView {
    static NSString *ID = @"SCCityTitleHeaderVIew";
    SCCityTitleHeaderVIew *headView = (UITableViewCell *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"SCCityTitleHeaderVIew" owner:nil options:nil] lastObject];
    }
    headView.backgroundColor = separaterColor;
    
    return headView;
}

-(void)setKeyStr:(NSString *)keyStr{
    _keyStr = keyStr;
    self.titleLabel.text = keyStr;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
