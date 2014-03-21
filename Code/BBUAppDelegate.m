//
//  BBUAppDelegate.m
//  Guide
//
//  Created by Boris Bügling on 21/03/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import "BBUAppDelegate.h"
#import "BBUAppStyle.h"
#import "BBULocationListViewController.h"
#import "BBULocationMapViewController.h"
#import "BBULocationPicturesViewController.h"

@implementation BBUAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [BBUAppStyle initAppearance];
    
    UITabBarController* tabBarController = [UITabBarController new];
    tabBarController.viewControllers = @[ [[UINavigationController alloc] initWithRootViewController:[BBULocationListViewController new]], [[UINavigationController alloc] initWithRootViewController:[BBULocationMapViewController new]], [[UINavigationController alloc] initWithRootViewController:[BBULocationPicturesViewController new]] ];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
