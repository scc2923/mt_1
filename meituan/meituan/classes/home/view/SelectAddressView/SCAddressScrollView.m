//
//  SCAddressScrollView.m
//  meituan
//
//  Created by scc on 16/4/2.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCAddressScrollView.h"

@implementation SCAddressScrollView
+(instancetype)scrollView{
    return [[[NSBundle mainBundle]loadNibNamed:@"SCAddressScrollView" owner:nil options:nil]lastObject];
}
-(void)areaButtonClick:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(areaButtonClick:) ]) {
        [self.delegate areaButtonClick:button];
    }
}
-(void)layoutSubviews{
    
}
- (IBAction)sender:(id)sender {
    if ([self.changeCityDelegate respondsToSelector:@selector(changeCityButtonClick:)]) {
        [self.changeCityDelegate changeCityButtonClick:sender];
    }
}
@end
