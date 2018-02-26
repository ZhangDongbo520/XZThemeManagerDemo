//
//  XZThemeManager.h
//  XZThemeManagerDemo
//
//  Created by dreamer on 2018/1/26.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "XZThemeConstants.h"

typedef NS_ENUM(NSInteger, XZThemeType) {
    XZThemeTypeNormal,//正常模式
    XZThemeTypeNight//夜晚模式
};

@interface XZThemeManager : NSObject

// 主题管理者单例
+ (instancetype)shareManager;

// 切换主题
- (void)switchToTheme:(XZThemeType)themeType;

// 根据图片标识获取对应模块的图片
- (UIImage *)pngResourceForModule:(NSString *)module picName:(NSString *)picName;

// 根据颜色标识获取对应模块的颜色
- (UIColor *)colorResourceForModule:(NSString *)module colorName:(NSString *)colorName;


+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end
