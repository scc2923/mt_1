//
//  SCTabBarViewController.m
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCTabBarViewController.h"
#import "SCNavigationController.h"
#import "SCTabBar.h"

#import "HomeViewController.h"
#import "MineViewController.h"
#import "MoreViewController.h"

#import "ShopViewController.h"
@interface SCTabBarViewController ()<tabbarDelegate>
@property(nonatomic,strong)SCTabBar *costomTabBar;
@end

@implementation SCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化tabbar
    [self setUpTabBar];
    
    //添加子控制器
    [self setUpAllChildViewController];

}
//取出系统自带的tabbar并把里面的按钮删除掉
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    for ( UIView * child in  self.tabBar.subviews) {
        
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

-(void)setUpTabBar{
    SCTabBar *customTabBar = [[SCTabBar alloc]init];
    customTabBar.delegate = self;
    customTabBar.frame = self.tabBar.bounds;
    self.costomTabBar = customTabBar;
    [self.tabBar addSubview:customTabBar];
}

-(void)tabBar:(SCTabBar *)tabBar didselectedButtonFrom:(int)from to:(int)to{
//    NSLog(@"%d, %d", from, to);
    self.selectedIndex = to;
//    NSLog(@"%lu", (unsigned long)self.selectedIndex);
    
}
-(void)setUpAllChildViewController{
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    [self setupChildViewController:homeVC title:@"首页" imageName:@"icon_tabbar_homepage" seleceImageName:@"icon_tabbar_homepage_selected"];
    
    ShopViewController *merchantVC = [[ShopViewController alloc]init];
    [self setupChildViewController:merchantVC title:@"商家" imageName:@"icon_tabbar_merchant_normal" seleceImageName:@"icon_tabbar_merchant_normal_selected"];
    
    MineViewController *mineVC = [[MineViewController alloc]init];
    [self setupChildViewController:mineVC title:@"我的" imageName:@"icon_tabbar_mine" seleceImageName:@"icon_tabbar_mine_selected"];
    
    MoreViewController *moreVC = [[MoreViewController alloc]init];
    [self setupChildViewController:moreVC title:@"更多" imageName:@"icon_tabbar_misc" seleceImageName:@"icon_tabbar_misc_selected"];
    
}
-(void)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName{
    controller.tabBarItem.title = title;//跟上面一样效果
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    
    //包装导航控制器
    SCNavigationController *nav = [[SCNavigationController alloc]initWithRootViewController:controller];

    [self addChildViewController:nav];
    
    [self.costomTabBar addTabBarButtonWithItem:controller.tabBarItem];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
