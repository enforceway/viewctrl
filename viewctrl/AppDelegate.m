//
//  AppDelegate.m
//  viewctrl
//
//  Created by 欧阳明择 on 2020/7/31.
//  Copyright © 2020 欧阳明择. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTabbarViewController.h"

@interface AppDelegate ()

@property(nonatomic, strong) UITabBarController* tabbarCtrl;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    self.tabbarCtrl = [[RootTabbarViewController alloc] init];
    self.window.rootViewController = self.tabbarCtrl;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
