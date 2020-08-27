//
//  RootTabbarViewController.m
//  viewctrl
//
//  Created by 欧阳明择 on 2020/7/31.
//  Copyright © 2020 欧阳明择. All rights reserved.
//

#import "RootTabbarViewController.h"
#import "TabHomeViewController.h"
#import "TabMeViewController.h"
#import "TabCategoryViewController.h"
#import "ColorUtil.h"
#import "ImageUtil.h"
#import "FruitSalesDataListInteractor.h"

@interface RootTabbarViewController ()

@end

@implementation RootTabbarViewController

-(UINavigationController*)createNavWithViewController:(UIViewController *)viewController {
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController: viewController];
    return nav;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化Tabbar
    NSMutableArray* tabsArray = [[NSMutableArray alloc] init];
    // 第一个tabitem
    UIViewController* tabItem = [[TabHomeViewController alloc] init];
    tabItem.tabBarItem.title = @"首页";
    tabItem.tabBarItem.image = [[ImageUtil scaleToSize: [UIImage imageNamed:@"home"] size: CGSizeMake(30, 30)] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    tabItem.tabBarItem.selectedImage = [[ImageUtil scaleToSize: [UIImage imageNamed:@"home_selected"] size: CGSizeMake(30, 30)] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    [tabsArray addObject: [self createNavWithViewController: tabItem]];
    // 第二个tabItem
    tabItem = [[TabCategoryViewController alloc] init];
    tabItem.tabBarItem.title = @"分类";
    tabItem.tabBarItem.image = [[ImageUtil scaleToSize: [UIImage imageNamed:@"category"] size: CGSizeMake(30, 30)] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    tabItem.tabBarItem.selectedImage = [[ImageUtil scaleToSize: [UIImage imageNamed:@"category_selected"] size: CGSizeMake(30, 30)] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    [tabsArray addObject: [self createNavWithViewController: tabItem]];
    // 第三个tabItem
    tabItem = [[TabMeViewController alloc] init];
    tabItem.tabBarItem.title = @"我的";
    tabItem.tabBarItem.image = [[ImageUtil scaleToSize: [UIImage imageNamed:@"me"] size: CGSizeMake(30, 30)] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    tabItem.tabBarItem.selectedImage = [[ImageUtil scaleToSize: [UIImage imageNamed:@"me_selected"] size: CGSizeMake(30, 30)] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    [tabsArray addObject: [self createNavWithViewController: tabItem]];
//    [tabsArray addObject: tabItem];

    self.viewControllers = [tabsArray copy];

    self.view.backgroundColor = [UIColor whiteColor];
    self.selectedIndex = 0;
    
//    [UITabBar appearance] setBarStyle:(UIBarStyle)
//    [[UITabBar appearance] setBackgroundColor: [ColorUtil colorWithHexString: @"0xff0000" alpha: 1]];
    
    [FruitSalesDataListInteractor requestSalesList3];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self viewWillDisappear: false];
//    self.hidesBottomBarWhenPushed = NO;
}

- (void)viewWillAppear:(BOOL)animated {
//    NSDate* date1 = [NSDate date];
//    
//    NSDate* date2 = [NSDate date];
//    long timestampDate1 = [date1 timeIntervalSince1970] * 1000;
//    long timestampDate2 = [date2 timeIntervalSince1970] * 1000;
//    NSLog(@"%ld", timestampDate1);
//    NSLog(@"%ld", timestampDate2);
}

@end
