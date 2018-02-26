//
//  AppDelegate.m
//  XZThemeManagerDemo
//
//  Created by Zeasn on 2018/2/26.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "AppDelegate.h"

#import "XZThemeManager.h"

#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:kCurrentTheme]) {
        NSNumber *currentTheme = [[NSUserDefaults standardUserDefaults] valueForKey:kCurrentTheme];
        [[XZThemeManager shareManager] switchToTheme:[currentTheme integerValue]];
    } else {
        [[XZThemeManager shareManager] switchToTheme:XZThemeTypeNormal];
    }
    
    return YES;
}

@end
