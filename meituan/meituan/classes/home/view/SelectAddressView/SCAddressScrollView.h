//
//  SCAddressScrollView.h
//  meituan
//
//  Created by scc on 16/4/2.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCAddressScrollViewButtonDelegate <NSObject>
@optional
-(void)areaButtonClick:(UIButton *)button;
@end

@protocol SCChangeCityButtonDelegate <NSObject>
@optional
-(void)changeCityButtonClick:(UIButton *)button;
@end
@interface SCAddressScrollView : UIView
@property (weak, nonatomic) IBOutlet UIScrollView *scrollVIew;

+(instancetype)scrollView;
- (IBAction)sender:(id)sender;
@property(nonatomic,weak)id<SCAddressScrollViewButtonDelegate>delegate;
@property(nonatomic,weak)id<SCChangeCityButtonDelegate>changeCityDelegate;
@end
