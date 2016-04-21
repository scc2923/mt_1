//
//  SCMenuViewController.m
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCMenuViewController.h"

@interface SCMenuViewController ()

@end

@implementation SCMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   [self initNav];
}
-(void)initNav{
    self.title = self.titleStr;
    UIBarButtonItem *leftItem = [UIBarButtonItem initWithNormalImage:@"back" target:self action:@selector(OnBackBtn) width:23 height:23];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}
-(void)OnBackBtn{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
