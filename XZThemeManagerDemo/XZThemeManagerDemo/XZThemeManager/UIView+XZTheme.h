//
//  UIView+XZTheme.h
//  XZThemeManagerDemo
//
//  Created by Zeasn on 2018/2/26.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XZTheme)

- (void)configThemeMapModule:(NSString *)module themeMap:(NSDictionary *)themeMap;

@property (nonatomic, copy) NSString *module;
@property (nonatomic, copy) NSDictionary *themeMap;

@end
