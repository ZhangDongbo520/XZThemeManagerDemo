//
//  ViewController.m
//  XZThemeManagerDemo
//
//  Created by Zeasn on 2018/2/26.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "ViewController.h"
#import "XZThemeManager.h"

#import "UIView+XZTheme.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *themeButton;
@property (nonatomic, strong) UIImageView *themeImageView;

@property (nonatomic, strong) UIButton *normalButton;
@property (nonatomic, strong) UIButton *nightButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view configThemeMapModule:@"main" themeMap:@{kThemeKey_view_backgroundColor : @"view_backgroundColor"}];
    
    self.themeButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 300, 100)];
    [self.themeButton setTitle:@"按钮标题颜色换肤效果" forState:UIControlStateNormal];
    [self.themeButton configThemeMapModule:@"main" themeMap:@{kThemeKey_button_titleColor : @"themeButton_titleColor"}];
    [self.view addSubview:self.themeButton];
    
    self.themeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 300, 100, 100)];
    [self.themeImageView configThemeMapModule:@"main" themeMap:@{kThemeKey_imageView_image : @"themeImageView_image"}];
    [self.view addSubview:self.themeImageView];
    
    self.normalButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 500, 50, 50)];
    [self.normalButton setTitle:@"普通" forState:UIControlStateNormal];
    [self.normalButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.normalButton addTarget:self action:@selector(normalButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.normalButton];
    
    self.nightButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 500, 50, 50)];
    [self.nightButton setTitle:@"夜晚" forState:UIControlStateNormal];
    [self.nightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.nightButton addTarget:self action:@selector(nightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nightButton];
}

- (void)normalButtonClick {
    [[XZThemeManager shareManager] switchToTheme:XZThemeTypeNormal];
}

- (void)nightButtonClick {
    [[XZThemeManager shareManager] switchToTheme:XZThemeTypeNight];
}
@end
